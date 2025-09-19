library verilog;
use verilog.vl_types.all;
entity multiply_4bit_vlg_check_tst is
    port(
        mul_out         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end multiply_4bit_vlg_check_tst;
