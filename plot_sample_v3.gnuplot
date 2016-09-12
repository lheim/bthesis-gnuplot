#!/usr/local/bin/gnuplot



set terminal postscript eps enhanced color font 20
set autoscale
set grid
set datafile separator comma
set key autotitle columnhead

# legende verschieben
set key top left


set macro



set xlabel 'sample rate [Ms/s]'

output_folder = '../plots/sample_v3/'

file1 = '../benchmark_log_1M_1U/bench9_nolimit_IP_export_v3.csv'
file2 = ''
file3 = ''
file4 = ''


# sample_type = "transmitted"
types = "transmitted received"


do for [sample_type in types]{
  set macro

  file_path = sprintf('%s%s.eps', output_folder, sample_type)

  set title sample_type
  set ylabel sample_type
  set output file_path

  plot file1 using 1:sprintf('uhd_%s mean', sample_type):sprintf('uhd_%s std', sample_type) with yerrorbars title 'First Container' ps 2

  system sprintf("epstopdf %s", file_path)
  system sprintf("rm %s", file_path)
}
