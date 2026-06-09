#!/bin/bash

if [ $# -eq 2 ];then
    if [[ $1 =~ ^[a-zA-Z[:space:]]{3,}$ ]];then
        if [[ $2 =~ ^[0-9]$ ]];then
            fecha=$(date +%Y%m%d_%H%M%S)
            echo "$1:$2:$fecha" >> productos.txt
            echo "Se ha guardado el usuario correctamente"
            exit 0
        else
            echo "ERROR: El precio debe de ser mayor que 0, además de ser un número"
            exit 1
        fi
    else
        echo "ERROR: El nombre solo puede contener letras y espacios y debe de estar formado por mínimo 3 caracteres."
        exit 1
    fi
else
    echo "ERROR: Se deben de pasar 2 parámetros"
    exit 1
fi