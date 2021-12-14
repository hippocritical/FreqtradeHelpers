#!/bin/bash
##########################
# This script sorts the strategies into folders so you don't have to look into each file one by one.
# It currently only works with timeframe notations ' and not ". You d have to edit the strat manually (or do a PR to fix the issue ;] )
# Didnt bother programming in " so the left-overs are to be edited to ' (timeframe = "1m" => timeframe = '1m')
##########################

for varDescription in "timeframe" "ticker_interval"; do
	for timeframe in "1m" "3m" "5m" "15m" "30m" "1h" "2h" "4h" "6h" "8h" "12h" "1d" "3d" "1w" "2w" "1M" "1y"; do
		for filename in ./*; do
		    [ ! -f "$filename" ] && continue
		    if grep -rnw "$filename" -e "$varDescription = '$timeframe'"
		    then
			mv -i "$filename" ./$timeframe
			echo trying to move file to $timeframe - folder
		    fi
		done
	done
done
