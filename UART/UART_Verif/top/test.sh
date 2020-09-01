#!/bin/bash

rm -r report
mkdir report #make a new directory
mkdir report/output_log
num=0 # set count to zero -- initialize
for i in *.svp; # loop through all files containing .svp
do
  num=$(( num+=1 )) #increase the count 
  echo "$num. svp file found for testing $i" 
  ./sv_uvm uart_top.sv $i > report/report_$num.txt # run the command and save the output to folder report 
  echo "Dumping report for file $num " #echo out the output
  echo "Starting Error logs"
  echo "***********This is automatically generated***********" >  report/output_log/Errors_$num.txt
  echo "" >> report/output_log/Errors_$num.txt
  grep -nwi -A 2 "ERROR" "report/report_$num.txt" >> report/output_log/Errors_$num.txt
  echo "Errors noted to file errors_$num.txt"
  
done
  