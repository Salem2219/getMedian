add wave -position end  sim:/test/clk
add wave -position end  sim:/test/rst
add wave -position end  sim:/test/start
add wave -position end  sim:/test/n
add wave -position end  sim:/test/y
force -freeze sim:/test/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/test/rst 1 0
force -freeze sim:/test/rst 0 100
force -freeze sim:/test/start 1 0
force -freeze sim:/test/start 0 300
force -freeze sim:/test/n 0101 0
add wave -position end  sim:/test/median/control/current_state
add wave -position end  sim:/test/median/datapath/m1
add wave -position end  sim:/test/median/datapath/m2
add wave -position end  sim:/test/median/datapath/i
add wave -position end  sim:/test/median/datapath/j
add wave -position end  sim:/test/median/datapath/count