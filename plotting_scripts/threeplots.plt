#two plot scripts
set terminal pngcairo size 3200,1100 enhanced font 'Times New Roman, 18'
set output "letterplot.png"

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
    linetype 'F1' linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 6 \
    linecolor rgb color5 \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 7 \
    linecolor rgb 'gray' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5


set style line 8 \
    linecolor rgb 'sea-green' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5




r="sto3g_strong.dat"
s="631g_strong.dat"
t="631gd_strong.dat"
set xlabel 'NGPUS' font 'Times New Roman, 24'
#file2="file2.dat"
#file3="file3.dat"
#file4="file4.dat"
set tics font ", 30"
set xrange[0.7:4.3]
#set xtics 0,500,4000 font 'Times New Roman, 24'
# set labels every desired step and correlate to a custom label 500 -> 0.5
#set xtics ("0" 0, "0.5" 500, "1.0" 1000, "1.5" 1500, "2.0" 2000, "2.5" 2500, "3.0" 3000, "3.5" 3500, "4.0" 4000)
#set xlabel 'xlabel' offset 25 font 'Times New Roman, 30'
#set ylabel 'ylabel' font 'Times New Roman, 30'
#set lmargin 7
#set bmargin 4

set multiplot layout 1,3 


set key top left font 'Times New Roman, 26'
set yrange[0.7:4.3]
set ylabel 'Speedup' font 'Times New Roman, 30'
set title 'STO-3G' font 'Times New Roman, 30' 
plot r using 1:2 title "ideal"  with linespoints ls 1, \
r using 1:9 title "rna9" with linespoints ls 4, \
r using 1:3 title "gly30" with linespoints ls 2, \
r using 1:5 title "gly120" with linespoints ls 3, \
r using 1:10 title "rna9 terachem" with linespoints ls 7, \
r using 1:4 title "gly30 terachem" with linespoints ls 5, \
r using 1:6 title "gly120 terachem" with linespoints ls 6
unset title

unset ylabel
set key top left font 'Times New Roman, 26'
set yrange[0.7:4.3]
#set y2label 'lable of second y axis' font 'Times New Roman, 30'
#set y2label 'Speedup' font 'Times New Roman, 30'
set title '6-31G' font 'Times New Roman, 30' 
plot s using 1:2 title "ideal"  with linespoints ls 1, \
s using 1:3 title "gly30" with linespoints ls 2, \
s using 1:7 title "rna1" with linespoints ls 3, \
s using 1:9 title "rna5" with linespoints ls 4, \
s using 1:4 title "gly30 terachem" with linespoints ls 5, \
s using 1:8 title "rna1 terachem" with linespoints ls 6, \
s using 1:10 title "rna5 terachem" with linespoints ls 7
unset title 
#unset xlabel

set key top left font 'Times New Roman, 26'
set yrange[0.7:4.3]
#set y2label 'lable of second y axis' font 'Times New Roman, 30'
set title '6-31G(d)' font 'Times New Roman, 30' 
plot t using 1:2 title "ideal"  with linespoints ls 1, \
t using 1:3 title "gly30" with linespoints ls 2, \
t using 1:5 title "gly70" with linespoints ls 3, \
t using 1:9 title "rna3" with linespoints ls 4, \
t using 1:4 title "gly30 terachem" with linespoints ls 5, \
t using 1:6 title "gly70 terachem" with linespoints ls 6, \
t using 1:10 title "rna3 terachem" with linespoints ls 7
unset title
unset multiplot
