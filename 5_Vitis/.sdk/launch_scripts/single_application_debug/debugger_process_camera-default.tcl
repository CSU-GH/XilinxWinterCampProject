connect -url tcp:127.0.0.1:3121
source /home/Xilinx/Vitis/2020.1/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS1 210512180081" && level==0 && jtag_device_ctx=="jsn-JTAG-HS1-210512180081-04720093-0"}
fpga -file /home/guohui/Work/HLS_Vivado_Vitis_Prj/Process_Camera/Process_Camera_Vitis/Process_Camera/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/guohui/Work/HLS_Vivado_Vitis_Prj/Process_Camera/Process_Camera_Vitis/design_1_wrapper/export/design_1_wrapper/hw/design_1_wrapper.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/guohui/Work/HLS_Vivado_Vitis_Prj/Process_Camera/Process_Camera_Vitis/design_1_wrapper/export/design_1_wrapper/sw/design_1_wrapper/boot/fsbl.elf
set bp_10_59_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_10_59_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/guohui/Work/HLS_Vivado_Vitis_Prj/Process_Camera/Process_Camera_Vitis/Process_Camera/Debug/Process_Camera.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
