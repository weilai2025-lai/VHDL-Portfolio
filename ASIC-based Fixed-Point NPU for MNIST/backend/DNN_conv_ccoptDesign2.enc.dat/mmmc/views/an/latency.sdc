set_clock_latency -source -early -max -rise  -0.720818 [get_ports {s_axi_aclk}] -clock s_axi_aclk 
set_clock_latency -source -early -max -fall  -0.766118 [get_ports {s_axi_aclk}] -clock s_axi_aclk 
set_clock_latency -source -late -max -rise  -0.720818 [get_ports {s_axi_aclk}] -clock s_axi_aclk 
set_clock_latency -source -late -max -fall  -0.766118 [get_ports {s_axi_aclk}] -clock s_axi_aclk 
