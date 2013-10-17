#!/bin/bash


if [ $# -lt 2 ]; then
	echo "usage: cmd [ -u userid ] [ -n procname ] "
	exit -1
fi

userid=""
procname=""

if [ $1 == "-u" ];then 
	shift
	if [ $# -eq 0 ];then
		echo "usage: cmd [ -u userid ] [ -n procname ] "
		exit -1
	else 
		userid=$1
	fi
fi



for eachfile in `ls ??????.bash`; do
	source $eachfile
done



PID=`GetPID $1 $2` 

if [ "-$PID" == "-" ]; then 
	echo "The process does not exist."  
	exit -1  
else
	#echo -e "UID\tPNAME\tPID\tCPU%"
	echo -ne "$1\t$2\t$PID\t"
fi

CPU=`GetCpu $PID`
echo -ne "$CPU\t"

echo ""