#!/bin/bash

echo "Calculating CPU idle usage"
echo -n "Enter duration in seconds : "
read duration
echo "calulating CPU idle details for $duration seconds"


calc_time=0
end_time=0

id=0; tot=0; p_id=0; p_tot=0;
iteration=0
total_idle_cpu_usage=0

start_time=`date +'%s'`
while [ $end_time -le $(($start_time+$duration)) ];do
	top -d 0.5 -n 1 | grep Cpu > file.tmp
	idle_cpu=`cat file.tmp | cut -d " " -f8 | cut -d "%" -f1`
	total_idle_cpu_usage=`echo $total_idle_cpu_usage+$idle_cpu | bc -l`
let iteration=$iteration"+"1
end_time=`date +'%s'`
done
a=`echo $total_idle_cpu_usage/$iteration | bc -l`
echo "Idle CPU usage = $a"
