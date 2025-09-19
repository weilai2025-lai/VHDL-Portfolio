library verilog;
use verilog.vl_types.all;
entity accumulator is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        w_en            : in     vl_logic;
        acc_out         : out    vl_logic_vector(31 downto 0)
    );
end accumulator;
