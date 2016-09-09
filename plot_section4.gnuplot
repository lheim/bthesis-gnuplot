#!/usr/local/bin/gnuplot

# LOOKS FINE
### 2CONTAINER 2MACHINE ###


set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead



# legende verschieben
set key top left



set xlabel 'sample rate [Ms/s]'
two_container = '2 container 1machine'

#two_container_file1 = '../benchmark_log_2machine_2usrp/pc141/bench3_nolimit_1_export_v3.csv'
#two_container_file2 = '../benchmark_log_2machine_2usrp/pc142/bench3_nolimit_2_export_v3.csv'

two_container_file1 = '../benchmark_log_2M_2U/bench9_nolimit_1_export_v3.csv'
two_container_file2 = '../benchmark_log_2M_2U/bench9_nolimit_2_export_v3.csv'



set xrange[0:30]


# received samples
set title 'received v1'
set ylabel 'received samples'
set output '../plots/section4_v2/received.eps'

plot two_container_file1 using 1:"uhd_received mean":"uhd_received std" with yerrorbars title 'First Container Machine 1' ps 2, \
  two_container_file2 using 1:"uhd_received mean":"uhd_received std" with yerrorbars title 'Second Container Machine 2' ps 2, \


! epstopdf ../plots/section4_v2/received.eps
! rm ../plots/section4_v2/received.eps


#transmitted samples
set title 'transmitted'
set ylabel 'transmitted samples'
set output '../plots/section4_v2/transmitted.eps'

plot two_container_file1 using 1:"uhd_transmitted mean":"uhd_transmitted std" with yerrorbars title 'First Container Machine 1' ps 2, \
  two_container_file2 using 1:"uhd_transmitted mean":"uhd_transmitted std" with yerrorbars title 'Second Container Machine 2' ps 2, \



! epstopdf ../plots/section4_v2/transmitted.eps
! rm ../plots/section4_v2/transmitted.eps





#eth tx
set title 'ethernet transmit'
set ylabel 'ethernet transmit [Mbit/s]'
set output '../plots/section4_v2/eth_tx.eps'

plot two_container_file1 using 1:33:34 with yerrorbars title 'Machine 1'ps 2, \
  two_container_file2 using 1:33:34 with yerrorbars title 'Machine 2' ps 2

  ! epstopdf ../plots/section4_v2/eth_tx.eps
  ! rm ../plots/section4_v2/eth_tx.eps


#eth rx
set title 'ethernet received'
set ylabel 'ethernet received [Mbit/s]'
set output '../plots/section4_v2/eth_rx.eps'

plot two_container_file2 using 1:31:32 with yerrorbars title 'Machine 1' ps 2, \
  two_container_file2 using 1:31:32 with yerrorbars title 'Machine 2' ps 2

! epstopdf ../plots/section4_v2/eth_rx.eps
! rm ../plots/section4_v2/eth_rx.eps


#load diff
set title 'load difference'
set ylabel 'load difference'
set output '../plots/section4_v2/load_diff.eps'

plot two_container_file1 using 1:25:26 with yerrorbars title 'Machine 1' ps 2, \
  two_container_file2 using 1:25:26 with yerrorbars title 'Machine 2' ps 2


! epstopdf ../plots/section4_v2/load_diff.eps
! rm ../plots/section4_v2/load_diff.eps
