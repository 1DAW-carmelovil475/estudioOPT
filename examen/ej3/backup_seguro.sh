#!/bin/bash

origen=$1
destino=$2

if [ $# -ne 2 ]; then
    echo "Error: debes proporcionar origen y destino"
    exit 1
fi

if [ -d "$1" ];then
    archivo="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
    if [ -d "$2" ];then
        tar -czf "$destino/$archivo" -C "$origen" .
        sha256sum "$destino/$archivo" > "$destino/$archivo.sha256"        
        tamanyo=$(du -sh "$destino/$archivo" | cut -f1)
        echo "El tamaño del archivo es: $tamanyo"
        echo "Backup creado en: $destino/$archivo"
        exit 0
    else
        mkdir -p "$2"
        tar -czf "$destino/$archivo" -C "$origen" .
        sha256sum "$destino/$archivo" > "$destino/$archivo.sha256"        
        tamanyo=$(du -sh "$destino/$archivo" | cut -f1)
        echo "El tamaño del archivo es: $tamanyo"
        echo "Backup creado en: $destino/$archivo"
        exit 0
    fi
else
    echo "El origen no existe"
    exit 1
fi
