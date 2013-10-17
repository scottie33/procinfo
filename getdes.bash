function GetDes ()
{ 
	#DES=`ls /proc/$1/fd | wc -l` 
	DES=`lsof -p $1 | wc -l` 
    echo -ne $DES 
}

function CheckDes ()
{
	des=` GetDes $PID` 
 	if [ $des -gt 900 ]; then 
    	echo -ne "$des(>900)"
	else 
    	echo -ne "$des(normal)"
	fi
}