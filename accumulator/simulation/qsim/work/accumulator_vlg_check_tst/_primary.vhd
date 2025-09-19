library verilog;
use verilog.vl_types.all;
entity accumulator_vlg_check_tst is
    port(
        acc_out         : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end accumulator_vlg_check_tst;
