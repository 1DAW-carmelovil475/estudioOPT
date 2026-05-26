#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: debes indicar un puerto" >&2
    exit 1
fi

uso=$(ss -ltnp | grep ":$1 ")
if [ -n "$uso" ]; then
    echo "$uso" > puerto_$1.txt
else
    echo "Libre"
    nc -l $1 > escucha_$1.log &
    pid=$!
    sleep 10
    kill $pid
fi