#!/usr/local/bin/gnuplot

# LOOKS FINE
### 2CONTAINER 1MACHINE ###



set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead

# line styles
set style line 1 lt 1 lc rgb "red" ps 3 pt 7
set style line 2 lt 1 lc rgb "blue" ps 3 pt 9
set style line 3 lt 1 lc rgb "orange" ps 3 pt 13
set style line 4 lt 1 lc rgb "green" ps 3 pt 5
set style line 5 lt 1 lc rgb '#66A61E' # dark lime green
set style line 6 lt 1 lc rgb '#E6AB02' # dark banana
set style line 7 lt 1 lc rgb '#A6761D' # dark tan
set style line 8 lt 1 lc rgb '#666666' # dark gray


set colorsequence podo
set style line 1 lt 1 lw 3 ps 3
set style line 2 lt 2 lw 3 ps 3
set style line 3 lt 3 lw 2 ps 2
set style line 4 lt 4 lw 2 ps 2
set style line 5 lt 5 lw 2 ps 2
set style line 6 lt 6 lw 2 ps 2

set xlabel 'Sample Rate [MS/s]'
two_container = '2 container 1machine'
one_container = '1 container 1machine'

#two_container_file = '../benchmark_log_1machine_2usrp/bench3_nolimit_1_export_v3.csv'
two_container_file = '../benchmark_log_1M_2U/bench8_nolimit_1_export_v3.csv'
one_container_file = '../benchmark_log_1machine_1usrp_nop/bench_nolimit_nop_export_v3.csv'

set key top left

#################
###USING THOSE###
#################

set xrange [0:22]
set yrange [0:220000000]

# received samples
set ylabel 'Number of Received Samples'
set output '../plots/section2_v2/received.eps'

plot two_container_file using 1:"uhd_received mean":"uhd_received std" with yerrorbars title 'First Container' ls 1, \
  two_container_file using 1:"uhd_received 2 mean":"uhd_received 2 std" with yerrorbars title 'Second Container' ls 2

! epstopdf ../plots/section2_v2/received.eps
! rm ../plots/section2_v2/received.eps


#transmitted samples
set ylabel 'Number of Transmitted Samples'
set output '../plots/section2_v2/transmitted.eps'

plot two_container_file using 1:"uhd_transmitted mean":"uhd_transmitted std" with yerrorbars title 'First Container' ls 1, \
  two_container_file using 1:"uhd_transmitted 2 mean":"uhd_transmitted std" with yerrorbars title 'Second Container' ls 2


! epstopdf ../plots/section2_v2/transmitted.eps
! rm ../plots/section2_v2/transmitted.eps

unset yrange
set xrange[0:15]
#eth tx
set ylabel 'GbE Interface Transmission Rate [Mbit/s]'
set output '../plots/section2_v2/eth_tx.eps'

plot two_container_file using 1:33:34 with yerrorbars title 'Host running two containers' ls 1
! epstopdf ../plots/section2_v2/eth_tx.eps
! rm ../plots/section2_v2/eth_tx.eps


#eth rx
set ylabel 'GbE Interface Receiving Rate [Mbit/s]'
set output '../plots/section2_v2/eth_rx.eps'

plot two_container_file using 1:31:32 with yerrorbars title 'Host running two containers' ls 1
! epstopdf ../plots/section2_v2/eth_rx.eps
! rm ../plots/section2_v2/eth_rx.eps


############
### STOP ###
############



#unset xrange


#set xrange [0:15]





#dropped samples
#set dropped
set title 'dropped'
set ylabel 'dropped samples'
set output '../plots/section2_v2/dropped.eps'

plot two_container_file using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title 'First Container' ps 2, \
  two_container_file using 1:"uhd_dropped 2 mean":"uhd_dropped 2 std" with yerrorbars title 'Second Container' ps 2


! epstopdf ../plots/section2_v2/dropped.eps
! rm ../plots/section2_v2/dropped.eps


set title 'underflows'
set ylabel 'underflows samples'
set output '../plots/section2_v2/underflows.eps'

plot two_container_file using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title 'First Container' ps 2, \
  two_container_file using 1:"uhd_underflows 2 mean":"uhd_underflows 2 std" with yerrorbars title 'Second Container' ps 2


! epstopdf ../plots/section2_v2/underflows.eps
! rm ../plots/section2_v2/underflows.eps


set title 'sequence'
set ylabel 'sequence samples'
set output '../plots/section2_v2/sequence.eps'

plot two_container_file using 1:"uhd_sequence mean":"uhd_sequence std" with yerrorbars title 'First Container' ps 2, \
  two_container_file using 1:"uhd_sequence 2 mean":"uhd_sequence 2 std" with yerrorbars title 'Second Container' ps 2


! epstopdf ../plots/section2_v2/sequence.eps
! rm ../plots/section2_v2/sequence.eps
