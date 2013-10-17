#!/bin/bash

function GetPID () { #User #Name  
     PsUser=$1     
     PsName=$2     
     pid=`ps -u $PsUser | grep $PsName | grep -v grep | grep -v vi | grep -v dbx | \\
     grep -v tail | grep -v start | grep -v stop | sed -n 1p | awk '{print $2}'`     
     echo $pid  
}

function NumPID () { #PName
	Runnum=`ps -ef | grep -v vi | grep -v tail | grep "[ /]$1" | grep -v grep | wc -l`
	echo -ne $Runnum
}