#!/bin/zsh

threadsPers=4.0
threadsDesk=8.0
threadsServ=48.0

work=4000000.0

persWorkPer=$((work/threadsPers))
deskWorkPer=$((work/threadsDesk))
servWorkPer=$((work/threadsServ))

cat <(awk "{printf \"i5 & %.1f & %.1f \\\\\\\ \n\", \$2/$persWorkPer, \$4/\$2 * 100}" ../accepted-results/x1/histograms/histo-lock-global) \
    <(awk "{printf \"i7 & %.1f & %.1f \\\\\\\ \n\", \$2/$deskWorkPer, \$4/\$2*100}" ../accepted-results/itu-desktop/histograms/histo-lock-global) \
    <(awk "{printf \"xeon & %.1f & %.1f \\\\\\\ \n\", \$2/$servWorkPer, \$4/\$2*100}" ../accepted-results/itu-server/histograms/histo-lock-global) \
    > histo-lock-global
