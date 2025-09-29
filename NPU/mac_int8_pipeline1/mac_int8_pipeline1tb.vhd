library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mac_int8_pipeline1tb is
end entity mac_int8_pipeline1tb;

architecture behavior of mac_int8_pipeline1tb is

    -- 1. Component Declaration
    component mac_int8_pipeline1 is
        generic(acc_width : integer:=32;
                  sat_en : boolean:=true );
        port(clk, rst_n, en, clr :in std_logic;
              a, b :in std_logic_vector(7 downto 0);
              acc_in :in std_logic_vector(acc_width-1 downto 0);
              acc_out :out std_logic_vector(acc_width-1 downto 0));
    end component;

    -- 2. Constants and Signals
    constant CLK_PERIOD : time := 10 ns;

    signal clk_tb     : std_logic := '0';
    signal rst_n_tb   : std_logic;
    signal en_tb      : std_logic;
    signal clr_tb     : std_logic;
    signal a_tb       : std_logic_vector(7 downto 0);
    signal b_tb       : std_logic_vector(7 downto 0);
    signal acc_in_tb  : std_logic_vector(31 downto 0);
    signal acc_out_tb : std_logic_vector(31 downto 0);
    
    -- Optional: for easier viewing in simulator
    signal acc_out_s  : signed(31 downto 0);

begin

    -- 3. Instantiate the UUT
    UUT: mac_int8_pipeline1
        generic map (
            acc_width => 32,
            sat_en    => false
        )
        port map (
            clk     => clk_tb,
            rst_n   => rst_n_tb,
            en      => en_tb,
            clr     => clr_tb,
            a       => a_tb,
            b       => b_tb,
            acc_in  => acc_in_tb,
            acc_out => acc_out_tb
        );

    -- Optional: for easier viewing
    acc_out_s <= signed(acc_out_tb);

    -- 4. Clock Process
    clk_tb <= not clk_tb after CLK_PERIOD / 2;

    -- 5. Stimulus Process (The Main Test Flow)
    stimulus_process: process
    begin
        report "--- Pipeline Simulation Started ---";
        
        -- Initialization and Reset
        rst_n_tb <= '0';
        en_tb    <= '0';
        clr_tb   <= '0';
        a_tb     <= (others => '0');
        b_tb     <= (others => '0');
        acc_in_tb<= (others => '0');
        wait for CLK_PERIOD * 2;
        rst_n_tb <= '1';
        report "Reset released. DUT is active.";
        wait for CLK_PERIOD; -- T0

        ----------------------------------------------------------------------
        -- Test Case 1: Latency Verification
        ----------------------------------------------------------------------
        report "--- Test Case 1: Latency Verification ---";
        -- T1: Input A (5*10). acc_out should still be 0.
        report "T1: Input A (5*10).";
        en_tb <= '1';
        clr_tb <= '0';
        a_tb <= std_logic_vector(to_signed(5, 8));
        b_tb <= std_logic_vector(to_signed(10, 8));
        wait for CLK_PERIOD;

        -- T2: Input B (-2*3). At the start of T2, acc_out is still 0.
        report "T2: Input B (-2*3). Expect acc_out to become 50 (from A) at the END of this cycle.";
        acc_in_tb <= acc_out_tb; -- Feedback acc_out (which is 0)
        en_tb <= '1';
        a_tb <= std_logic_vector(to_signed(-2, 8));
        b_tb <= std_logic_vector(to_signed(3, 8));
        wait for CLK_PERIOD;

        -- T3: Input C (4*4). At the start of T3, acc_out is 50.
        report "T3: Input C (4*4). Expect acc_out to become 44 (50 + (-6), from B) at the END of this cycle.";
        acc_in_tb <= acc_out_tb; -- Feedback acc_out (which is 50)
        en_tb <= '1';
        a_tb <= std_logic_vector(to_signed(4, 8));
        b_tb <= std_logic_vector(to_signed(4, 8));
        wait for CLK_PERIOD;

        wait for CLK_PERIOD * 3; -- Wait for the pipeline to flush

        ----------------------------------------------------------------------
        -- Test Case 2: Throughput and Enable
        ----------------------------------------------------------------------
        report "--- Test Case 2: Throughput and Enable ---";
        acc_in_tb <= (others => '0');
        
        -- T4: Input D (1*10)
        report "T4: Input D (1*10).";
        en_tb <= '1';
        a_tb <= std_logic_vector(to_signed(1, 8));
        b_tb <= std_logic_vector(to_signed(10, 8));
        wait for CLK_PERIOD;
        
        -- T5: Input E (2*10)
        report "T5: Input E (2*10).";
        acc_in_tb <= acc_out_tb;
        a_tb <= std_logic_vector(to_signed(2, 8));
        b_tb <= std_logic_vector(to_signed(10, 8));
        wait for CLK_PERIOD;
        
        -- T6: Input F (3*10)
        report "T6: Input F (3*10).";
        acc_in_tb <= acc_out_tb;
        a_tb <= std_logic_vector(to_signed(3, 8));
        b_tb <= std_logic_vector(to_signed(10, 8));
        wait for CLK_PERIOD;

        -- T7: Input G (ignored) because en='0'
        report "T7: Input G (ignored). en='0'.";
        acc_in_tb <= acc_out_tb;
        en_tb <= '0';
        a_tb <= std_logic_vector(to_signed(99, 8));
        b_tb <= std_logic_vector(to_signed(99, 8));
        wait for CLK_PERIOD;

        -- T8: Input H (4*10)
        report "T8: Input H (4*10).";
        acc_in_tb <= acc_out_tb;
        en_tb <= '1';
        a_tb <= std_logic_vector(to_signed(4, 8));
        b_tb <= std_logic_vector(to_signed(10, 8));
        wait for CLK_PERIOD;
        
        wait for CLK_PERIOD * 3; -- Wait for the pipeline to flush

        ----------------------------------------------------------------------
        -- Test Case 3: Clear Functionality
        ----------------------------------------------------------------------
        report "--- Test Case 3: Clear Functionality ---";
        
        -- T10: Input I (7*7) to fill the pipeline
        report "T10: Input I (7*7).";
        acc_in_tb <= (others => '0');
        en_tb <= '1';
        clr_tb <= '0';
        a_tb <= std_logic_vector(to_signed(7, 8));
        b_tb <= std_logic_vector(to_signed(7, 8));
        wait for CLK_PERIOD;
        
        -- T11: Input J (8*8) with clr='1'
        report "T11: Input J (8*8) with clr='1'.";
        acc_in_tb <= acc_out_tb;
        clr_tb <= '1'; -- Activate synchronous clear
        en_tb <= '1';
        a_tb <= std_logic_vector(to_signed(8, 8));
        b_tb <= std_logic_vector(to_signed(8, 8));
        wait for CLK_PERIOD;
        
        -- T12: Input K (1*1). clr is de-asserted.
        report "T12: Input K (1*1). acc_out should be 0 from the clear.";
        acc_in_tb <= acc_out_tb; -- Should be feedbacking 0
        clr_tb <= '0';
        en_tb <= '1';
        a_tb <= std_logic_vector(to_signed(1, 8));
        b_tb <= std_logic_vector(to_signed(1, 8));
        wait for CLK_PERIOD;

        report "--- Simulation Finished ---";
        wait; -- Will wait forever
    end process;

end architecture behavior;