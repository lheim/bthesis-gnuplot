#!/usr/local/bin/gnuplot

# LOOKS FINE NOW
### BAREMETAL VS 1CONTAINER ###


set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead

# line styles for ColorBrewer Dark2
# for use with qualitative/categorical data
# provides 8 dark colors based on Set2
# compatible with gnuplot >=4.2
# author: Anna Schneider

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

# END PALETTE
# legende verschieben
set key top left

set xrange [0:35]

set xlabel 'Sample Rate [MSps]'
container = 'container name'
baremetal = 'baremetal name'

#container_file = '../benchmark_log_1machine_1usrp_nop/bench_nolimit_nop_export_v3.csv'
container_file = '../benchmark_log_1M_1U/bench9_nolimit_IP_export_v3.csv'
baremetal_file = '../benchmark_log_baremetal_1U/baremetal_export_v3.csv'

#################
###USING THOSE###
#################

# received samples
set ylabel 'Number of Received Samples'
set output '../plots/section1_v2/received.eps'

plot container_file using 1:"uhd_received mean" title 'containerized' ls 1, \
  baremetal_file using 1:"uhd_received mean" title 'natively' ls 2


! epstopdf ../plots/section1_v2/received.eps
! rm ../plots/section1_v2/received.eps


#transmitted samples
set ylabel 'Number of Transmitted Samples'
set output '../plots/section1_v2/transmitted.eps'

plot container_file using 1:"uhd_transmitted mean" title 'containerized' ls 1, \
  baremetal_file using 1:"uhd_transmitted mean" title 'natively' ls 2

! epstopdf ../plots/section1_v2/transmitted.eps
! rm ../plots/section1_v2/transmitted.eps


#load diff
set xrange [0:27]

set ylabel 'CPU load in %'
set output '../plots/section1_v2/load_diff.eps'

plot container_file using ($1-0.5):"load_diff mean":"load_diff std" with yerrorbars title 'containerized' ls 1, \
  baremetal_file using ($1+0.5):"load_diff mean":"load_diff std" with yerrorbars title 'natively' ls 2


! epstopdf ../plots/section1_v2/load_diff.eps
! rm ../plots/section1_v2/load_diff.eps


set xrange [0:27]


#eth tx
set ylabel 'GbE Interface Transmission Rate [Mbit/s]'
set output '../plots/section1_v2/eth_tx.eps'

plot container_file using 1:"tx_load (Mbits) mean":"tx_load (Mbits) std" with yerrorbars title 'Host running single container' ls 1
! epstopdf ../plots/section1_v2/eth_tx.eps
! rm ../plots/section1_v2/eth_tx.eps


#eth rx
set ylabel 'GbE Interface Receiving Rate [Mbit/s]'
set output '../plots/section1_v2/eth_rx.eps'

plot container_file using 1:"rx_load (Mbits) mean":"rx_load (Mbits) std" with yerrorbars title 'Host running single container' ls 1
! epstopdf ../plots/section1_v2/eth_rx.eps
! rm ../plots/section1_v2/eth_rx.eps



############
### STOP ###
############




#dropped samples
set title 'dropped'
set ylabel 'dropped samples'
set output '../plots/section1_v2/dropped.eps'

plot container_file using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title container ps 2, \
  baremetal_file using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title baremetal ps 2

! epstopdf ../plots/section1_v2/dropped.eps
! rm ../plots/section1_v2/dropped.eps


#underflows samples
set title 'underflows'
set ylabel 'underflows samples'
set output '../plots/section1_v2/underflows.eps'

plot container_file using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title container ps 2, \
  baremetal_file using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title baremetal ps 2

! epstopdf ../plots/section1_v2/underflows.eps
! rm ../plots/section1_v2/underflows.eps
