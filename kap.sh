#!/bin/bash
if [[ "$#" == "0" ]]; then
    echo "Missing arguments, 1-2 expected" exit 1;
fi

if [[ "$#" == "1" ]]; then
    port=$1
fi
if [[ "$#" == "2" ]]; then
    port=$2
fi

if [ -z "$port" ];
then
    echo "Error: No port supplied"; exit 2
fi
re='^[0-9]+$'
if ! [[ $port =~ $re ]] ; then
    echo "Error: port is not a number"; exit 3
fi

search=":${port} "
result=`netstat -anop 2>/dev/null | grep $search | awk '{print $7}' | cut -d'/' -f1`
if [ -z "$result" ];
then
echo "Error: No running process at port $port"; exit 4
fi

# TODO: result only first line, if -a option to do all ( verify its a port number)

if [[ "$#" == "1" ]]; then
    echo "PID: $result"
fi
if [[ "$#" == "2" ]]; then

    #separator="\n"
    #if [ "${result##*"$separator"*}" ]; then
    #    echo "Multiple PID found, feature not supported yet"
    #    echo $result
    #    exit 5
    #fi
    
    `kill -9 $result`
    echo "Killed: $result"
fi
exit 0