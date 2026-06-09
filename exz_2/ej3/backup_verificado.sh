#!/bin/bash

origen=$1
destino=$2

fecha=$(date +%Y%m%d_%H%M%S)

if [ $# -ne 2 ]; then
    echo "Error: debes proporcionar origen y destino"
    exit 1
fi

if [ -d "$1" ];then
    archivo="backup_$fecha.tar.gz"
    if [ -d "$2" ];then
        tar -czf "$destino/$archivo" -C "$origen" .
        sha256sum "$destino/$archivo" > "$destino/$archivo.sha256"
        if sha256sum -c "$destino/$archivo.sha256";then
            echo "Backup verificado correctamente"
            exit 0
        else
            echo "ERROR: el backup está corrupto"
            exit 1
        fi
    else
        mkdir -p "$destino"
        tar -czf "$destino/$archivo" -C "$origen" .
        sha256sum "$destino/$archivo" > "$destino/$archivo.sha256"
        if sha256sum -c "$destino/$archivo.sha256";then
            echo "Backup verificado correctamente"
            exit 0
        else
            echo "ERROR: el backup está corrupto"
            exit 1
        fi
    fi

else
    echo "ERROR: El origen debe de ser un directorio"
    exit 1
fi