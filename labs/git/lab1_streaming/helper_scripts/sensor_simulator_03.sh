#! /bin/bash

NODE="03"

while [ : ]
do
 TEMP=$(shuf -i 46200-46400 -n 1)
 HUMI=$(shuf -i 170-190 -n 1)
 DATE=$(date +%Y%m%d%H%M%S)
 echo $DATE$NODE$TEMP$HUMI | nc 127.0.0.1 56438
 sleep .1
done


