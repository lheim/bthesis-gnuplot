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


containers = "5_1CPU 5_2CPU 5_25CPU 5_50CPU 7_nolimit"


set xrange [0:30]

# transmitted samples
set title 'transmitted v1'
set ylabel 'transmitted samples'
set output '../plots/constraints_v2/transmitted.eps'

plot for [name in containers] sprintf('../benchmark_log_1M_1U/bench%s_export_v3.csv', name) using 1:"uhd_transmitted mean":"uhd_transmitted std" with yerrorbars title name ps 2,

! epstopdf ../plots/constraints_v2/transmitted.eps
! rm ../plots/constraints_v2/transmitted.eps



# received samples
set title 'received v1'
set ylabel 'received samples'
set output '../plots/constraints_v2/received.eps'

plot for [name in containers] sprintf('../benchmark_log_1M_1U/bench%s_export_v3.csv', name) using 1:"uhd_received mean":"uhd_received std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints_v2/received.eps
! rm ../plots/constraints_v2/received.eps


# dropped samples
set title 'dropped v1'
set ylabel 'dropped samples'
set output '../plots/constraints_v2/dropped.eps'

plot for [name in containers] sprintf('../benchmark_log_1M_1U/bench%s_export_v3.csv', name) using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints_v2/dropped.eps
! rm ../plots/constraints_v2/dropped.eps



# underflow samples
set title 'underflows v1'
set ylabel 'underflows samples'
set output '../plots/constraints_v2/underflows.eps'

plot for [name in containers] sprintf('../benchmark_log_1M_1U/bench%s_export_v3.csv', name) using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints_v2/underflows.eps
! rm ../plots/constraints_v2/underflows.eps


# load diff samples
set title 'load diff v1'
set ylabel 'load diff in percent'
set output '../plots/constraints_v2/load_diff.eps'

plot for [name in containers] sprintf('../benchmark_log_1M_1U/bench%s_export_v3.csv', name) using 1:"load_diff mean":"load_diff std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints_v2/load_diff.eps
! rm ../plots/constraints_v2/load_diff.eps




unset xrange
