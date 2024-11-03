transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -incr "+incdir+../../../vivado_systolic.gen/sources_1/ip/CORTEXM3_AXI_0/rtl" -l xil_defaultlib \
"../../../../hardware/systolic_array_rtl/fifo_inject.sv" \
"../../../../hardware/systolic_array_rtl/systolic_control.sv" \


vlog -work xil_defaultlib \
"glbl.v"

