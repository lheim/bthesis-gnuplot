#!/usr/local/bin/gnuplot

### NEEDS TO BE DONE
### 4CONTAINER 1MACHINE ###


set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead

# line styles
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

file = '../benchmark_log_1machine_4usrp/bench6S_nolimit_export_v4.csv'




set xrange [0:12]
#################
###USING THOSE###
#################

#transmitted samples
set ylabel 'Number of Transmitted Samples'
set output '../plots/section3/transmitted.eps'
set yrange [] writeback

plot file using 1:"uhd_transmitted 1 mean" title 'First Container' ls 1, \
  file using 1:"uhd_transmitted 2 mean" title 'Second Container' ls 2, \
  file using 1:"uhd_transmitted 3 mean" title 'Third Container' ls 3, \
  file using 1:"uhd_transmitted 4 mean" title 'Fourth Container' ls 4, \



! epstopdf ../plots/section3/transmitted.eps
! rm ../plots/section3/transmitted.eps


set yrange restore
# received samples
set ylabel 'Number of Received Samples'
set output '../plots/section3/received.eps'

plot file using 1:"uhd_received 1 mean" title 'First Container' ls 1, \
  file using 1:"uhd_received 2 mean" title 'Second Container' ls 2, \
  file using 1:"uhd_received 3 mean" title 'Third Container' ls 3, \
  file using 1:"uhd_received 4 mean" title 'Fourth Container' ls 4

! epstopdf ../plots/section3/received.eps
! rm ../plots/section3/received.eps


unset yrange

set xrange [0:8]
#eth tx
set ylabel 'GbE Interface Transmission Rate [Mbit/s]'
set output '../plots/section3/eth_tx.eps'

plot file using 1:33:34 with yerrorbars title 'Host running four containers' ls 1

  ! epstopdf ../plots/section3/eth_tx.eps
  ! rm ../plots/section3/eth_tx.eps


#eth rx
set ylabel 'GbE Interface Receiving Rate [Mbit/s]'
set output '../plots/section3/eth_rx.eps'

plot file using 1:31:32 with yerrorbars title 'Host running four containers' ls 1

! epstopdf ../plots/section3/eth_rx.eps
! rm ../plots/section3/eth_rx.eps

############
### STOP ###
############




#dropped samples
set title 'dropped'
set ylabel 'dropped samples'
set output '../plots/section3/dropped.eps'

plot file using 1:"uhd_dropped 1 mean":"uhd_dropped 1 std" with yerrorbars title 'First Container' ps 2, \
  file using 1:"uhd_dropped 2 mean":"uhd_dropped 2 std" with yerrorbars title 'Second Container' ps 2, \
  file using 1:"uhd_dropped 3 mean":"uhd_dropped 3 std" with yerrorbars title 'Third Container' ps 2, \
  file using 1:"uhd_dropped 4 mean":"uhd_dropped 4 std" with yerrorbars title 'Fourth Container' ps 2, \


! epstopdf ../plots/section3/dropped.eps
! rm ../plots/section3/dropped.eps


#underflows samples
set title 'underflows'
set ylabel 'underflows samples'
set output '../plots/section3/underflows.eps'

plot file using 1:"uhd_underflows 1 mean":"uhd_underflows 1 std" with yerrorbars title 'First Container' ps 2, \
  file using 1:"uhd_underflows 2 mean":"uhd_underflows 2 std" with yerrorbars title 'Second Container' ps 2, \
  file using 1:"uhd_underflows 3 mean":"uhd_underflows 3 std" with yerrorbars title 'Third Container' ps 2, \
  file using 1:"uhd_underflows 4 mean":"uhd_underflows 4 std" with yerrorbars title 'Fourth Container' ps 2, \


! epstopdf ../plots/section3/underflows.eps
! rm ../plots/section3/underflows.eps


#sequence samples
set title 'sequence'
set ylabel 'sequence samples'
set output '../plots/section3/sequence.eps'

plot file using 1:"uhd_sequence 1 mean":"uhd_sequence 1 std" with yerrorbars title 'First Container' ps 2, \
  file using 1:"uhd_sequence 2 mean":"uhd_sequence 2 std" with yerrorbars title 'Second Container' ps 2, \
  file using 1:"uhd_sequence 3 mean":"uhd_sequence 3 std" with yerrorbars title 'Third Container' ps 2, \
  file using 1:"uhd_sequence 4 mean":"uhd_sequence 4 std" with yerrorbars title 'Fourth Container' ps 2, \


! epstopdf ../plots/section3/sequence.eps
! rm ../plots/section3/sequence.eps
