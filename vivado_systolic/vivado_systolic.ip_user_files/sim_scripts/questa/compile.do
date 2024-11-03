vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  -sv "+incdir+../../../vivado_systolic.gen/sources_1/ip/CORTEXM3_AXI_0/rtl" \
"../../../../hardware/systolic_array_rtl/fifo_inject.sv" \
"../../../../hardware/systolic_array_rtl/systolic_control.sv" \


vlog -work xil_defaultlib \
"glbl.v"

