set_clock_latency -source -early -max -rise  -0.52139 [get_ports {s_axi_aclk}] -clock s_axi_aclk 
set_clock_latency -source -early -max -fall  -0.547256 [get_ports {s_axi_aclk}] -clock s_axi_aclk 
set_clock_latency -source -late -max -rise  -0.52139 [get_ports {s_axi_aclk}] -clock s_axi_aclk 
set_clock_latency -source -late -max -fall  -0.547256 [get_ports {s_axi_aclk}] -clock s_axi_aclk 
