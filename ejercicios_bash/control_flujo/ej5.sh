#!/bin/bash

if [ -e $1 ]; then
    if [ -r $1 ]; then
        echo "Tiene permiso de lectura"
    fi
    if [ -w $1 ]; then
        echo "Tiene permiso de escritura"
    fi
    if [ -x $1 ]; then
        echo "Tiene permiso de ejecución"
    fi
else
    echo "Este archivo no existe"
fi