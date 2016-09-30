#!/usr/local/bin/gnuplot

#LOOKS FINE
### 4CONTAINER 2MACHINE ###


set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead

set style line 1 lt 1 lc rgb "red" ps 2 pt 7
set style line 2 lt 1 lc rgb "blue" ps 2 pt 90
set style line 3 lt 1 lc rgb "orange" ps 2 pt 9
set style line 4 lt 1 lc rgb '#66A61E' ps 2 pt 11
set style line 5 lt 1 lc rgb '#66A61E' # dark lime green
set style line 6 lt 1 lc rgb '#E6AB02' # dark banana
set style line 7 lt 1 lc rgb '#A6761D' # dark tan
set style line 8 lt 1 lc rgb '#666666' # dark gray

# legende verschieben
set key top left


set colorsequence podo
set style line 1 lt 1 lw 3 ps 3
set style line 2 lt 2 lw 3 ps 3
set style line 3 lt 3 lw 3 ps 2 pt 5
set style line 4 lt 4 lw 3 ps 3
set style line 5 lt 5 lw 3 ps 3
set style line 6 lt 6 lw 3 ps 3




set xlabel 'Sample Rate [MSps]'
two_container = '2 container 1machine'

two_container_file1 = '../benchmark_log_2machine_4usrp/pc141/bench4_nolimit_1_1_export_v3.csv'
two_container_file2 = '../benchmark_log_2machine_4usrp/pc142/bench4_nolimit_2_1_export_v3.csv'
#two_container_file1 = '../benchmark_log_2M_4U/bench10_nolimit_1_export_v3.csv'
#two_container_file2 = '../benchmark_log_2M_4U/bench10_nolimit_3_export_v3.csv'




set xrange [0:30]

# received samples
set ylabel 'Number of Received Samples'
set output '../plots/section5/received.eps'

plot two_container_file1 using 1:"uhd_received mean":"uhd_received std" with yerrorbars title 'First Container, Host 1' ls 1, \
  two_container_file1 using 1:"uhd_received 2 mean":"uhd_received 2 std" with yerrorbars title 'Second Container, Host 1' ls 2, \
  two_container_file2 using 1:"uhd_received mean":"uhd_received std" with yerrorbars title 'Third Container, Host 2' ls 3, \
  two_container_file2 using 1:"uhd_received 2 mean":"uhd_received 2 std" with yerrorbars title 'Fourth Container, Host 2' ls 4

! epstopdf ../plots/section5/received.eps
! rm ../plots/section5/received.eps


#transmitted samples
set ylabel 'Number of Transmitted Samples'
set output '../plots/section5/transmitted.eps'

plot two_container_file1 using 1:"uhd_transmitted mean":"uhd_transmitted std" with yerrorbars title 'First Container, Host 1' ls 1, \
  two_container_file1 using 1:"uhd_transmitted 2 mean":"uhd_transmitted 2 std" with yerrorbars title 'Second Container, Host 1' ls 2, \
  two_container_file2 using 1:"uhd_transmitted mean":"uhd_transmitted std" with yerrorbars title 'Third Container, Host 2' ls 3, \
  two_container_file2 using 1:"uhd_transmitted 2 mean":"uhd_transmitted 2 std" with yerrorbars title 'Fourth Container, Host 2' ls 4


! epstopdf ../plots/section5/transmitted.eps
! rm ../plots/section5/transmitted.eps





#eth tx
set title 'ethernet transmit'
set ylabel 'ethernet transmit [Mbit/s]'
set output '../plots/section5/eth_tx.eps'

plot two_container_file1 using 1:33:34 with yerrorbars title 'Machine 1'ps 2, \
  two_container_file2 using 1:33:34 with yerrorbars title 'Machine 2' ps 2

  ! epstopdf ../plots/section5/eth_tx.eps
  ! rm ../plots/section5/eth_tx.eps


#eth rx
set title 'ethernet received'
set ylabel 'ethernet received [Mbit/s]'
set output '../plots/section5/eth_rx.eps'

plot two_container_file1 using 1:31:32 with yerrorbars title 'Machine 1' ps 2, \
  two_container_file2 using 1:31:32 with yerrorbars title 'Machine 2' ps 2

! epstopdf ../plots/section5/eth_rx.eps
! rm ../plots/section5/eth_rx.eps




#dropped samples

set title 'dropped'
set ylabel 'dropped samples'
set output '../plots/section5/dropped.eps'

plot two_container_file1 using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title 'First Container Machine 1' ps 2, \
  two_container_file1 using 1:"uhd_dropped 2 mean":"uhd_dropped 2 std" with yerrorbars title 'Second Container Machine 1' ps 2, \
  two_container_file2 using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title 'Third Container Machine 2' ps 2, \
  two_container_file2 using 1:"uhd_dropped 2 mean":"uhd_dropped 2 std" with yerrorbars title 'Fourth Container Machine 2' ps 2
! epstopdf ../plots/section5/dropped.eps
! rm ../plots/section5/dropped.eps




#underflows samples

set title 'underflows'
set ylabel 'underflows samples'
set output '../plots/section5/underflows.eps'

plot two_container_file1 using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title 'First Container Machine 1' ps 2, \
  two_container_file1 using 1:"uhd_underflows 2 mean":"uhd_underflows 2 std" with yerrorbars title 'Second Container Machine 1' ps 2, \
  two_container_file2 using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title 'Third Container Machine 2' ps 2, \
  two_container_file2 using 1:"uhd_underflows 2 mean":"uhd_underflows 2 std" with yerrorbars title 'Fourth Container Machine 2' ps 2
! epstopdf ../plots/section5/underflows.eps
! rm ../plots/section5/underflows.eps
