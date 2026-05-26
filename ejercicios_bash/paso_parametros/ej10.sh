#!/bin/bash

read -p "Introduce dos parámetros: origen y destino " o d

if [ -e "$o" ]; then
    if [ -e "$d" ]; then
        read -p "¿Quieres sobreescribir el destino? " respuesta
        if [ $respuesta = "si" ];then
            cp "$o" "$d"
        else
            echo "El usuario no quiere sobreescribir la ruta"
            exit 1
        fi
    else
        cp "$o" "$d"
    fi
else
    echo "El origen no existe"
    exit 1
fi