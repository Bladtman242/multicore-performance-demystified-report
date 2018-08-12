#!/bin/zsh

#Histogram tables
cat <(awk "{printf \"i5 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/x1/histograms/histo-lock-global) \
    <(awk "{printf \"i7 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2*100}" ../accepted-results/itu-desktop/histograms/histo-lock-global) \
    <(awk "{printf \"xeon & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2*100}" ../accepted-results/itu-server/histograms/histo-lock-global) \
    > histo-lock-global

cat <(awk "{printf \"i5 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/x1/histograms/histogram-local-lockfree-personal) \
    <(awk "{printf \"i7 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2*100}" ../accepted-results/itu-desktop/histograms/histogram-local-lockfree-desktop) \
    <(awk "{printf \"xeon & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2*100}" ../accepted-results/itu-server/histograms/histogram-local-lockfree-server) \
    > histo-local-lockfree

#Peter's kmeans
cat <(awk "{printf \"Kmeans2P & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/x1/peterskmeans/peterskmeans-p-normalcluster-personal) \
    <(awk "{printf \"Kmeans2Q & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/x1/peterskmeans/peterskmeans-q-normalcluster-personal) \
    <(awk "{printf \"Kmeans2Q64 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/x1/peterskmeans/peterskmeans-q-paddedcluster-personal) \
    <(awk "{printf \"Kmeans2Q128 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/x1/peterskmeans/peterskmeans-q-paddedlargecluster-personal) \
    > peterskmeans-i5

cat <(awk "{printf \"Kmeans2P & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/itu-desktop/peterskmeans/peterskmeans-p-normalcluster-desktop) \
    <(awk "{printf \"Kmeans2Q & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/itu-desktop/peterskmeans/peterskmeans-q-normalcluster-desktop) \
    <(awk "{printf \"Kmeans2Q64 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/itu-desktop/peterskmeans/peterskmeans-q-paddedcluster-desktop) \
    <(awk "{printf \"Kmeans2Q128 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/itu-desktop/peterskmeans/peterskmeans-q-paddedlargecluster-desktop) \
    > peterskmeans-i7

cat <(awk "{printf \"Kmeans2P & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/itu-server/peterskmeans/peterskmeans-p-normalcluster-server) \
    <(awk "{printf \"Kmeans2Q & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/itu-server/peterskmeans/peterskmeans-q-normalcluster-server) \
    <(awk "{printf \"Kmeans2Q64 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/itu-server/peterskmeans/peterskmeans-q-paddedcluster-server) \
    <(awk "{printf \"Kmeans2Q128 & %.2f & %.2f \\\\\\\ \n\", \$2/1E6, \$4/\$2 * 100}" ../accepted-results/itu-server/peterskmeans/peterskmeans-q-paddedlargecluster-server) \
    > peterskmeans-xeon

