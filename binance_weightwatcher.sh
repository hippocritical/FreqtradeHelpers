#!/bin/bash
lastCheckSec=$(date "+%S");
if [ ! -f $1 ]; then
   echo "time,weight" >> $1;
fi
while true; do
   currentSec=$(date "+%S");
   if [ "$lastCheckSec" != "$currentSec" ] && [ "$currentSec" == "58" ]; then
      weight=$(curl -s -o /dev/null -D - "https://api.binance.com/api/v3/ping" | grep "x-mbx-used-weight-1m" | sed "s/x-mbx-used-weight-1m: //");
      datetime=$(date "+%Y/%m/%d %H:%M:%S");
      echo "$datetime: $weight";
      echo "$datetime,$weight" >> $1;
   fi
   lastCheckSec=$currentSec;
   sleep 0.1;
done
