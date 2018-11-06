#!/bin/sh
if [ $# -lt 2 ]
then
 echo "Missing arguments!!! To run"
 echo "bash One_trigger_PMT_batch.sh [number_of_sample] [dir] [# files] <starting index>"
 return 
fi
number_samples=$1
dirname=$2
num=$3
init=0
if [ $# -eq 4 ]
then
 init=$4
 num=`expr ${init} + ${num}`
fi

for j in `seq ${init} ${num}`
do
 #echo "starting file ${j}"
 echo "./DDC10_data_readout -wd ${dirname} -i ${j}.txt -o ${j}_${outfilename}.root"
 ./DDC10_data_readout_no_trigger_add_baseline -wd ${dirname} -i ${j}_PMT.txt -o ${j}_PMT_Only.root -n ${number_samples}
 echo "file ${j} complete"
done
