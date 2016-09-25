#!/usr/local/bin/gnuplot

# LOOKS FINE
### 2CONTAINER 2MACHINE ###


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

# legende verschieben
set key top left



set xlabel 'Sample Rate [MS/s]'
two_container = '2 container 1machine'

#two_container_file1 = '../benchmark_log_2machine_2usrp/pc141/bench3_nolimit_1_export_v3.csv'
#two_container_file2 = '../benchmark_log_2machine_2usrp/pc142/bench3_nolimit_2_export_v3.csv'

two_container_file1 = '../benchmark_log_2M_2U/bench9_nolimit_1_export_v3.csv'
two_container_file2 = '../benchmark_log_2M_2U/bench9_nolimit_2_export_v3.csv'



set xrange[0:30]


# received samples
set ylabel 'Number of Received Samples'
set output '../plots/section4_v2/received.eps'

plot two_container_file1 using 1:"uhd_received mean" title 'First Container, First Host' ls 1, \
  two_container_file2 using 1:"uhd_received mean" title 'Second Container, Second Host' ls 2, \


! epstopdf ../plots/section4_v2/received.eps
! rm ../plots/section4_v2/received.eps


#transmitted samples
set ylabel 'transmitted samples'
set output '../plots/section4_v2/transmitted.eps'

plot two_container_file1 using 1:"uhd_transmitted mean" title 'First Container, Host 1' ls 1, \
  two_container_file2 using 1:"uhd_transmitted mean" title 'Second Container, Host 2' ls 2, \



! epstopdf ../plots/section4_v2/transmitted.eps
! rm ../plots/section4_v2/transmitted.eps



#load diff
set ylabel 'CPU load in %'
set output '../plots/section4_v2/load_diff.eps'

plot two_container_file1 using ($1-0.5):"load_diff mean":"load_diff std" with yerrorbars title 'Host 1' ls 1, \
  two_container_file2 using ($1+0.5):"load_diff mean":"load_diff std" with yerrorbars title 'Host 2' ls 2


! epstopdf ../plots/section4_v2/load_diff.eps
! rm ../plots/section4_v2/load_diff.eps



############
### STOP ###
############

#eth tx
set title 'ethernet transmit'
set ylabel 'ethernet transmit [Mbit/s]'
set output '../plots/section4_v2/eth_tx.eps'

plot two_container_file1 using 1:"tx_load (Mbits) mean":"tx_load (Mbits) std" with yerrorbars title 'Machine 1'ps 2, \
  two_container_file2 using 1:"tx_load (Mbits) mean":"tx_load (Mbits) std" with yerrorbars title 'Machine 2' ps 2

  ! epstopdf ../plots/section4_v2/eth_tx.eps
  ! rm ../plots/section4_v2/eth_tx.eps


#eth rx
set title 'ethernet received'
set ylabel 'ethernet received [Mbit/s]'
set output '../plots/section4_v2/eth_rx.eps'

plot two_container_file2 using 1:"rx_load (Mbits) mean":"rx_load (Mbits) std" with yerrorbars title 'Machine 1' ps 2, \
  two_container_file2 using 1:"rx_load (Mbits) mean":"rx_load (Mbits) std" with yerrorbars title 'Machine 2' ps 2

! epstopdf ../plots/section4_v2/eth_rx.eps
! rm ../plots/section4_v2/eth_rx.eps



#dropped samples
set title 'dropped'
set ylabel 'dropped samples'
set output '../plots/section4_v2/dropped.eps'

plot two_container_file1 using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title 'First Container Machine 1' ps 2, \
  two_container_file2 using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title 'Second Container Machine 2' ps 2, \



! epstopdf ../plots/section4_v2/dropped.eps
! rm ../plots/section4_v2/dropped.eps


#underflows samples
set title 'underflows'
set ylabel 'underflows samples'
set output '../plots/section4_v2/underflows.eps'

plot two_container_file1 using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title 'First Container Machine 1' ps 2, \
  two_container_file2 using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title 'Second Container Machine 2' ps 2, \



! epstopdf ../plots/section4_v2/underflows.eps
! rm ../plots/section4_v2/underflows.eps
