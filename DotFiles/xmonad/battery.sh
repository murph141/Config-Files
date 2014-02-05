#!/bin/bash

percent=`acpi | awk '{ print $4 }' | sed 's/%//' | sed 's/,//'`
time=`acpi | awk '{ print $5 }'`

if [ "$percent" -lt "25" ]; then
  percent="<fc=red>$percent%</fc>"
elif [ "$percent" -lt "50" ]; then
  percent="<fc=orange>$percent%</fc>"
elif [ "$percent" -lt "75" ]; then
  percent="<fc=yellow>$percent%</fc>"
else
  percent="<fc=green>$percent%</fc>"
fi

echo "Battery: $percent (<fc=purple>$time</fc>)"
