library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.nn_config.all; 

entity DNN_tb_all is
end entity;

architecture sim of DNN_tb_all is
  -- Basic Settings
  constant TEST_COUNT : integer := 1000; -- Total number of test cases (0000~9999)
  -- Note: If running Gate Level Simulation (with SDF), running 10,000 cases will take a very long time (potentially days).
  -- Suggest changing this to 10 or 100 first to verify functionality.
  
  -- Path Settings (Please verify your folder name is correct; check for differences like Neuron_refin vs Neuron_refine)
  constant BASE_PATH : string := "/home/kpb1466/Neuron_refine/test_data/test_data_";
  
  -- Clock/Reset
  signal clk   : std_logic := '0';
  signal rstn  : std_logic := '0';
  constant T   : time := 10 ns;  -- Fixed to 10ns (100 MHz) to match your synthesis

  -- DUT I/O
  signal axis_in_data       : std_logic_vector(DATA_WIDTH-1 downto 0) := (others=>'0');
  signal axis_in_data_valid : std_logic := '0';
  signal axis_in_data_ready : std_logic;
  signal class_id           : std_logic_vector(3 downto 0);
  signal class_valid        : std_logic;
  
  -- Gate-level simulation usually requires power connections (if your netlist has these ports)
  --signal VDD : std_logic := '1';
  --signal VSS : std_logic := '0';

  -- Memory Array
  type mem_t is array (0 to 784) of std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sample : mem_t := (others => (others => '0'));

  -- Helper function: Convert integer to 4-digit string (e.g., 1 -> "0001")
  function to_string_4digits(n : integer) return string is
    variable s : string(1 to 4);
    variable temp : integer := n;
  begin
    for i in 4 downto 1 loop
        s(i) := character'val(48 + (temp mod 10)); -- ASCII '0' is 48
        temp := temp / 10;
    end loop;
    return s;
  end function;

begin
  -- Clock Generation
  clk <= not clk after T/2;

  -- DUT Instantiation
  -- Note: Gate Level Netlists usually remove generics and may have VDD/VSS
  dut: entity work.DNN
    port map (
      s_axi_aclk          => clk,
      s_axi_aresetn       => rstn,
      axis_in_data        => axis_in_data,
      axis_in_data_valid  => axis_in_data_valid,
      axis_in_data_ready  => axis_in_data_ready,
      class_id            => class_id,
      class_valid         => class_valid
      --VDD                 => VDD, -- Comment out if netlist does not have this port
      --VSS                 => VSS  -- Comment out if netlist does not have this port
    );

  -- Main Test Process
  process
    file f         : text;
    variable L     : line;
    variable v     : std_logic_vector(DATA_WIDTH-1 downto 0);
    variable f_status : file_open_status;
    variable file_name_str : string(1 to BASE_PATH'length + 4 + 4); -- Path + 0000 + .txt
    
    variable i     : integer; -- Index for reading file
    variable img_idx : integer; -- Image index 0~9999
    
    variable expected16 : std_logic_vector(DATA_WIDTH-1 downto 0);
    variable exp_id     : integer;
    variable got_id     : integer;
    
    constant TIMEOUT_CYC : integer := 200000;
    variable wait_cnt    : integer := 0;
    
    variable correct_cnt : integer := 0;
    variable accuracy    : real := 0.0;

  begin
    -- Initial wait
    wait for 100 ns;

    ------------------------------------------------------------
    -- Main Loop: Run all test data
    ------------------------------------------------------------
    for img_idx in 0 to TEST_COUNT-1 loop
        
        -- 1. Construct filename and open file
        -- Filename format: BASE_PATH + "0000" + ".txt"
        file_name_str := BASE_PATH & to_string_4digits(img_idx) & ".txt";
        
        file_open(f_status, f, file_name_str, read_mode);
        if f_status /= open_ok then
            report "ERROR: Could not open file " & file_name_str severity failure;
        end if;

        -- 2. Read data into sample array
        for i in 0 to 784 loop
             if endfile(f) then
                report "ERROR: Unexpected EOF in " & file_name_str severity failure;
             end if;
             readline(f, L);
             read(L, v);
             sample(i) <= v;
        end loop;
        file_close(f); -- Close after reading, prepare for next

        -- 3. Reset DUT (Ensure a clean state for each case)
        rstn <= '0';
        axis_in_data_valid <= '0';
        axis_in_data <= (others=>'0');
        wait for 20*T; 
        rstn <= '1';
        wait for 10*T;

        -- 4. Send 784 pixel data entries
        for i in 0 to 783 loop
            axis_in_data       <= sample(i);
            axis_in_data_valid <= '1';
            wait until rising_edge(clk);
            -- If your design has a ready handshake, you might need 'wait until ready='1'' here
        end loop;
        
        -- Transmission complete
        axis_in_data_valid <= '0';
        axis_in_data       <= (others=>'0');

        -- 5. Parse expected value (last line sample(784))
        expected16 := sample(784);
        exp_id     := to_integer(unsigned(expected16(3 downto 0)));

        -- 6. Wait for calculation result
        wait_cnt := 0;
        class_valid_wait_loop: while class_valid = '0' loop
            wait until rising_edge(clk);
            wait_cnt := wait_cnt + 1;
            if wait_cnt > TIMEOUT_CYC then
                report "TIMEOUT: class_valid not asserted for image " & integer'image(img_idx) severity error;
                exit class_valid_wait_loop; -- Exit wait loop, will cause comparison failure below
            end if;
        end loop;

        -- 7. Compare results
        if class_valid = '1' then
            got_id := to_integer(unsigned(class_id));
            if got_id = exp_id then
                correct_cnt := correct_cnt + 1;
                -- report "Image " & integer'image(img_idx) & ": PASS (Got " & integer'image(got_id) & ")";
            else
                report "Image " & integer'image(img_idx) & ": FAIL (Got " & integer'image(got_id) & ", Exp " & integer'image(exp_id) & ")" severity warning;
            end if;
        end if;
        
        -- Report progress every 100 images (to avoid excessive logging)
        if (img_idx + 1) mod 100 = 0 then
            report "Progress: " & integer'image(img_idx + 1) & "/" & integer'image(TEST_COUNT) & " completed.";
        end if;

        -- Wait for class_valid to drop or delay slightly to ensure separation for the next reset
        wait for 50*T;

    end loop; -- End of main loop

    ------------------------------------------------------------
    -- Final Report
    ------------------------------------------------------------
    accuracy := real(correct_cnt) / real(TEST_COUNT) * 100.0;
    
    report "========================================";
    report " TEST FINISHED ";
    report " Total Images : " & integer'image(TEST_COUNT);
    report " Correct      : " & integer'image(correct_cnt);
    report " Accuracy     : " & real'image(accuracy) & " %";
    report "========================================";

    assert false report "Simulation Completed Successfully." severity failure;
    wait;
  end process;

end architecture;