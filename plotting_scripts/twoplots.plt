#two plot scripts
set terminal pngcairo size 1480,980 enhanced font 'Times New Roman, 18'
set output "letterplot.png"

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
    linecolor rgb 'purple' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 5 \
    linecolor rgb '#4b03a1' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5


set style line 6 \
    linecolor rgb 'black' \
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




file1="file1.dat"
file2="file2.dat"
file3="file3.dat"
file4="file4.dat"

set xrange[0:4000]
set xtics 0,500,4000 font 'Times New Roman, 24'
# set labels every desired step and correlate to a custom label 500 -> 0.5
set xtics ("0" 0, "0.5" 500, "1.0" 1000, "1.5" 1500, "2.0" 2000, "2.5" 2500, "3.0" 3000, "3.5" 3500, "4.0" 4000)
set xlabel 'xlabel' offset 25 font 'Times New Roman, 30'
set ylabel 'ylabel' font 'Times New Roman, 30'
set lmargin 7
set bmargin 4

set multiplot layout 1,2  


set key top left font 'Times New Roman, 22'
set yrange[0:32]
plot file1 using 1:2 title 'title1' with linespoints ls 1, \
file1 using 1:3 title 'title2' with linespoints ls 2, \
file2 using 1:2 title 'title3' with linespoints ls 3, \
file3 using 1:3 title 'title4' with linespoints ls 4
unset yrange 

unset xlabel
unset ylabel
set key bottom right font 'Times New Roman, 22'
set y2label 'lable of second y axis' font 'Times New Roman, 30'
plot file3 using 1:2 title 'title1' with linespoints ls 1, \
file3 using 1:3 title 'title2' with linespoints ls 2, \
file4 using 1:2 title 'title3' with linespoints ls 3, \
file4 using 1:3 title 'title4' with linespoints ls 4, \
file4 using 1:3:4 with labels offset 5 notitle

unset multiplot
