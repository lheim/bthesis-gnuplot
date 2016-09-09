#!/usr/local/bin/gnuplot

# LOOKS FINE NOW
### BAREMETAL VS 1CONTAINER ###


set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead



# legende verschieben
set key top left

set xrange [0:27]

set xlabel 'sample rate [Ms/s]'
container = 'container name'
baremetal = 'baremetal name'

#container_file = '../benchmark_log_1machine_1usrp_nop/bench_nolimit_nop_export_v3.csv'
container_file = '../benchmark_log_1M_1U/bench9_nolimit_IP_export_v3.csv'
baremetal_file = '../benchmark_log_baremetal_1U/baremetal_export_v3.csv'


# received samples
set title 'received v1'
set ylabel 'received samples'
set output '../plots/section1_v2/received.eps'

plot container_file using 1:3:4 with yerrorbars title container ps 2, \
  baremetal_file using 1:3:4 with yerrorbars title baremetal ps 2


! epstopdf ../plots/section1_v2/received.eps
! rm ../plots/section1_v2/received.eps

#transmitted samples
set title 'transmitted'
set ylabel 'transmitted samples'
set output '../plots/section1_v2/transmitted.eps'

plot container_file using 1:9:10 with yerrorbars title container ps 2, \
  baremetal_file using 1:9:10 with yerrorbars title baremetal ps 2

! epstopdf ../plots/section1_v2/transmitted.eps
! rm ../plots/section1_v2/transmitted.eps


#load diff
set title 'load difference'
set ylabel 'load difference'
set output '../plots/section1_v2/load_diff.eps'

plot container_file using 1:25:26 with yerrorbars title container ps 2, \
  baremetal_file using 1:25:26 with yerrorbars title baremetal ps 2


! epstopdf ../plots/section1_v2/load_diff.eps
! rm ../plots/section1_v2/load_diff.eps

#eth tx
set title 'ethernet transmit'
set ylabel 'ethernet transmit [Mbit/s]'
set output '../plots/section1_v2/eth_tx.eps'

plot container_file using 1:33:34 with yerrorbars title container ps 2, \
  baremetal_file using 1:33:34 with yerrorbars title baremetal ps 2

! epstopdf ../plots/section1_v2/eth_tx.eps
! rm ../plots/section1_v2/eth_tx.eps


#eth rx
set title 'ethernet received'
set ylabel 'ethernet received [Mbit/s]'
set output '../plots/section1_v2/eth_rx.eps'

plot container_file using 1:31:32 with yerrorbars title container ps 2, \
  baremetal_file using 1:31:32 with yerrorbars title baremetal ps 2

! epstopdf ../plots/section1_v2/eth_rx.eps
! rm ../plots/section1_v2/eth_rx.eps
