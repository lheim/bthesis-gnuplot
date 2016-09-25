#!/usr/local/bin/gnuplot


#DATA IS FINE FOR THE MOMENT



set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead


# legende verschieben
set key top left
# line styles
set colorsequence podo
set style line 1 lt 1 lw 2 ps 2
set style line 2 lt 2 lw 2 ps 2
set style line 3 lt 3 lw 2 ps 2
set style line 4 lt 4 lw 2 ps 2
set style line 5 lt 5 lw 2 ps 2
set style line 6 lt 6 lw 2 ps 2


set xlabel 'Sample Rate [MS/s]'


containers = "CPU10perc CPU20perc 25CPU CPU50perc CPU80perc nolimit"

container1 = "../benchmark_log_1machine_1usrp_nop/benchS_CPU10perc_nop_export_v3.csv"
container2 = "../benchmark_log_1machine_1usrp_nop/benchS_CPU20perc_nop_export_v3.csv"
container3 = "../benchmark_log_1machine_1usrp_nop/benchS_25CPU_nop_export_v3.csv"
container4 = "../benchmark_log_1machine_1usrp_nop/benchS_CPU50perc_nop_export_v3.csv"
container5 = "../benchmark_log_1machine_1usrp_nop/benchS_CPU80perc_nop_export_v3.csv"
container6 = "../benchmark_log_1machine_1usrp_nop/benchS_nolimit_nop_export_v3.csv"

#################
###USING THOSE###
#################

set xrange [0:30]

# received samples
set ylabel 'Number of Received Samples'
set output '../plots/constraints/received.eps'


plot container1 using 1:"uhd_received mean" with linespoints title '100ms quota' ls 1, \
  container2 using 1:"uhd_received mean" with linespoints title '200ms quota' ls 2, \
  container3 using 1:"uhd_received mean" with linespoints title '250ms quota' ls 3, \
  container4 using 1:"uhd_received mean" with linespoints title '500ms quota' ls 4, \
  container5 using 1:"uhd_received mean" with linespoints title '800ms quota' ls 5, \
  container6 using 1:"uhd_received mean" with linespoints title 'no constraints' ls 6, \

# plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/benchS_%s_nop_export_v3.csv', name) using 1:"uhd_received mean":"uhd_received std" with yerrorbars title name ps 2,


! epstopdf ../plots/constraints/received.eps
! rm ../plots/constraints/received.eps

# received samples
set ylabel 'Number of Transmitted Samples'
set output '../plots/constraints/transmitted.eps'


plot container1 using 1:"uhd_transmitted mean" with linespoints title '100ms quota' ls 1, \
  container2 using 1:"uhd_transmitted mean" with linespoints title '200ms quota' ls 2, \
  container3 using 1:"uhd_transmitted mean" with linespoints title '250ms quota' ls 3, \
  container4 using 1:"uhd_transmitted mean" with linespoints title '500ms quota' ls 4, \
  container5 using 1:"uhd_transmitted mean" with linespoints title '800ms quota' ls 5, \
  container6 using 1:"uhd_transmitted mean" with linespoints title 'no constraints' ls 6, \

# plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/benchS_%s_nop_export_v3.csv', name) using 1:"uhd_received mean":"uhd_received std" with yerrorbars title name ps 2,

! epstopdf ../plots/constraints/transmitted.eps
! rm ../plots/constraints/transmitted.eps

# dropped samples
set ylabel 'Number of Dropped Samples'
set output '../plots/constraints/dropped.eps'


plot container1 using 1:"uhd_dropped mean" with linespoints title '100ms quota' ls 1, \
  container2 using 1:"uhd_dropped mean" with linespoints title '200ms quota' ls 2, \
  container3 using 1:"uhd_dropped mean" with linespoints title '250ms quota' ls 3, \
  container4 using 1:"uhd_dropped mean" with linespoints title '500ms quota' ls 4, \
  container5 using 1:"uhd_dropped mean" with linespoints title '800ms quota' ls 5, \
  container6 using 1:"uhd_dropped mean" with linespoints title 'no constraints' ls 6, \

# plot for [name in containers] sprintf('../benchmark_log_1machine_1usrp_nop/benchS_%s_nop_export_v3.csv', name) using 1:"uhd_received mean":"uhd_received std" with yerrorbars title name ps 2,

! epstopdf ../plots/constraints/dropped.eps
! rm ../plots/constraints/dropped.eps




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
