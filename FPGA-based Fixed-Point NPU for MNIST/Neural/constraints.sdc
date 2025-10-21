# 250 MHz 時脈，50% 佔空比（4ns 週期、上升緣 0ns、下降緣 2ns）
create_clock -name sys_clk -period 4.000 -waveform {0.000 2.000} [get_ports {clk}]

# 自動推導 PLL 衍生時脈與不確定性（建議保留）
derive_pll_clocks
derive_clock_uncertainty