## BASYS3 Seven Segment Lab constraints
## Engineer: Adam Osman
## Project: ENGR230 BASYS3 Seven Segment Lab
## Board: BASYS3
## Vivado Version: 2018.2
##
## Source:
## Claude helped with code structure, comments, and debugging.
## Final testing and understanding of the design was done by Adam Osman.
##
## SW0 chooses the mode:
## SW0 = 0 -> Task 1 displays 3567
## SW0 = 1 -> Task 2 displays seconds 00-59


## Board clock, 100 MHz
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


## Center button used as reset
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


## SW0 is used to switch between Task 1 and Task 2
set_property PACKAGE_PIN V17 [get_ports SW0]
set_property IOSTANDARD LVCMOS33 [get_ports SW0]


## Seven segment cathodes
## seg[0] = CA
## seg[1] = CB
## seg[2] = CC
## seg[3] = CD
## seg[4] = CE
## seg[5] = CF
## seg[6] = CG

set_property PACKAGE_PIN W7 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN W6 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN U8 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN U5 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN V5 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN U7 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]


## Decimal point
set_property PACKAGE_PIN V7 [get_ports dp]
set_property IOSTANDARD LVCMOS33 [get_ports dp]


## Anodes control which digit is on
## an[0] = rightmost digit
## an[3] = leftmost digit

set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN W4 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
