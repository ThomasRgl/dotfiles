#!/bin/sh

temp=`cat /sys/class/hwmon/hwmon1/temp1_input`
n=1000

printf "Coffee: %s°C" $(($temp / $n))
