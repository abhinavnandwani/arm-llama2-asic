transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+systolic_control  -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.systolic_control xil_defaultlib.glbl

do {systolic_control.udo}

run 1000ns

endsim

quit -force
