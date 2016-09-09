#!/usr/local/bin/gnuplot


#DATA IS FINE FOR THE MOMENT



set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead



# legende verschieben
set key top left



set xlabel 'sample rate [Ms/s]'


containers = "CPU10perc CPU20perc 25CPU CPU50perc CPU80perc nolimit"


set xrange [0:30]

# transmitted samples
set title 'transmitted v1'
set ylabel 'transmitted samples'
set output '../plots/constraints/transmitted.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_transmitted mean":"uhd_transmitted std" with yerrorbars title name ps 2,

! epstopdf ../plots/constraints/transmitted.eps
! rm ../plots/constraints/transmitted.eps



# received samples
set title 'received v1'
set ylabel 'received samples'
set output '../plots/constraints/received.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_received mean":"uhd_received std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/received.eps
! rm ../plots/constraints/received.eps


# dropped samples
set title 'dropped v1'
set ylabel 'dropped samples'
set output '../plots/constraints/dropped.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/dropped.eps
! rm ../plots/constraints/dropped.eps



# underflow samples
set title 'underflows v1'
set ylabel 'underflows samples'
set output '../plots/constraints/underflows.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/underflows.eps
! rm ../plots/constraints/underflows.eps



unset xrange
