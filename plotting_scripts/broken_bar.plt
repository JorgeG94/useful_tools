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
#set key top left
set style line 102 lc rgb 'black' lt 0 lw 1
set grid ytics front ls 102
#set xrange [2.5:6.3]
#set yrange [0.0:2]
set ylabel 'Speedup' offset 0,6.5,0 font ",16" 
set xlabel 'System' font ",16"
#set boxwidth 0.9 relative
#set xtics rotate by 45 right
#set style data histogram
#set style histogram cluster gap 1
#set style fill solid border - 1
color1 = "#ea6035"
color2 = "#5e82b2"
color3 = "#E09B23"
color4 = "#8EAF30"
color5 = "#0060ad" 
#set title "Speedup against Terachem 6-31G* "
#r="631gd_bar_tc.dat"


#reset
unset key 
bm = 0.15
lm = 0.12
rm = 0.95
gap = 0.03
size = 0.75
kk = 0.5
y1 = 0.0; y2 = 3.5; y3=7.0; y4=15
r='sto3g_bar_data.dat'
#set style histogram columnstacked
#set style data histograms
#set key autotitle columnheader
#set style fill solid 1.0 border -1
set xtics rotate by 45 right
set style data histogram
set style histogram cluster gap 1
set style fill solid border - 1

set multiplot
set border 1+2+8
set xtics nomirror
set ytics nomirror
set lmargin at screen lm
set rmargin at screen rm
set bmargin at screen bm
#set tmargin at screen bm + size * kk
set tmargin at screen bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) )

set yrange [y1:y2]
plot r using 2:xtic(1) ti col linecolor rgb color1, \
r using 3 ti col linecolor rgb color2, \
r using 4 ti col linecolor rgb color3, \
r using 5 ti col linecolor rgb color4, \
1 title 'Reference' linecolor rgb 'black' lw 2

unset xtics
unset xlabel 
unset ylabel
set border 2+4+8
#set bmargin at screen bm + size * kk + gap 
set bmargin at screen bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap
set tmargin at screen bm + size + gap
set yrange [y3:y4]
set key top right

set arrow from screen lm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0 to screen \
lm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 nohead

set arrow from screen lm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0  + gap to screen \
lm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 + gap nohead

set arrow from screen rm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0 to screen \
rm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 nohead

set arrow from screen rm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0  + gap to screen \
rm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 + gap nohead

plot r using 2:xtic(1) ti col linecolor rgb color1, \
r using 3 ti col linecolor rgb color2, \
r using 4 ti col linecolor rgb color3, \
r using 5 ti col linecolor rgb color4, \
1 title 'Reference' linecolor rgb 'black' lw 2

unset multiplot

