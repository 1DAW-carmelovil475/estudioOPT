#!/bin/bash

if [ ${#1} -eq 0 ];then
    echo "Debes de proporcionar la ruta de un archivo correcto"
    exit 1
fi

if [ -r $1 ];then
    if [ ${#2} -gt 0 ];then
        ocurrencias=$(grep "$2" "$1" | wc -l)
        ultimas_3=$(grep "$2" "$1" | tail -3)
        primeras_3=$(grep "$2" "$1"| head -n 3)

        echo "-----Estas son las primeras 3-----" >> encontrados.log
        echo "$primeras_3" >> encontrados.log
        echo "-----Estas son las últimas 3-----" >> encontrados.log
        echo "$ultimas_3" >> encontrados.log
        echo "-----Estas son las ocurrencias-----" >> encontrados.log
        echo "$ocurrencias" >> encontrados.log >> encontrados.log
        exit 0
    else
        echo "ERROR: Debes de proporcionar una palabra a buscar"
        exit 1
    fi
else
    echo "ERROR: El archivo o no exite o no es legible"
    exit 1
fi
