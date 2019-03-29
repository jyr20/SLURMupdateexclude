#!/bin/bash

# Name of job submission script
JOBNAME=job_anal.sh

squeue -u $USER > "SQ.temp.txt"
egrep -o "d[0-9]{2}$" SQ.temp.txt > "SQ2.temp.txt"

sed -i 's/d18.*/d18/g' $JOBNAME

while read line
do
	sed -i "s/d18/d18,$line/g" $JOBNAME
done < SQ2.temp.txt
