#!/bin/bash
PRG="$0"
PRGDIR=`dirname "$PRG"`
[ -z "$LT_HOME" ] && LT_HOME=`cd "$PRGDIR/.." ; pwd`
cd $LT_HOME
 
rm -rf data/cpu*
> data/cpu.csv
echo "writing to cpu.csv"
echo "TIME_STAMP, Usage%" | tee -a data/cpu.csv
while :
do
DATE=`date +"%H:%M:%S:%s%:z"`
echo -n "$DATE, " | tee -a data/cpu.csv
top -b -n 1| grep -w influxd | tr -s ' ' | cut -d ' ' -f 10 | tee -a data/cpu.csv
sleep 1
done
