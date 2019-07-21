set term epslatex linewidth 2

set output "cpuloadx1.tex"
set key off
set size 1,0.65
set format y "%.2f"

set yrange [0:]
set xtics ("0" 0, "10" 600, "20" 1200, "30" 1800)
plot '../accepted-results/x1/cpu-baseline/cpuload-nobg-nox' with linespoints title "x1-passive-cpuload"

set output "cpuload-desktop.tex"
set yrange [0:]
plot '../accepted-results/itu-desktop/cpu-baseline/cpuload' with linespoints title "itu-desktop-passive-cpuload"

set output "cpuload-server.tex"
set yrange [0:]
set xtics ("0" 0, "10" 600, "20" 1200, "30" 1800)
plot '../accepted-results/itu-server/cpu-baseline/cpuload' with linespoints title "itu-server-passive-cpuload"

set format

set output "nobarrier.tex"
unset size
set key on
set yrange [0:]
set xtics ("0" 0, "8" 8, "24" 24, "80" 80)

xcorrect(x)=(x*x)/4+x
plot '< head -n4 ../accepted-results/x1/intcounters-4threads/counters-no-barrier-local' using (xcorrect($2)):3:5 with errorlines title "i5-local", \
     '< head -n4 ../accepted-results/x1/intcounters-4threads/counters-no-barrier-array' using (xcorrect($2)):3:5 with errorlines title "i5-array", \
     '< head -n4 ../accepted-results/itu-desktop/intcounters-8threads/counters-no-barrier-local-desktop' using (xcorrect($2)):3:5 with errorlines title "i7-local", \
     '< head -n4 ../accepted-results/itu-desktop/intcounters-8threads/counters-no-barrier-array-desktop' using (xcorrect($2)):3:5 with errorlines title "i7-array", \
     '< head -n4 ../accepted-results/itu-server/intcounters-48threads/counters-no-barrier-local-server' using (xcorrect($2)):3:5 with errorlines title "xeon-local", \
     '< head -n4 ../accepted-results/itu-server/intcounters-48threads/counters-no-barrier-array-server' using (xcorrect($2)):3:5 with errorlines title "xeon-array"

set output "barrier.tex"
set yrange [0:]
plot '< head -n4 ../accepted-results/x1/intcounters-4threads/counters-barrier-local' using (xcorrect($2)):3:5 with errorlines title "i5-local", \
     '< head -n4 ../accepted-results/x1/intcounters-4threads/counters-barrier-array' using (xcorrect($2)):3:5 with errorlines title "i5-array", \
     '< head -n4 ../accepted-results/itu-desktop/intcounters-8threads/counters-barrier-local-desktop' using (xcorrect($2)):3:5 with errorlines title "i7-local", \
     '< head -n4 ../accepted-results/itu-desktop/intcounters-8threads/counters-barrier-array-desktop' using (xcorrect($2)):3:5 with errorlines title "i7-array", \
     '< head -n4 ../accepted-results/itu-server/intcounters-48threads/counters-barrier-local-server' using (xcorrect($2)):3:5 with errorlines title "xeon-local", \
     '< head -n4 ../accepted-results/itu-server/intcounters-48threads/counters-barrier-array-server' using (xcorrect($2)):3:5 with errorlines title "xeon-array"

set output "qsort.tex"
set yrange [0:]
plot '../accepted-results/x1/qsort/qsort-by-cutoff-native-array' using 2:3:5:xticlabels(2) with errorlines title "padnone", \
     '../accepted-results/x1/qsort/qsort-by-padding-padall-array' using 2:3:5 with errorlines title "padall", \
     '../accepted-results/x1/qsort/qsort-by-padding-padsome-array' using 2:3:5 with errorlines title "padsome"

set output "qsort-desktop.tex"
set yrange [0:]
plot '../accepted-results/itu-desktop/qsort/qsort-by-cutoff-native-array' using 2:3:5:xticlabels(2) with errorlines title "padnone", \
     '../accepted-results/itu-desktop/qsort/qsort-by-padding-padall-array' using 2:3:5 with errorlines title "padall", \
     '../accepted-results/itu-desktop/qsort/qsort-by-padding-padsome-array' using 2:3:5 with errorlines title "padsome"

set output "qsort-server.tex"
set yrange [0:]
plot '../accepted-results/itu-server/qsort/qsort-by-cutoff-native-array' using 2:3:5:xticlabels(2) with errorlines title "padnone", \
     '../accepted-results/itu-server/qsort/qsort-by-padding-padall-array' using 2:3:5 with errorlines title "padall", \
     '../accepted-results/itu-server/qsort/qsort-by-padding-padsome-array' using 2:3:5 with errorlines title "padsome"


set output "readtimes.tex"
set key on
set size 1,0.75
set yrange [0:]
set xrange [0:]
set xtics () rotate by -45
set lmargin 5
set rmargin 5
jumps=2**25

plot '< awk "\$2 <= 512 {print}" ../accepted-results/x1/readtimes-cyclic/readtimes-cyclic-array' using 2:($3/jumps):5:xticlabels(2) with linespoints title "i5", \
     '< awk "\$2<=512 {print}" ../accepted-results/x1/readtimes-cyclic/readtimes-padded-cyclic-array' using 2:($3/jumps):5 with linespoints title "padded-i5", \
     '< awk "\$2<=512 {print}" ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-cyclic-array-desktop' using 2:($3/jumps):5 with linespoints title "i7", \
     '< awk "\$2<=512 {print}" ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-padded-cyclic-array-desktop' using 2:($3/jumps):5 with linespoints title "padded-i7", \
     '< awk "\$2<=512 {print}" ../accepted-results/itu-server/readtimes-cyclic/readtimes-cyclic-array-server' using 2:($3/jumps):5 with linespoints title "Xeon", \
     '< awk "\$2<=512 {print}" ../accepted-results/itu-server/readtimes-cyclic/readtimes-padded-cyclic-array-server' using 2:($3/jumps):5 with linespoints title "padded-Xeon"

set output "readtimes2.tex"
set yrange [0:]
set xrange [*:]
plot '< awk "\$2>=512&&\$2<=8192 {print}" ../accepted-results/x1/readtimes-cyclic/readtimes-cyclic-array' using 2:($3/jumps):5:xticlabels(2) with linespoints title "i5", \
     '< awk "\$2>=512&&\$2<=8192 {print}" ../accepted-results/x1/readtimes-cyclic/readtimes-padded-cyclic-array' using 2:($3/jumps):5 with linespoints title "padded-i5", \
     '< awk "\$2>=512&&\$2<=8192 {print}" ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-cyclic-array-desktop' using 2:($3/jumps):5 with linespoints title "i7", \
     '< awk "\$2>=512&&\$2<=8192 {print}" ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-padded-cyclic-array-desktop' using 2:($3/jumps):5 with linespoints title "padded-i7", \
     '< awk "\$2>=512&&\$2<=8192 {print}" ../accepted-results/itu-server/readtimes-cyclic/readtimes-cyclic-array-server' using 2:($3/jumps):5:xticlabels(2) with linespoints title "Xeon", \
     '< awk "\$2>=512&&\$2<=8192 {print}" ../accepted-results/itu-server/readtimes-cyclic/readtimes-padded-cyclic-array-server' using 2:($3/jumps):5 with linespoints title "padded-Xeon"

set output "readtimes3.tex"
set yrange [0:]
set xrange [*:]
plot '< awk "\$2>=8192 {print}" ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-cyclic-array-desktop' using 2:($3/jumps):5:xticlabels(2) linestyle 3 with linespoints title "i7", \
     '< awk "\$2>=8192 {print}" ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-padded-cyclic-array-desktop' using 2:($3/jumps):5 linestyle 4 with linespoints title "padded-i7", \
     '< awk "\$2>=8192 {print}" ../accepted-results/itu-server/readtimes-cyclic/readtimes-cyclic-array-server' using 2:($3/jumps):5:xticlabels(2) linestyle 5 with linespoints title "Xeon", \
     '< awk "\$2>=8192 {print}" ../accepted-results/itu-server/readtimes-cyclic/readtimes-padded-cyclic-array-server' using 2:($3/jumps):5 linestyle 6 with linespoints title "padded-Xeon"

set output "sharedint.tex"
set size 0.5,0.5
set key off
set yrange [0:]
unset logscale 

plot '../accepted-results/x1/contended-writes/contended-writes' using 2:3:5:xticlabels(2) with errorlines title "writes", \
     '../accepted-results/x1/contended-writes/contended-writes-array' using 2:3:5 with errorlines title "writes-array", \
     '../accepted-results/x1/contended-writes/contended-writes-and-reads' using 2:3:5 with errorlines title "writes-and-reads"

set output "sharedintdesktop.tex"
set yrange [0:]
plot '../accepted-results/itu-desktop/contended-writes/contended-writes-desktop' using 2:3:5:xticlabels(2) with errorlines title "writes-desktop", \
     '../accepted-results/itu-desktop/contended-writes/contended-writes-array-desktop' using 2:3:5 with errorlines title "writes-array-desktop", \
     '../accepted-results/itu-desktop/contended-writes/contended-writes-and-reads-desktop' using 2:3:5 with errorlines title "writes-and-reads-desktop"

set output "sharedintserver.tex"
set size 1,0.5
set key on left
set yrange [0:]
plot '../accepted-results/itu-server/contended-writes/contended-writes-server' using 2:3:5:xticlabels(2) with errorlines title "writes", \
     '../accepted-results/itu-server/contended-writes/contended-writes-array-server' using 2:3:5 with errorlines title "writes-array", \
     '../accepted-results/itu-server/contended-writes/contended-writes-and-reads-server' using 2:3:5 with errorlines title "writes-and-reads"

set output "sharedintbarrier.tex"
set size 0.5,0.5
set key off
set yrange [0:]
plot '../accepted-results/x1/contended-writes/contended-writes-with-barriers' using 2:3:5:xticlabels(2) with errorlines title "writes-volatile", \
     '../accepted-results/x1/contended-writes/contended-writes-and-reads-with-barriers' using 2:3:5 with errorlines title "writes-and-reads-volatile"

set output "sharedintbarrierdesktop.tex"
set yrange [0:]
plot '../accepted-results/itu-desktop/contended-writes/contended-writes-with-barriers-desktop' using 2:3:5:xticlabels(2) with errorlines title "writes-volatile-desktop", \
     '../accepted-results/itu-desktop/contended-writes/contended-writes-and-reads-with-barriers-desktop' using 2:3:5 with errorlines title "writes-and-reads-volatile-desktop"

set output "sharedintbarrierserver.tex"
set size 1,0.5
set key on left
set yrange [0:]
plot '../accepted-results/itu-server/contended-writes/contended-writes-with-barriers-server' using 2:3:5:xticlabels(2) with errorlines title "writes-barriers", \
     '../accepted-results/itu-server/contended-writes/contended-writes-and-reads-with-barriers-server' using 2:3:5 with errorlines title "writes-and-reads-barriers"

set key on
unset size
set output "paral.tex"
set yrange [0:]
plot '../accepted-results/x1/parallelisability/io-intense-sum' using 2:3:5:xticlabels(2) with errorlines title "mem-reads", \
     '../accepted-results/x1/parallelisability/io-intense-sumwrites' using 2:3:5 with errorlines title "mem-writes", \
     '../accepted-results/x1/parallelisability/cpu-intense-div' using 2:3:5 with errorlines title "CPU", \
     '../accepted-results/x1/parallelisability/mixed-intensive' using 2:3:5 with errorlines title "mixed"

set output "paral-desktop.tex"
set yrange [0:]
plot '../accepted-results/itu-desktop/parallelisability/io-intense-sum-desktop' using 2:3:5:xticlabels(2) with errorlines title "mem-reads", \
     '../accepted-results/itu-desktop/parallelisability/io-intense-sumwrites-desktop' using 2:3:5 with errorlines title "mem-writes", \
     '../accepted-results/itu-desktop/parallelisability/cpu-intense-div-desktop' using 2:3:5 with errorlines title "CPU", \
     '../accepted-results/itu-desktop/parallelisability/mixed-intensive-desktop' using 2:3:5 with errorlines title "mixed"

set output "paral-server.tex"
set yrange [0:]
plot '< sort -nk2 ../accepted-results/itu-server/parallelisability/io-intense-sum-server' using 2:3:5:xticlabels(2) with errorlines title "mem-reads", \
     '< sort -nk2 ../accepted-results/itu-server/parallelisability/io-intense-sumwrites-server' using 2:3:5 with errorlines title "mem-writes", \
     '< sort -nk2 ../accepted-results/itu-server/parallelisability/cpu-intense-div-server' using 2:3:5 with errorlines title "CPU", \
     '< sort -nk2 ../accepted-results/itu-server/parallelisability/mixed-intensive-server' using 2:3:5 with errorlines title "mixed"

set key off
unset size
set yrange [0:]

set output "histo-cas-i5.tex"
plot '../accepted-results/x1/histograms/Histo-cas' using 2:3:5:xticlabels(2) with errorlines title "histogram-cas-i5", \

set output "histo-cas-i7.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-cas' using 2:3:5:xticlabels(2) with errorlines title "histogram-cas-i7", \

set output "histo-cas-xeon.tex"
plot '../accepted-results/itu-server/histograms/Histo-cas' using 2:3:5:xticlabels(2) with errorlines title "histogram-cas-xeon", \

set key off
set size 0.33,0.5
set lmargin 0.7
set rmargin 0.7

set xtics 0,32,128 rotate by 45 right
set mxtics 2

set yrange [0:9e7]
set ytics ("" 1e7, "" 2e7, "" 3e7, "" 4e7, "" 5e7, "" 6e7, "" 7e7,"" 8e7, "" 9e7)

set output "Histo-lock-local-0-itu-desktop.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-lock-local-0' using 2:3:5 with errorlines title "Histo-lock-local-0-itu-desktop"

set output "Histo-lock-local-16-itu-desktop.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-lock-local-16' using 2:3:5 with errorlines title "Histo-lock-local-16-itu-desktop"

set output "Histo-lock-local-32-itu-desktop.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-lock-local-32' using 2:3:5 with errorlines title "Histo-lock-local-32-itu-desktop"

set output "Histo-lock-local-48-itu-desktop.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-lock-local-48' using 2:3:5 with errorlines title "Histo-lock-local-48-itu-desktop"

set output "Histo-lock-local-64-itu-desktop.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-lock-local-64' using 2:3:5 with errorlines title "Histo-lock-local-64-itu-desktop"

set output "Histo-lock-local-80-itu-desktop.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-lock-local-80' using 2:3:5 with errorlines title "Histo-lock-local-80-itu-desktop"

set output "Histo-lock-local-96-itu-desktop.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-lock-local-96' using 2:3:5 with errorlines title "Histo-lock-local-96-itu-desktop"

set output "Histo-lock-local-112-itu-desktop.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-lock-local-112' using 2:3:5 with errorlines title "Histo-lock-local-112-itu-desktop"

set output "Histo-lock-local-128-itu-desktop.tex"
plot '../accepted-results/itu-desktop/histograms/Histo-lock-local-128' using 2:3:5 with errorlines title "Histo-lock-local-128-itu-desktop"

set yrange [0:5e8]
set ytics ("" 1e8, "" 2e8, "" 3e8, "" 4e8, "" 5e8)

set output "Histo-lock-local-0-itu-server.tex"
plot '../accepted-results/itu-server/histograms/Histo-lock-local-0' using 2:3:5 with errorlines title "Histo-lock-local-0-itu-server"

set output "Histo-lock-local-16-itu-server.tex"
plot '../accepted-results/itu-server/histograms/Histo-lock-local-16' using 2:3:5 with errorlines title "Histo-lock-local-16-itu-server"

set output "Histo-lock-local-32-itu-server.tex"
plot '../accepted-results/itu-server/histograms/Histo-lock-local-32' using 2:3:5 with errorlines title "Histo-lock-local-32-itu-server"

set output "Histo-lock-local-48-itu-server.tex"
plot '../accepted-results/itu-server/histograms/Histo-lock-local-48' using 2:3:5 with errorlines title "Histo-lock-local-48-itu-server"

set output "Histo-lock-local-64-itu-server.tex"
plot '../accepted-results/itu-server/histograms/Histo-lock-local-64' using 2:3:5 with errorlines title "Histo-lock-local-64-itu-server"

set output "Histo-lock-local-80-itu-server.tex"
plot '../accepted-results/itu-server/histograms/Histo-lock-local-80' using 2:3:5 with errorlines title "Histo-lock-local-80-itu-server"

set output "Histo-lock-local-96-itu-server.tex"
plot '../accepted-results/itu-server/histograms/Histo-lock-local-96' using 2:3:5 with errorlines title "Histo-lock-local-96-itu-server"

set output "Histo-lock-local-112-itu-server.tex"
plot '../accepted-results/itu-server/histograms/Histo-lock-local-112' using 2:3:5 with errorlines title "Histo-lock-local-112-itu-server"

set output "Histo-lock-local-128-itu-server.tex"
plot '../accepted-results/itu-server/histograms/Histo-lock-local-128' using 2:3:5 with errorlines title "Histo-lock-local-128-itu-server"

set yrange [0:1.5e8]
set ytics ("" 0.5e8, "" 1e8, "" 1.5e8)

set output "Histo-lock-local-0-x1.tex"
plot '../accepted-results/x1/histograms/Histo-lock-local-0' using 2:3:5 with errorlines title "Histo-lock-local-0-x1"

set output "Histo-lock-local-16-x1.tex"
plot '../accepted-results/x1/histograms/Histo-lock-local-16' using 2:3:5 with errorlines title "Histo-lock-local-16-x1"

set output "Histo-lock-local-32-x1.tex"
plot '../accepted-results/x1/histograms/Histo-lock-local-32' using 2:3:5 with errorlines title "Histo-lock-local-32-x1"

set output "Histo-lock-local-48-x1.tex"
plot '../accepted-results/x1/histograms/Histo-lock-local-48' using 2:3:5 with errorlines title "Histo-lock-local-48-x1"

set output "Histo-lock-local-64-x1.tex"
plot '../accepted-results/x1/histograms/Histo-lock-local-64' using 2:3:5 with errorlines title "Histo-lock-local-64-x1"

set output "Histo-lock-local-80-x1.tex"
plot '../accepted-results/x1/histograms/Histo-lock-local-80' using 2:3:5 with errorlines title "Histo-lock-local-80-x1"

set output "Histo-lock-local-96-x1.tex"
plot '../accepted-results/x1/histograms/Histo-lock-local-96' using 2:3:5 with errorlines title "Histo-lock-local-96-x1"

set output "Histo-lock-local-112-x1.tex"
plot '../accepted-results/x1/histograms/Histo-lock-local-112' using 2:3:5 with errorlines title "Histo-lock-local-112-x1"

set output "Histo-lock-local-128-x1.tex"
plot '../accepted-results/x1/histograms/Histo-lock-local-128' using 2:3:5 with errorlines title "Histo-lock-local-128-x1"

#hashmap plots
set output "hashmap-striped-i5.tex"
set key on right
unset size
set lmargin
set rmargin
set xtics auto
set mxtics
set ytics auto
unset yrange
unset xrange
set yrange [0:]

plot '../accepted-results/x1/hashmap/hashmapsumstriped-personal' using 2:3:5:xticlabels(2) with errorlines title "i5"

set output "hashmap-striped-i7-xeon.tex"
set yrange [0:]

plot '../accepted-results/itu-desktop/hashmap/hashmapsumstriped-desktop' using 2:3:5:xticlabels(2) linestyle 2 with errorlines title "i7", \
     '../accepted-results/itu-server/hashmap/hashmapsumstriped-server' using 2:3:5 linestyle 3 with errorlines title "Xeon"

set output "hashmap-stripedwrite.tex"
set yrange [0:]

plot '../accepted-results/x1/hashmap/hashmapsumstripedwrite-personal' using 2:3:5:xticlabels(2) with errorlines title "i5", \
     '../accepted-results/itu-desktop/hashmap/hashmapsumstripedwrite-desktop' using 2:3:5 with errorlines title "i7", \
     '../accepted-results/itu-server/hashmap/hashmapsumstripedwrite-server' using 2:3:5 with errorlines title "Xeon"
