#!/bin/sh

temp=`cat /sys/class/hwmon/hwmon3/temp1_input`
n=1000
if [ $(($temp / $n)) -gt "50" ]
then
    printf "Dazot: %s°C" $(($temp / $n))
else
    printf "DazCold: %s°C" $(($temp / $n))
fi
