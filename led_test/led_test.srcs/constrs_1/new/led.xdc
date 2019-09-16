set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN U18 [get_ports sys_clk]

set_property IOSTANDARD LVCMOS33 [get_ports led]
set_property PACKAGE_PIN R19 [get_ports led]

create_clock -period 20.000 -name sys_clk -waveform {0.000 10.000} [get_ports sys_clk]
