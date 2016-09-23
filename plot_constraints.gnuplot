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
#set logscale y


set title 'dropped v1'
set ylabel 'dropped samples'
set output '../plots/constraints/dropped.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/dropped.eps
! rm ../plots/constraints/dropped.eps

#unset logscale

# underflow samples
set title 'underflows v1'
set ylabel 'underflows samples'
set output '../plots/constraints/underflows.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/underflows.eps
! rm ../plots/constraints/underflows.eps


# overflows samples
set title 'overflows v1'
set ylabel 'overflows samples'
set output '../plots/constraints/overflows.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_overflows mean":"uhd_overflows std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/overflows.eps
! rm ../plots/constraints/overflows.eps

# sequence samples
set title 'sequence v1'
set ylabel 'sequence samples'
set output '../plots/constraints/sequence.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_sequence mean":"uhd_sequence std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/sequence.eps
! rm ../plots/constraints/sequence.eps

# late samples
set title 'late v1'
set ylabel 'late samples'
set output '../plots/constraints/late.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_late mean":"uhd_late std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/late.eps
! rm ../plots/constraints/late.eps


# late samples
set title 'timeouts v1'
set ylabel 'timeouts samples'
set output '../plots/constraints/timeouts.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"uhd_timeouts mean":"uhd_timeouts std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/timeouts.eps
! rm ../plots/constraints/timeouts.eps


# load diff samples
set title 'load diff v1'
set ylabel 'load diff in percent'
set output '../plots/constraints_v2/load_diff.eps'

plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/bench_%s_nop_export_v3.csv', name) using 1:"load_diff mean":"load_diff std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints_v2/load_diff.eps
! rm ../plots/constraints_v2/load_diff.eps



unset xrange
