#!/bin/bash

read -p "Introduce el nombre del producto: " nombre;

if [ "${#nombre}" -gt 0 ];then
    read -p "Introduce el precio de $nombre: " precio;
    if [ $precio -gt 0 ];then
        echo "$nombre":"$precio":$(date +%Y%m%d_%H%M%S) >> archivo.txt;
        exit 0;
    else
        echo "El precio introducido debe de ser positivo";
        exit 1;
    fi
else    
    echo "El nombre no ha sido introducido";
    exit 1;
fi
