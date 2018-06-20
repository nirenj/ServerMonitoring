#!/bin/bash
PRG="$0"
PRGDIR=`dirname "$PRG"`
[ -z "$LT_HOME" ] && LT_HOME=`cd "$PRGDIR/.." ; pwd`
cd $LT_HOME
 
rm -rf data/mem*
> data/mem.csv
echo "writing to mem.csv"
echo "TIME_STAMP,Memory Usage (MB)" | tee -a data/mem.csv
total="$(free -m | grep Mem | tr -s ' ' | cut -d ' ' -f 2)"
#echo $total
 
while :
do
DATE=`date +"%H:%M:%S:%s%:z"`
echo -n "$DATE, " | tee -a data/mem.csv
var="$(top -b -n 1| grep -w influxd | tr -s ' ' | cut -d ' ' -f 11)"
echo "scale=3; ($var*$total/100)" | bc | tee -a data/mem.csv
sleep 1
done
