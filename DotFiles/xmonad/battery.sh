#!/bin/bash

# Grab the percentage from acpi
percent=`acpi | awk '{ print $4 }' | sed 's/%//' | sed 's/,//'`

# Grab the time from acpi
# If the charger is in, time is the time remaining until fully charged
# If the charger isn't in, time is the time remaining on battery
time=`acpi | awk '{ print $5 }'`

# Change the color displayed according to the percentage
if [ "$percent" -lt "25" ]; then
  percent="<fc=red>$percent%</fc>"
elif [ "$percent" -lt "50" ]; then
  percent="<fc=orange>$percent%</fc>"
elif [ "$percent" -lt "75" ]; then
  percent="<fc=yellow>$percent%</fc>"
else
  percent="<fc=green>$percent%</fc>"
fi

# If the battery is fully charged, only display the percentage
# If the battery isn't fully charged, display the time
if [ $time != '' ]; then
  echo "Battery: $percent (<fc=lightblue>$time</fc>)"
else
  echo "Battery: $percent"
fi
