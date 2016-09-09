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

container_1CPU = '../benchmark_log_1M_1U/bench5_1CPU_export_v3.csv'
container_25PERC = '../benchmark_log_1M_1U/bench5_25CPU_export_v3.csv'




set xrange [0:30]

# received samples
set title 'received'
set ylabel 'received samples'
set output '../plots/constraints_countercheck/received.eps'

plot container_1CPU using 1:"uhd_received mean":"uhd_received std"with yerrorbars title '1CPU' ps 2, \
  container_25PERC using 1:"uhd_received mean":"uhd_received std" with yerrorbars title '25PERC' ps 2, \


! epstopdf ../plots/constraints_countercheck/received.eps
! rm ../plots/constraints_countercheck/received.eps


#transmitted samples
set title 'transmitted'
set ylabel 'transmitted samples'
set output '../plots/constraints_countercheck/transmitted.eps'

plot container_1CPU using 1:"uhd_transmitted mean":"uhd_transmitted std" with yerrorbars title '1CPU' ps 2, \
  container_25PERC using 1:"uhd_transmitted mean":"uhd_transmitted std" with yerrorbars title '25PERC' ps 2, \



! epstopdf ../plots/constraints_countercheck/transmitted.eps
! rm ../plots/constraints_countercheck/transmitted.eps





#eth tx
set title 'ethernet transmit'
set ylabel 'ethernet transmit [Mbit/s]'
set output '../plots/constraints_countercheck/eth_tx.eps'

plot container_1CPU using 1:33:34 with yerrorbars title '1CPU'ps 2, \
  container_25PERC using 1:33:34 with yerrorbars title '25PERC' ps 2

  ! epstopdf ../plots/constraints_countercheck/eth_tx.eps
  ! rm ../plots/constraints_countercheck/eth_tx.eps


#eth rx
set title 'ethernet received'
set ylabel 'ethernet received [Mbit/s]'
set output '../plots/constraints_countercheck/eth_rx.eps'

plot container_25PERC using 1:31:32 with yerrorbars title '1CPU' ps 2, \
  container_25PERC using 1:31:32 with yerrorbars title '25PERC' ps 2

! epstopdf ../plots/constraints_countercheck/eth_rx.eps
! rm ../plots/constraints_countercheck/eth_rx.eps



#dropped
set title 'dropped'
set ylabel 'dropped samples'
set output '../plots/constraints_countercheck/dropped.eps'

plot container_1CPU using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title '1CPU' ps 2, \
  container_25PERC using 1:"uhd_dropped mean":"uhd_dropped std" with yerrorbars title '25PERC' ps 2, \



! epstopdf ../plots/constraints_countercheck/dropped.eps
! rm ../plots/constraints_countercheck/dropped.eps


#underflows
set title 'underflows'
set ylabel 'underflows samples'
set output '../plots/constraints_countercheck/underflows.eps'

plot container_1CPU using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title '1CPU' ps 2, \
  container_25PERC using 1:"uhd_underflows mean":"uhd_underflows std" with yerrorbars title '25PERC' ps 2, \



! epstopdf ../plots/constraints_countercheck/underflows.eps
! rm ../plots/constraints_countercheck/underflows.eps
