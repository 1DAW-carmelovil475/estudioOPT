#!/bin/bash

if [ $# -eq 2 ];then
    if [ -r $1 ];then
        lineas_clave=$(grep "$2" "$1" | wc -l)
        tres_primeras=$(grep "$2" "$1" | head -n 3)
        tres_ultimas=$(grep "$2" "$1" | tail -3)
        pintar=$(grep "$2" "$1")

        echo "$pintar" >> encontrados.log

        existe=$(wc -l "encontrados.log");
        if [ $lineas_clave -eq 0 ];then
            echo "No hay coincidencias"
            exit 1
        else
            echo "Hay coincidencias"
            exit 0
        fi

    else
        echo "ERROR: El archivo pasado debe de existir y ser legible"
        exit 1
    fi
else
    echo "ERROR: Se deben de pasar 2 parámetros"
    exit 1
fi