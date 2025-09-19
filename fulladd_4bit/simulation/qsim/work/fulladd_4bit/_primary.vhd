library verilog;
use verilog.vl_types.all;
entity fulladd_4bit is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic;
        s               : out    vl_logic_vector(3 downto 0);
        cout            : out    vl_logic
    );
end fulladd_4bit;
