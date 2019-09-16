connect -url tcp:127.0.0.1:3121
source K:/sola/isa_test_20190814/project_1/project_1.sdk/design_1_wrapper_hw_platform_1/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 0000139a20e901"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Platform Cable USB II 0000139a20e901" && level==0} -index 1
fpga -file K:/sola/isa_test_20190814/project_1/project_1.sdk/design_1_wrapper_hw_platform_1/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 0000139a20e901"} -index 0
loadhw -hw K:/sola/isa_test_20190814/project_1/project_1.sdk/design_1_wrapper_hw_platform_1/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 0000139a20e901"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB II 0000139a20e901"} -index 0
dow K:/sola/isa_test_20190814/project_1/project_1.sdk/axi_lite_bare/Debug/axi_lite_bare.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB II 0000139a20e901"} -index 0
con
