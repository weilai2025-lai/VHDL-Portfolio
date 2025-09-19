library verilog;
use verilog.vl_types.all;
entity accumulator_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        w_en            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end accumulator_vlg_sample_tst;
