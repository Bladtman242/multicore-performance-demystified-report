#!/bin/zsh

file=$1

orgTime=$(head -n1 $file | awk '{print $3}')
best=$(sort -nk3 $file | head -n1)
name=$(awk '{print $1}' <<< $best)
bestBytes=$(awk '{print $2}' <<< $best)
bestTime=$(awk '{print $3}' <<< $best)

saved=$(((orgTime-bestTime)/orgTime))

echo "$name -- padding: $bestBytes, $saved%"
