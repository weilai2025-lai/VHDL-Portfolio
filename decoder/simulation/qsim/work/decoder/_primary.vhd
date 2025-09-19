library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        Din             : in     vl_logic_vector(2 downto 0);
        Dout            : out    vl_logic_vector(7 downto 0)
    );
end decoder;
