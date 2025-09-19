library verilog;
use verilog.vl_types.all;
entity multiply_4bit is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        mul_out         : out    vl_logic_vector(7 downto 0)
    );
end multiply_4bit;
