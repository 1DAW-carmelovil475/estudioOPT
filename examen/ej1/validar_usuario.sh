#!/bin/bash

read -p "Introduce el nombre del usuario: " usuario
read -s -p "Introduce la contraseña: " password
echo
if [[ ${#usuario} -gt 2 && ${#usuario} -lt 16 ]];then
    if [[ "$usuario" =~ ^[a-z0-9]+$ ]];then
        if [ ${#password} -gt 7 ];then
            echo "$usuario":$(date +%Y%m%d_%H%M%S) >> usuarios.txt;
            exit 0;
        else
            echo "La contraseña debe de tener al menos 8 caracteres";
            exit 1;
        fi
    else
        echo "El usuario debe de ser sin espacios, solo letras minúsculas y números";
        exit 1;
    fi
else
    echo "El usuario debe de tener una longitud entre 3 y 15";
    exit 1
fi
    
    