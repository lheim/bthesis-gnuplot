#!/usr/local/bin/gnuplot

### NEEDS TO BE DONE
### 4CONTAINER 1MACHINE ###


set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead



# legende verschieben
set key top left



set xlabel 'sample rate [Ms/s]'

file = '../benchmark_log_1machine_4usrp/bench6_nolimit_export_v4.csv'




set xrange [0:12]


# received samples
set title 'received v1'
set ylabel 'received samples'
set output '../plots/section3/received.eps'

plot file using 1:"uhd_received 1 mean":"uhd_received 1 std" with yerrorbars title 'First Container' ps 2, \
  file using 1:"uhd_received 2 mean":"uhd_received 2 std" with yerrorbars title 'Second Container' ps 2, \
  file using 1:"uhd_received 3 mean":"uhd_received 3 std" with yerrorbars title 'Third Container' ps 2, \
  file using 1:"uhd_received 4 mean":"uhd_received 4 std" with yerrorbars title 'Fourth Container' ps 2

! epstopdf ../plots/section3/received.eps
! rm ../plots/section3/received.eps


#transmitted samples
set title 'transmitted'
set ylabel 'transmitted samples'
set output '../plots/section3/transmitted.eps'

plot file using 1:"uhd_transmitted 1 mean":"uhd_transmitted 1 std" with yerrorbars title 'First Container' ps 2, \
  file using 1:"uhd_transmitted 2 mean":"uhd_transmitted 2 std" with yerrorbars title 'Second Container' ps 2, \
  file using 1:"uhd_transmitted 3 mean":"uhd_transmitted 3 std" with yerrorbars title 'Third Container' ps 2, \
  file using 1:"uhd_transmitted 4 mean":"uhd_transmitted 4 std" with yerrorbars title 'Fourth Container' ps 2, \


! epstopdf ../plots/section3/transmitted.eps
! rm ../plots/section3/transmitted.eps




#eth tx
set title 'ethernet transmit'
set ylabel 'ethernet transmit [Mbit/s]'
set output '../plots/section3/eth_tx.eps'

plot file using 1:33:34 with yerrorbars title 'only machine' ps 2

  ! epstopdf ../plots/section3/eth_tx.eps
  ! rm ../plots/section3/eth_tx.eps


#eth rx
set title 'ethernet received'
set ylabel 'ethernet received [Mbit/s]'
set output '../plots/section3/eth_rx.eps'

plot file using 1:31:32 with yerrorbars title 'only machine' ps 2

! epstopdf ../plots/section3/eth_rx.eps
! rm ../plots/section3/eth_rx.eps


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
