#!/bin/bash

if [ -e $1 ]; then
    echo "El archivo existe"
    if [ -f $1 ]; then  
        echo "Es un fichero"
    else
        echo "Es un directorio"
    fi
else
    echo "El archivo no existe"
fi