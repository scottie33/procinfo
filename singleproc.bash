#!/bin/bash

if [ $# -lt 2 ]; then
	echo "usage: cmd userid procname"
	exit -1
fi

for eachfile in `ls ??????.bash`; do
	source $eachfile
done


PID=`GetPID $1 $2` 
#numPID=`NumPID $2`

#echo "numpid=$numPID"

if [ "-$PID" == "-" ]; then 
	echo "The process does not exist."  
	exit -1  
else
	#echo -e "UserNAME\tProcNAME(NUM)\tProcID\tCPU%(STAT)\tMemory(STAT)\tHandles"
	#echo -ne "$1\t$2($numPID)\t$PID"
	echo -e "UserNAME\tProcNAME\tProcID\tCPU%(STAT)\tMemory(STAT)\tHandles"
	echo -ne "$1\t$2\t$PID"
fi

echo -ne "\t"
CheckCpu $PID

echo -ne "\t"
CheckMem $PID

echo -ne "\t"
CheckDes $PID


echo ""