############################################################
# 0) 基本：主時鐘 & Reset
############################################################
# 主時鐘（例：100 MHz → 10.000 ns 週期）
create_clock -name ACLK -period 10.000  [get_ports s_axi_aclk]

# Reset 為非同步（active-low），不做時序收斂 → 標成 false path
set_false_path -from [get_ports s_axi_aresetn]

# 建議自動套用時鐘不確定性（抖動/偏差）；若要手動，也可用 set_clock_uncertainty
derive_clock_uncertainty

############################################################
# 1) AXI-Stream 類同步 I/O（與 ACLK 同步）
#   - 若外部裝置也用同一顆 ACLK，I/O delay 就是「外部器件 tCO/tSU + 走線 + 邏輯」的預算。
#   - 沒有確切數字時，可先放保守暫定值（之後依 datasheet/量測再調整）。
############################################################

# === 輸入（外部 → FPGA）===
# 例：外部輸出至 FPGA 的最壞/最好到達時間（相對 ACLK 邊緣）
#    -max 用來檢查 setup；-min 用來檢查 hold
#    下列數字僅為範例（請改成你的板級預算）
set_input_delay  -clock ACLK -max 3.0 [get_ports {axis_in_data[*] axis_in_data_valid}]
set_input_delay  -clock ACLK -min 0.5 [get_ports {axis_in_data[*] axis_in_data_valid}]

# === 輸出（FPGA → 外部）===
# 例：外部對 FPGA 輸出的需求時間（我們要滿足對方的 setup/hold）
#    同樣 -max/-min 都要給
set_output_delay -clock ACLK -max 2.5 [get_ports {axis_in_data_ready class_id[*] class_valid}]
set_output_delay -clock ACLK -min 0.5 [get_ports {axis_in_data_ready class_id[*] class_valid}]

############################################################
# 2) 組態/權重介面（weight*/bias*/config_*）
#   你有兩種做法，擇一：
#   (A) 只在初始化期使用、非時序關鍵 → 直接 false path
#   (B) 在運行期也會同步切換，且與 ACLK 同步 → 當作同步輸入去約束 input delay
############################################################

# --- (A) 若僅在 init 期更動，不要求時序收斂 ---
# 直接排除在 STA 外（最簡單）
#set_false_path -from [get_ports {weightValid biasValid weightValue[*] biasValue[*] config_layer_num[*] config_neuron_num[*]}]

# --- (B) 若這些腳位在運行期也會跟 ACLK 同步切換 ---
# 以與 AXI-Stream 相同的方式給 input delay（請改成你的實際預算）
#set_input_delay -clock ACLK -max 3.0 [get_ports {weightValid biasValid weightValue[*] biasValue[*] config_layer_num[*] config_neuron_num[*]}]
#set_input_delay -clock ACLK -min 0.5 [get_ports {weightValid biasValid weightValue[*] biasValue[*] config_layer_num[*] config_neuron_num[*]}]

############################################################
# 3) 產生/衍生時鐘（如果你有用 ALTPLL/Clock Control）
#    你目前 zyNet 沒 PLL 就先略過；未來有 PLL 再打開：
############################################################
# derive_pll_clocks

############################################################
# 4) 多時鐘域（未來如果新增其他不相關時鐘，務必宣告非同步關係）
# set_clock_groups -asynchronous -group {ACLK} -group {OTHER_CLK}
############################################################

############################################################
# 5) 基本健康檢查（可留著方便在 TimeQuest Console 快速呼叫）
#   執行：在 TimeQuest 的 Console 直接 source 這個檔或 copy 指令貼上
############################################################
# report_clocks
# report_unconstrained_paths
# report_timing_summary