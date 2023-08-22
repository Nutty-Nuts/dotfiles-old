#!/bin/sh
mpstat 2 | while read line; 
do
    cpu_usage=`echo $line | awk '{printf $4}' 2> /dev/null` 
    echo "$cpu_usage"
done;
