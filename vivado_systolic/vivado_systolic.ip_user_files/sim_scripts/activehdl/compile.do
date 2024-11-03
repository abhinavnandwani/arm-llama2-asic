transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../vivado_systolic.gen/sources_1/ip/CORTEXM3_AXI_0/rtl" -l xil_defaultlib \
"../../../../hardware/systolic_array_rtl/fifo_inject.sv" \
"../../../../hardware/systolic_array_rtl/systolic_control.sv" \


vlog -work xil_defaultlib \
"glbl.v"

