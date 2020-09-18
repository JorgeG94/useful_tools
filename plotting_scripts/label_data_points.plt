# Plotting to a png output
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

set key off 
set style line 102 lc rgb 'black' lt 0 lw 1
set grid front ls 102
set ylabel ' ylabel'
set xlabel ' xlabel'




set title "Title"
r="yourfile.dat"
 
plot r using 1:2 title 'YourTitle' with points ls 1, \
r using 1:2:3 with labels center offset 3.4,.5 notitle
