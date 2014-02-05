#!/bin/bash

free=`free -m | grep buffers/ | awk '{ print $3}'`
total=`free -m | grep Mem | awk '{print $2}'`

memory=`echo "scale = 1;$free*100/$total" | bc`

if [ $(echo "$memory < 1" | bc) -eq 1 ]; then
  memory="Memory: <fc=green>0$memory</fc>"
elif [ $(echo "$memory < 10" | bc) -eq 1 ]; then
  memory="Memory: <fc=green>$memory</fc>"
elif [ $(echo " $memory < 20" | bc) -eq 1 ]; then
  memory="Memory: <fc=yellow>$memory</fc>"
elif [ $(echo " $memory < 35" | bc) -eq 1 ]; then
  memory="Memory: <fc=orange>$memory</fc>"
else
  memory="Memory: <fc=red>$memory</fc>"
fi

echo "$memory"
