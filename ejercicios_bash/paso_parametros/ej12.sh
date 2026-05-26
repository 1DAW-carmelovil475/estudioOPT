#!/bin/bash

tamanyo=$(stat -c%s hola.txt)

if [ $tamanyo -gt 1000000 ];then
    fecha=$(date +%Y%m%d)
    archivo="hola.txt-$fecha"
    tar -czf $archivo.tar.gz hola.txt
    if [ $? -ne 0 ];then
        echo "error" >&2
    else
        echo "" > hola.txt
        echo "Fecha: $(date) - Rotación realizada" >> rotate.log
    fi
fi