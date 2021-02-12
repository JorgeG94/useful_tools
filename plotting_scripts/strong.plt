# Plotting to a png output
#set terminal wxt enhanced font 'Verdana,10' persist
#set term png font arial 14 size 1024,768
set terminal pngcairo size 1024,767 enhanced font 'Verdana,14'
set output "image.png"
color1 = "#ea6035"
color2 = "#5e82b2"
color3 = "#E09B23"
color4 = "#8EAF30"
color5 = "#0060ad" 
set style line 1 \
    linecolor rgb 'black' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 2 \
    linecolor rgb color1 \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5


set style line 3 \
    linecolor rgb color2 \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 4 \
    linecolor rgb color3 \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 5 \
    linecolor rgb color4 \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 6 \
    linecolor rgb color5 \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 7 \
    linecolor rgb 'sea-green' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5
#set ytics 10 nomirror tc lt 1
#set key off
set key top left
set style line 102 lc rgb 'black' lt 0 lw 1
set grid front ls 102
set xrange [0.7:4.3]
set yrange [0.7:4.3]
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

set title "Strong scaling on V100 STO-3G "
r="sto3g_strong.dat"
#set multiplot 
plot r using 1:2 title "ideal"  with linespoints ls 1, \
r using 1:3 title "gly30" with linespoints ls 2, \
r using 1:5 title "gly120" with linespoints ls 3, \
r using 1:9 title "rna9" with linespoints ls 4, \
r using 1:4 title "gly30 terachem" with linespoints ls 5, \
r using 1:6 title "gly120 terachem" with linespoints ls 6, \
r using 1:10 title "rna9 terachem" with linespoints ls 7

