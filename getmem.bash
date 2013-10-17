function GetMem ()
{ 
	MEMUsage=`ps -o vsz -p $1 | grep -v VSZ` 
	(( MEMUsage /= 1000000)) 
    echo -ne $MEMUsage
    echo -ne "MB" 
}

function CheckMem ()
{
	mem=`GetMem $PID | sed -e "s/MB//"`    
	echo -ne "$mem"            
	if [ $mem -gt 1600 ]; then
		echo -ne "(>1.6G)"
	else 
		echo -ne "(normal)" 
	fi
}