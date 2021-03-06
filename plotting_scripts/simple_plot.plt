# Plotting to a png output
#set terminal wxt enhanced font 'Verdana,10' persist
#set term png font arial 14 size 1024,768
set terminal pngcairo size 1024,767 enhanced font 'Verdana,14'
set output "image.png"
set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 2 \
    linecolor rgb 'orange' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5


set style line 3 \
    linecolor rgb 'red' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 4 \
    linecolor rgb 'blue' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 4 \
    linecolor rgb 'cyan' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 4 \
    linecolor rgb 'black' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

#set ytics 10 nomirror tc lt 1
#set key off
set key top left
set style line 102 lc rgb 'black' lt 0 lw 1
set grid front ls 102
set xrange [0.7:7.3]
set yrange [0.7:7.3]
set ylabel 'Speedup' 
set xlabel 'Number of GPUs'

#set y2tics 20 nomirror tc lt 2
#set y2label '4*x' tc lt 2 

#set yrange [0:75]
#set y2range [10:450]

#set xlabel "Batch size"
#set ylabel "Time (s)" 

#f(x) = m * x + b 
#fit f(x) "linear.dat" using 1:3 via m,b

set title "Strong scaling on A100 "
r="a100_strong2.dat"
#set multiplot 
plot r using 1:2 title "ideal"  with linespoints ls 1, \
r using 1:3 title "RNA9 (4363) STO-3G" with linespoints ls 2, \
r using 1:4 title "RNA9 (7816) 6-31G" with linespoints ls 3, \
r using 1:5 title "RNA9 (12412) 6-31G(d)" with linespoints ls 4
#r using 1:6 title "MSN (8754) STO-3G" with linespoints ls 5, \
#r using 1:7 title "RNA5 (6904) 6-31G(d)" with linespoints ls 6

