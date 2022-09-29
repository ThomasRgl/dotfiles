#!/bin/sh

temp=`cat /sys/class/hwmon/hwmon3/temp1_input`
n=1000

printf "Dazot: %s°C" $(($temp / $n))
