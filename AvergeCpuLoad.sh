#!/bin/bash

minutes=1
total=0

#var=`top -d 5 -n 10 | grep Cpu | awk '{print $5}' | sed 's/%.*//'`


iteration=`expr $minutes \* 12`
loop=$iteration
start_time=`date +'%s'`
while [ $iteration -ge 1 ];do
	var=`top -n 1 | grep Cpu | awk '{print $5}' | sed 's/%.*//'`
	echo "var = $var"
	total=`echo $total + $var | bc -l`
	echo "total = $total"
	iteration=`expr $iteration - 1`
	echo "iteration = $iteration"
	sleep 5
done
end_time=`date +'%s'`

total_time=`expr $start_time - $end_time`
echo "total time taken = $total_time"

average=`echo $total / $loop | bc -l`
echo "average = $average"
