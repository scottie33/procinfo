function Listen ()
{ 
    #TCPListeningnum=`netstat -an | grep ":$1 " | awk '$1 == "tcp" && $NF == "LISTEN" {print $0}' | wc -l` 
    TCPListeningnum=`netstat -an | grep ":$1 " | awk '$1 == "tcp4" && $NF == "ESTABLISHED" {print $0}' | wc -l` 
    UDPListeningnum=`netstat -an | grep ":$1 " | awk '$1 == "udp" && $NF == "0.0.0.0:*" {print $0}' | wc -l` 
    (( Listeningnum = TCPListeningnum + UDPListeningnum )) 
    if [ $Listeningnum == 0 ]; then
        echo "0"
    else 
        echo "1"
    fi 
}

function Listening ()
{
    isListen=`Listen 8080` 
    if [ $isListen -eq 1 ]; then 
        echo "listening"
    else 
        echo "closed"
    fi
}