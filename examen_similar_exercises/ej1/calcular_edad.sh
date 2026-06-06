#!/bin/bash

read -p "Introduce tu fecha de nacimiento: " fecha;

anyo_actual=$(date +%Y)



if [[ $fecha -gt 1899 && $fecha -lt $anyo_actual ]];then
    edad=$(($anyo_actual-$fecha));
    if [ $edad -gt 17 ];then
        echo "Eres mayor de edad y tu edad es: $edad";
        exit 0;
    else
        echo "Eres menor de edad y tu edad es: $edad";
        exit 0;
    fi
else
    echo "No has introducido correctamente el año en el que naciste";
    exit 1;
fi