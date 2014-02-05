#!/bin/bash

percent=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
percent=$(echo "$percent * 1.0" | bc)

if [[ $(echo " $percent < 1" | bc) -eq 1 ]]; then
  percent="CPU: <fc=green>0$percent</fc>"
elif [[ $(echo " $percent < 10" | bc) -eq 1 ]]; then
  percent="CPU: <fc=green>$percent</fc>"
elif [[ $(echo " $percent < 20" | bc) -eq 1 ]]; then
  percent="CPU: <fc=yellow>$percent</fc>"
elif [[ $(echo " $percent < 35" | bc) -eq 1 ]]; then
  percent="CPU: <fc=orange>$percent</fc>"
else
  percent="CPU: <fc=red>$percent</fc>"
fi

echo $percent
