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

set style line 5 \
    linecolor rgb 'cyan' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 6 \
    linecolor rgb 'black' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

#set ytics 10 nomirror tc lt 1
#set key off
set key top left
set style line 102 lc rgb 'black' lt 0 lw 1
set grid front ls 102
#set xrange [2.5:6.3]
set yrange [0.0:3]
set ylabel 'Speedup' 
set xlabel 'System'
set boxwidth 0.9 relative
#set y2tics 20 nomirror tc lt 2
#set y2label '4*x' tc lt 2 

#set yrange [0:75]
#set y2range [10:450]

#set xlabel "Batch size"
#set ylabel "Time (s)" 

#f(x) = m * x + b 
#fit f(x) "linear.dat" using 1:3 via m,b
set style data histogram
set style histogram cluster gap 1
set style fill solid border - 1
#terachem = "#99ffff"; v100 = "#4671d5"; a100 = "#ff0000"; v100de = "#f36e00"
color1 = "#ea6035"
color2 = "#5e82b2"

#a100de = '#E62121'
set title "Speedup against Terachem STO-3G "
#r="speedups_sto3g.dat"
r="speedups_631gd.dat"
#set multiplot 
plot r using 2:xtic(1) ti col linecolor rgb color1, \
r using 3 ti col linecolor rgb color2, 1 title 'terachem' linecolor rgb 'black' lw 2
#r using 5 ti col fc rgb a100, \
#r using 6 ti col fc rgb v100de, \
#r using 7 ti col fc rgb a100de
