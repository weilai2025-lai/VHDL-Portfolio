library IEEE;
library STD;
use STD.textio.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.nn_config.all;

entity Weight_Memory is
  generic(
    layerNo       : integer := 1;
    neuronNo      : integer := 5;
    numWeight     : integer := 784;
    dataWidth     : integer := 16;
    weightFile    : string  := "w_1_15.mif";  -- 檔名（不含路徑）
    addressWidth  : integer := 10;
    SIM_READ_FILE : boolean := SIM_READ_FILE  -- true=模擬文字檔; false=合成MIF
  );
  port(
    clk, wen, ren : in  std_logic;
    wadd          : in  std_logic_vector(addressWidth-1 downto 0);
    radd          : in  std_logic_vector(addressWidth-1 downto 0);
    win           : in  std_logic_vector(dataWidth-1 downto 0);
    wout          : out std_logic_vector(dataWidth-1 downto 0)
  );
end entity;

architecture behavior of Weight_Memory is
  type memory_t is array (0 to numWeight-1) of std_logic_vector(dataWidth-1 downto 0);

  -- 合成時固定前綴目錄（避免在 generate 內宣告）
  constant SYN_BASE      : string := "C:/VHDL_training/Neural/weight_syn/";
  constant WEI_SYN_PATH  : string := SYN_BASE & weightFile;
begin
  ----------------------------------------------------------------------------
  -- ROM：PRETRAINED = true
  ----------------------------------------------------------------------------
  ROM_MODE : if PRETRAINED = true generate
  begin
    -- ================= 模擬：逐行讀 0/1 純文字 =================
    -- synthesis translate_off
    SIM_GEN : if SIM_READ_FILE generate
      impure function readmemb(fname : string) return memory_t is
        file f      : text open read_mode is fname;
        variable l  : line;
        variable mem: memory_t := (others => (others => '0'));
        variable i  : integer := 0;
        variable w  : std_logic_vector(dataWidth-1 downto 0);
      begin
        while (not endfile(f)) and (i < numWeight) loop
          readline(f, l);
          read(l, w);               -- 一行就是一個二進位字串
          mem(i) := w; i := i + 1;
        end loop;
        return mem;
      end function;

      signal mem_rom_sim : memory_t := readmemb(weightFile); -- 模擬用原檔名/路徑
    begin
      process(clk)
      begin
        if rising_edge(clk) then
          if ren = '1' then
            wout <= mem_rom_sim(to_integer(unsigned(radd)));
          end if;
        end if;
      end process;
    end generate SIM_GEN;
    -- synthesis translate_on

    -- ================= 合成：用 .mif（固定前綴目錄） =================
    SYN_GEN : if not SIM_READ_FILE generate
      signal mem_rom_syn : memory_t;
      attribute ram_init_file : string;
      attribute ram_init_file of mem_rom_syn : signal is WEI_SYN_PATH;
    begin
      process(clk)
      begin
        if rising_edge(clk) then
          if ren = '1' then
            wout <= mem_rom_syn(to_integer(unsigned(radd)));
          end if;
        end if;
      end process;
    end generate SYN_GEN;

  end generate ROM_MODE;

  ----------------------------------------------------------------------------
  -- RAM：PRETRAINED = false（外部可寫入）——語意維持不變
  ----------------------------------------------------------------------------
  RAM_MODE : if PRETRAINED = false generate
    signal mem_ram : memory_t := (others => (others => '0'));
  begin
    -- write
    process(clk)
    begin
      if rising_edge(clk) then
        if wen = '1' then
          mem_ram(to_integer(unsigned(wadd))) <= win;
        end if;
      end if;
    end process;

    -- read
    process(clk)
    begin
      if rising_edge(clk) then
        if ren = '1' then
          wout <= mem_ram(to_integer(unsigned(radd)));
        end if;
      end if;
    end process;
  end generate RAM_MODE;

end architecture;