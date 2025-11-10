# ==================== 時鐘定義 ====================
create_clock -name s_axi_aclk -period 10.0 -waveform {0 5} [get_ports s_axi_aclk]
# 時鐘週期 10ns = 100MHz，根據你的需求調整

# ==================== 時鐘不確定性 ====================
set_clock_uncertainty -setup 0.5 [get_clocks s_axi_aclk]
set_clock_uncertainty -hold 0.2 [get_clocks s_axi_aclk]

# ==================== 輸入約束 ====================
# AXI-Stream 輸入
# 只抓 axis_in_data[<任何東西>] 的位元，不會抓到 *_ready
set in_bits [get_ports {axis_in_data\[*\]}]

set_input_delay -clock s_axi_aclk -max 3.0 -add_delay [list $in_bits axis_in_data_valid]
set_input_delay -clock s_axi_aclk -min 1.0 -add_delay [list $in_bits axis_in_data_valid]
set_input_delay -clock s_axi_aclk -max 3.0 [get_ports axis_in_data_valid]
set_input_delay -clock s_axi_aclk -min 1.0 [get_ports axis_in_data_valid]

# 權重/偏差輸入
set_input_delay -clock s_axi_aclk -max 3.0 [get_ports {weightValue*}]
set_input_delay -clock s_axi_aclk -min 1.0 [get_ports {weightValue*}]
set_input_delay -clock s_axi_aclk -max 3.0 [get_ports {biasValue*}]
set_input_delay -clock s_axi_aclk -min 1.0 [get_ports {biasValue*}]
set_input_delay -clock s_axi_aclk -max 3.0 [get_ports {weightValid biasValid}]
set_input_delay -clock s_axi_aclk -min 1.0 [get_ports {weightValid biasValid}]

# 配置輸入
set_input_delay -clock s_axi_aclk -max 3.0 [get_ports {config_layer_num*}]
set_input_delay -clock s_axi_aclk -min 1.0 [get_ports {config_layer_num*}]
set_input_delay -clock s_axi_aclk -max 3.0 [get_ports {config_neuron_num*}]
set_input_delay -clock s_axi_aclk -min 1.0 [get_ports {config_neuron_num*}]

# 重置信號（通常設為 false path）
set_false_path -from [get_ports s_axi_aresetn]

# ==================== 輸出約束 ====================
set_output_delay -clock s_axi_aclk -max 3.0 [get_ports {class_id*}]
set_output_delay -clock s_axi_aclk -min 1.0 [get_ports {class_id*}]
set_output_delay -clock s_axi_aclk -max 3.0 [get_ports class_valid]
set_output_delay -clock s_axi_aclk -min 1.0 [get_ports class_valid]
set_output_delay -clock s_axi_aclk -max 3.0 [get_ports axis_in_data_ready]
set_output_delay -clock s_axi_aclk -min 1.0 [get_ports axis_in_data_ready]

# ==================== 物理約束 ====================
# 負載電容
set_load 0.050 [all_outputs]
set_max_capacitance 0.010 [all_inputs]

# 轉換時間
set_max_transition 0.07 [current_design]

# ==================== 特殊約束 ====================
# 對於大型設計，可能需要額外的約束
set_max_fanout 20 [current_design]