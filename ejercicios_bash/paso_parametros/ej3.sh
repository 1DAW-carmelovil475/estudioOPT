#!/bin/bash

read -p "Introduce dos números: " n1 n2

if [ -n "$n1" ]; then
    if [ -n "$n2" ]; then
        echo "Los números son: $n1 y $n2. Se han pasado correctamente"
    else
        echo "El segundo número no lo has pasado correctamente"
    fi
else
    echo "No has pasado correctamente los números"
fi

# Esta es la forma más correcta: 
# if [[ $n1 =~ ^[0-9]+$ ]]; then