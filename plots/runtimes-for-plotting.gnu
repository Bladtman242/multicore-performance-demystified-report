set term epslatex

#set output "cpuloadx1.tex"

#set yrange [0:]
#plot '../accepted-results/x1/cpu-baseline/cpuload-nobg-nox' with linespoints title "x1-passive-cpuload"
#
#set output "cpuload-desktop.tex"
#
#set yrange [0:]
#plot '../accepted-results/itu-desktop/cpu-baseline/cpuload' with linespoints title "itu-desktop-passive-cpuload"
#
#set output "cpuload-server.tex"
#
#set yrange [0:]
#plot '../accepted-results/itu-server/cpu-baseline/cpuload' with linespoints title "itu-server-passive-cpuload"

set output "nobarrier.tex"
incsNoBarrier=66000000
incsBarrier=6000000

set yrange [0:]
plot '../accepted-results/x1/intcounters-4threads/counters-no-barrier-local' using 2:($3/incsNoBarrier):xticlabels(2) with linespoints title "i5-local", \
     '../accepted-results/x1/intcounters-4threads/counters-no-barrier-array' using 2:($3/incsNoBarrier) with linespoints title "i5-array", \
     '../accepted-results/itu-desktop/intcounters-8threads/counters-no-barrier-local-desktop' using 2:($3/incsNoBarrier) with linespoints title "i7-local", \
     '../accepted-results/itu-desktop/intcounters-8threads/counters-no-barrier-array-desktop' using 2:($3/incsNoBarrier) with linespoints title "i7-array", \
     '../accepted-results/itu-server/intcounters-48threads/counters-no-barrier-local-server' using 2:($3/incsNoBarrier) with linespoints title "xeon-local", \
     '../accepted-results/itu-server/intcounters-48threads/counters-no-barrier-array-server' using 2:($3/incsNoBarrier) with linespoints title "xeon-array"

set output "barrier.tex"
set yrange [0:]
plot '../accepted-results/x1/intcounters-4threads/counters-barrier-local' using 2:($3/incsBarrier):xticlabels(2) with linespoints title "i5-local", \
     '../accepted-results/x1/intcounters-4threads/counters-barrier-array' using 2:($3/incsBarrier) with linespoints title "i5-array", \
     '../accepted-results/itu-desktop/intcounters-8threads/counters-barrier-local-desktop' using 2:($3/incsBarrier) with linespoints title "i7-local", \
     '../accepted-results/itu-desktop/intcounters-8threads/counters-barrier-array-desktop' using 2:($3/incsBarrier) with linespoints title "i7-array", \
     '../accepted-results/itu-server/intcounters-48threads/counters-barrier-local-server' using 2:($3/incsBarrier) with linespoints title "xeon-local", \
     '../accepted-results/itu-server/intcounters-48threads/counters-barrier-array-server' using 2:($3/incsBarrier) with linespoints title "xeon-array"

#set output "qsort.tex"
#set yrange [0:]
#plot '../accepted-results/x1/qsort/qsort-by-cutoff-native-array' using 2:3:5:xticlabels(2) with errorlines title "by-cutoff-native-array", \
#     '../accepted-results/x1/qsort/qsort-by-padding-padall-array' using 2:3:5 with errorlines title "by-padding-padall-array", \
#     '../accepted-results/x1/qsort/qsort-by-padding-padsome-array' using 2:3:5 with errorlines title "by-padding-padsome-array"
#
#set output "qsort-desktop.tex"
#set yrange [0:]
#plot '../accepted-results/itu-desktop/qsort/qsort-by-cutoff-native-array' using 2:3:5:xticlabels(2) with errorlines title "by-cutoff-native-array-desktop", \
#     '../accepted-results/itu-desktop/qsort/qsort-by-padding-padall-array' using 2:3:5 with errorlines title "by-padding-padall-array-desktop", \
#     '../accepted-results/itu-desktop/qsort/qsort-by-padding-padsome-array' using 2:3:5 with errorlines title "by-padding-padsome-array-desktop"
#
#set output "qsort-server.tex"
#set yrange [0:]
#plot '../accepted-results/itu-server/qsort/qsort-by-cutoff-native-array' using 2:3:5:xticlabels(2) with errorlines title "by-cutoff-native-array-server", \
#     '../accepted-results/itu-server/qsort/qsort-by-padding-padall-array' using 2:3:5 with errorlines title "by-padding-padall-array-server", \
#     '../accepted-results/itu-server/qsort/qsort-by-padding-padsome-array' using 2:3:5 with errorlines title "by-padding-padsome-array-server"
#
#set output "readtimes.tex"
#set yrange [0:]
#set xrange [0:]
#set xtics () rotate by -45
#plot '< head -n 7 ../accepted-results/x1/readtimes-cyclic/readtimes-cyclic-array' using 2:3:5:xticlabels(2) with errorlines title "readtimes-by-array-size", \
#     '< head -n 7 ../accepted-results/x1/readtimes-cyclic/readtimes-padded-cyclic-array' using 2:3:5 with errorlines title "readtimes-by-array-size-padded", \
#     '< head -n 7 ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-cyclic-array-desktop' using 2:3:5 with errorlines title "readtimes-by-array-size-desktop", \
#     '< head -n 7 ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-padded-cyclic-array-desktop' using 2:3:5 with errorlines title "readtimes-by-array-size-padded-desktop", \
#     '< head -n 7 ../accepted-results/itu-server/readtimes-cyclic/readtimes-cyclic-array-server' using 2:3:5 with errorlines title "readtimes-by-array-size-server", \
#     '< head -n 7 ../accepted-results/itu-server/readtimes-cyclic/readtimes-padded-cyclic-array-server' using 2:3:5 with errorlines title "readtimes-by-array-size-padded-server"
#
#set output "readtimes2.tex"
#set yrange [0:]
#set xrange [*:]
#set xtics () rotate by -45
#plot '< sort -k2n ../accepted-results/x1/readtimes-cyclic/readtimes-cyclic-array' using 2:3:5:xticlabels(2) with errorlines title "readtimes-by-array-size", \
#     '< tail -n+7 ../accepted-results/x1/readtimes-cyclic/readtimes-padded-cyclic-array' using 2:3:5 with errorlines title "readtimes-by-array-size-padded", \
#     '< sort -k2n ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-cyclic-array-desktop' using 2:3:5 with errorlines title "readtimes-by-array-size-desktop", \
#     '< tail -n+7 ../accepted-results/itu-desktop/readtimes-cyclic/readtimes-padded-cyclic-array-desktop' using 2:3:5 with errorlines title "readtimes-by-array-size-padded-desktop", \
#     '< sort -k2n ../accepted-results/itu-server/readtimes-cyclic/readtimes-cyclic-array-server' using 2:3:5:xticlabels(2) with errorlines title "readtimes-by-array-size-server", \
#     '< tail -n+7 ../accepted-results/itu-server/readtimes-cyclic/readtimes-padded-cyclic-array-server' using 2:3:5 with errorlines title "readtimes-by-array-size-padded-server"

set output "sharedint.tex"
set size 0.5,0.5
set key off
set yrange [0:]
unset logscale 

incsNoBarrier = 200000000
incsBarrier   = 20000000

plot '../accepted-results/x1/contended-writes/contended-writes' using 2:($3/incsNoBarrier):xticlabels(2) with errorlines title "contended-writes", \
     '../accepted-results/x1/contended-writes/contended-writes-array' using 2:($3/incsNoBarrier) with errorlines title "contended-writes-array", \
     '../accepted-results/x1/contended-writes/contended-writes-and-reads' using 2:($3/incsNoBarrier) with errorlines title "contended-writes-and-reads"

set output "sharedintdesktop.tex"
set yrange [0:]
plot '../accepted-results/itu-desktop/contended-writes/contended-writes-desktop' using 2:($3/incsNoBarrier):xticlabels(2) with errorlines title "contended-writes-desktop", \
     '../accepted-results/itu-desktop/contended-writes/contended-writes-array-desktop' using 2:($3/incsNoBarrier) with errorlines title "contended-writes-array-desktop", \
     '../accepted-results/itu-desktop/contended-writes/contended-writes-and-reads-desktop' using 2:($3/incsNoBarrier) with errorlines title "contended-writes-and-reads-desktop"

set output "sharedintserver.tex"
set size 1,0.5
set key off
set yrange [0:]
plot '../accepted-results/itu-server/contended-writes/contended-writes-server' using 2:($3/incsNoBarrier):xticlabels(2) with errorlines title "contended-writes-server", \
     '../accepted-results/itu-server/contended-writes/contended-writes-array-server' using 2:($3/incsNoBarrier) with errorlines title "contended-writes-array-server", \
     '../accepted-results/itu-server/contended-writes/contended-writes-and-reads-server' using 2:($3/incsNoBarrier) with errorlines title "contended-writes-and-reads-server"

set output "sharedintbarrier.tex"
set size 0.5,0.5
set yrange [0:]
plot '../accepted-results/x1/contended-writes/contended-writes-with-barriers' using 2:($3/incsBarrier):xticlabels(2) with errorlines title "contended-writes-barriers", \
     '../accepted-results/x1/contended-writes/contended-writes-and-reads-with-barriers' using 2:($3/incsBarrier) with errorlines title "contended-writes-and-reads-barriers"

set output "sharedintbarrierdesktop.tex"
set yrange [0:]
plot '../accepted-results/itu-desktop/contended-writes/contended-writes-with-barriers-desktop' using 2:($3/incsBarrier):xticlabels(2) with errorlines title "contended-writes-barriers-desktop", \
     '../accepted-results/itu-desktop/contended-writes/contended-writes-and-reads-with-barriers-desktop' using 2:($3/incsBarrier) with errorlines title "contended-writes-and-reads-barriers-desktop"

set output "sharedintbarrierserver.tex"
set size 1,0.5
set yrange [0:]
plot '../accepted-results/itu-server/contended-writes/contended-writes-with-barriers-server' using 2:($3/incsBarrier):xticlabels(2) with errorlines title "contended-writes-barriers-server", \
     '../accepted-results/itu-server/contended-writes/contended-writes-and-reads-with-barriers-server' using 2:($3/incsBarrier) with errorlines title "contended-writes-and-reads-barriers-server"

#set output "kmeans.tex"
#set yrange [0:]
#plot '../accepted-results/x1/kmeans/kmeans-p-normalcluster' using 2:3:5:xticlabels(2) with errorlines title "kmeans-p", \
#     '../accepted-results/x1/kmeans/kmeans-q-normalcluster' using 2:3:5 with errorlines title "kmeans-q", \
#     '../accepted-results/x1/kmeans/kmeans-q-paddedcluster' using 2:3:5 with errorlines title "kmeans-q-padded"
#
#set output "kmeansdesktop.tex"
#set yrange [0:]
#plot '../accepted-results/itu-desktop/kmeans/kmeans-p-normalcluster-desktop' using 2:3:5:xticlabels(2) with errorlines title "kmeans-p-desktop", \
#     '../accepted-results/itu-desktop/kmeans/kmeans-q-normalcluster-desktop' using 2:3:5 with errorlines title "kmeans-q-desktop", \
#     '../accepted-results/itu-desktop/kmeans/kmeans-q-paddedcluster-desktop' using 2:3:5 with errorlines title "kmeans-q-padded-desktop"
#
#set output "kmeansserver.tex"
#set yrange [0:]
#plot '../accepted-results/itu-server/kmeans/kmeans-p-normalcluster-server' using 2:3:5:xticlabels(2) with errorlines title "kmeans-p-server", \
#     '../accepted-results/itu-server/kmeans/kmeans-q-normalcluster-server' using 2:3:5 with errorlines title "kmeans-q-server", \
#     '../accepted-results/itu-server/kmeans/kmeans-q-paddedcluster-server' using 2:3:5 with errorlines title "kmeans-q-padded-server"
#
#set output "paral.tex"
#set yrange [0:]
#plot '../accepted-results/x1/parallelisability/io-intense-sum' using 2:3:5:xticlabels(2) with errorlines title "io-intense", \
#     '../accepted-results/x1/parallelisability/io-intense-sumwrites' using 2:3:5 with errorlines title "io-intense-writes", \
#     '../accepted-results/x1/parallelisability/cpu-intense-div' using 2:3:5 with errorlines title "cpu-intense", \
#     '../accepted-results/x1/parallelisability/mixed-intensive' using 2:3:5 with errorlines title "mixed"
#
#set output "paral-desktop.tex"
#set yrange [0:]
#plot '../accepted-results/itu-desktop/parallelisability/io-intense-sum-desktop' using 2:3:5:xticlabels(2) with errorlines title "io-intense-desktop", \
#     '../accepted-results/itu-desktop/parallelisability/io-intense-sumwrites-desktop' using 2:3:5 with errorlines title "io-intense-writes-desktop", \
#     '../accepted-results/itu-desktop/parallelisability/cpu-intense-div-desktop' using 2:3:5 with errorlines title "cpu-intense-desktop", \
#     '../accepted-results/itu-desktop/parallelisability/mixed-intensive-desktop' using 2:3:5 with errorlines title "mixed-desktop"
#
#set output "paral-server.tex"
#set yrange [0:]
#plot '< sort -nk2 ../accepted-results/itu-server/parallelisability/io-intense-sum-server' using 2:3:5:xticlabels(2) with errorlines title "io-intense-server", \
#     '< sort -nk2 ../accepted-results/itu-server/parallelisability/io-intense-sumwrites-server' using 2:3:5 with errorlines title "io-intense-writes-server", \
#     '< sort -nk2 ../accepted-results/itu-server/parallelisability/cpu-intense-div-server' using 2:3:5 with errorlines title "cpu-intense-server", \
#     '< sort -nk2 ../accepted-results/itu-server/parallelisability/mixed-intensive-server' using 2:3:5 with errorlines title "mixed-server"
