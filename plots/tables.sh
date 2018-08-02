#!/bin/zsh

#Histogram tables
cat <(awk "{printf \"i5 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/x1/histograms/histo-lock-global) \
    <(awk "{printf \"i7 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2*100}" ../accepted-results/itu-desktop/histograms/histo-lock-global) \
    <(awk "{printf \"xeon & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2*100}" ../accepted-results/itu-server/histograms/histo-lock-global) \
    > histo-lock-global

cat <(awk "{printf \"i5 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/x1/histograms/histogram-local-lockfree-personal) \
    <(awk "{printf \"i7 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2*100}" ../accepted-results/itu-desktop/histograms/histogram-local-lockfree-desktop) \
    <(awk "{printf \"xeon & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2*100}" ../accepted-results/itu-server/histograms/histogram-local-lockfree-server) \
    > histo-local-lockfree

#Peter's kmeans
#
cat <(awk "{printf \"i5 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/x1/peterskmeans/peterskmeans-p-normalcluster-personal) \
    <(awk "{printf \"i7 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/itu-desktop/peterskmeans/peterskmeans-p-normalcluster-desktop) \
    <(awk "{printf \"Xeon & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/itu-server/peterskmeans/peterskmeans-p-normalcluster-server) \
    > peterskmeans-p

cat <(awk "{printf \"i5 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/x1/peterskmeans/peterskmeans-q-normalcluster-personal) \
    <(awk "{printf \"i7 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/itu-desktop/peterskmeans/peterskmeans-q-normalcluster-desktop) \
    <(awk "{printf \"Xeon & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/itu-server/peterskmeans/peterskmeans-q-normalcluster-server) \
    > peterskmeans-q

cat <(awk "{printf \"i5 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/x1/peterskmeans/peterskmeans-q-paddedcluster-personal) \
    <(awk "{printf \"i7 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/itu-desktop/peterskmeans/peterskmeans-q-paddedcluster-desktop) \
    <(awk "{printf \"Xeon & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/itu-server/peterskmeans/peterskmeans-q-paddedcluster-server) \
    > peterskmeans-q-padded

cat <(awk "{printf \"i5 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/x1/peterskmeans/peterskmeans-q-paddedlargecluster-personal) \
    <(awk "{printf \"i7 & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/itu-desktop/peterskmeans/peterskmeans-q-paddedlargecluster-desktop) \
    <(awk "{printf \"Xeon & %.1f & %.1f \\\\\\\ \n\", \$2, \$4/\$2 * 100}" ../accepted-results/itu-server/peterskmeans/peterskmeans-q-paddedlargecluster-server) \
    > peterskmeans-q-paddedlarge
