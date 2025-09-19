library verilog;
use verilog.vl_types.all;
entity fulladd_4bit_generate_vlg_check_tst is
    port(
        cout            : in     vl_logic;
        s               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end fulladd_4bit_generate_vlg_check_tst;
