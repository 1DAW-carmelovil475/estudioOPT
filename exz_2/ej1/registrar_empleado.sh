#!/bin/bash

echo "Buenas empleado@"
read -p "Introduce tu nombre: " nombre

if [[ $nombre =~ ^[A-Za-z\ ]{3,30}$ ]];then
    read -p "Introduce el código de empleado: " codigo
    if [[ $codigo =~ ^[A-Z]{2}[0-9]{4}$ ]];then
        read -p "Introduce el departamento al que pertenece: " departamento
        fecha=$(date +%Y%m%d_%H%M%S)
        echo "-------------------------------------------"
        echo "EMPLEADO GUARDADO CORRECTAMENTE, BIENVENID@"
        echo "-------------------------------------------"
        echo "$codigo:$nombre:$departamento:$fecha" >> empleados.txt
        exit 0
    else
        echo "ERROR: El código de empleado es incorrecto"
        exit 1
    fi
else
    echo "ERROR: El nombre del empelado es incorrecto"
    exit 1
fi