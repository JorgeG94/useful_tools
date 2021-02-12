# Plotting to a png output
#set terminal wxt enhanced font 'Verdana,10' persist
#set term png font arial 14 size 1024,768
set terminal pngcairo size 1024,767 enhanced font 'Verdana,14'
set output "loglog.png"
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

#set ytics 10 nomirror tc lt 1
set key off
set style line 102 lc rgb 'black' lt 0 lw 1
set grid front ls 102
set ylabel 'Log(time)' 
set xlabel 'Log(bf)'
set yrange [-2:4]


f(x) = m * x + b 
fit f(x) "sto3g_glycine.dat" using 1:2 via m,b
set label 1 sprintf("Slope = %3.4f",m) at 3,2 font "arialbd,18"
set label 2 sprintf("Intercept = %3.4f",b) at 3,2.2 font "arialbd,18"

g(x) = n * x + c 
fit g(x) "sto3g_glycine.dat" using 1:3 via n,c
set label 1 sprintf("Slope = %3.4f",n) at 3,-0.4 font "arialbd,18"
set label 2 sprintf("Intercept = %3.4f",c) at 3,-0.42 font "arialbd,18"

h(x) = o * x + d 
fit h(x) "sto3g_glycine.dat" using 1:4 via o,d
set label 1 sprintf("Slope = %3.4f",o) at 3,2 font "arialbd,18"
set label 2 sprintf("Intercept = %3.4f",d) at 3,2.2 font "arialbd,18"

r="sto3g_glycine.dat"
set multiplot 
plot r using 1:3 notitle with linespoints ls 1, \
r using 1:4 notitle with linespoints ls 1, \
r using 1:4 notitle with linespoints ls 1, \
g(x) title " v100" dt 2 lt 4 lw 2 lc rgb 'black'
