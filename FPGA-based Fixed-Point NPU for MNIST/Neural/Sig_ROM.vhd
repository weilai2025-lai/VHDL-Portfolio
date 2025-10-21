library IEEE;
library STD;
use STD.textio.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use work.nn_config.all;

entity Sig_ROM is
  generic(
    inWidth       : integer := SIGMOID_SIZE;     -- 例如 5 → 深度 32
    dataWidth     : integer := 16;
    sigmoid_file  : string  := "sigContent.mif"; -- 檔名（不含路徑）
    SIM_READ_FILE : boolean := SIM_READ_FILE     -- true=模擬文字檔; false=合成 MIF
  );
  port(
    clk    : in  std_logic;
    x      : in  std_logic_vector(inWidth-1 downto 0);
    output : out std_logic_vector(dataWidth-1 downto 0)
  );
end entity;

architecture behavior of Sig_ROM is
  type mem_t is array (0 to (2**inWidth)-1) of std_logic_vector(dataWidth-1 downto 0);

  -- 合成時固定前綴目錄（與你先前一致）
  constant SYN_BASE     : string := "C:/VHDL_training/Neural/weight_syn/";
  constant SIG_SYN_PATH : string := SYN_BASE & sigmoid_file;

  -- y 同步（1 拍）
  signal y : std_logic_vector(inWidth-1 downto 0) := (others => '0');

  -- ========= 模擬用讀檔：每行一筆 0/1 字串 =========
  -- synthesis translate_off
  impure function readmemb(fname : string) return mem_t is
    file f      : text open read_mode is fname;
    variable l  : line;
    variable m  : mem_t := (others => (others => '0'));
    variable i  : integer := 0;
    variable w  : std_logic_vector(dataWidth-1 downto 0);
  begin
    while (not endfile(f)) and (i < m'length) loop
      readline(f, l);
      read(l, w);
      m(i) := w; 
      i    := i + 1;
    end loop;
    return m;
  end function;
  -- synthesis translate_on
begin
  ----------------------------------------------------------------
  -- y 寫入（同步）
  ----------------------------------------------------------------
  process(clk)
  begin
    if rising_edge(clk) then
      if signed(x) >= 0 then
        y <= std_logic_vector(signed(x) + to_signed(2**(inWidth-1), inWidth));
      else
        y <= std_logic_vector(signed(x) - to_signed(2**(inWidth-1), inWidth));
      end if;
    end if;
  end process;

  ----------------------------------------------------------------
  -- output 組合讀（與 Verilog 的 assign out = mem[y] 等效）
  ----------------------------------------------------------------
  -- synthesis translate_off
  SIM_GEN : if SIM_READ_FILE generate
    signal mem_sim : mem_t := readmemb(sigmoid_file);  -- 模擬：直接用檔名/相對路徑
  begin
    output <= mem_sim(to_integer(unsigned(y)));
  end generate SIM_GEN;
  -- synthesis translate_on

  SYN_GEN : if not SIM_READ_FILE generate
    signal mem_syn : mem_t;
    attribute ram_init_file : string;
    attribute ram_init_file of mem_syn : signal is SIG_SYN_PATH;  -- 合成：固定前綴
  begin
    output <= mem_syn(to_integer(unsigned(y)));
  end generate SYN_GEN;

end architecture;