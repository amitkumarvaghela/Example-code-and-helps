#!/bin/bash

echo "Calculating CPU idle usage"
echo -n "Enter duration in seconds : "
read duration
echo "calulating CPU idle details for $duration seconds"

echo $duration | grep "^[0-9]"
var_stat=$?


if [ $var_stat -eq 1 ] ;then
	echo "Enter positive non-zero integer only"
	exit
else 
	if [ $duration -le 0 ];then
		echo "Enter positive non-zero integer only"
		exit
	fi
fi

calc_time=0
end_time=0

id=0; tot=0; p_id=0; p_tot=0;
iteration=0
total_idle_cpu_usage=0

start_time=`date +'%s'`
while [ $end_time -le $(($start_time+$duration)) ];do
	
	let iteration=$iteration"+"1
	p_id=$id; p_tot=$tot;
	x=`cat /proc/stat | grep -w cpu`;
	id=`echo $x | cut -d " " -f 5`;
	tot=0;
	for f in `echo $x`; do
	tot=$(($tot + $f));
	done;
	
	total_idle_cpu_usage=$(( (($id - $p_id)*100/($tot - $p_tot))+$total_idle_cpu_usage ))
	calc_time=`date +'%s'`
	end_time=`date +'%s'`
	sleep 0.5
	echo -ne "\rWait for "$((($start_time+$duration)-$end_time))" seconds"
done

echo -e "\nNumber of iteration done\t = $iteration"
echo -e "Average CPU idle usage\t\t = "$(($total_idle_cpu_usage/$iteration))" %"

