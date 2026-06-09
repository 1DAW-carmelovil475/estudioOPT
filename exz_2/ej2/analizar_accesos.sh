#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: debes proporcionar un archivo de log"
    exit 1
fi

if [ -r $1 ];then
    lineas_con_404=$(grep "404" "$1" | wc -l)
    ultimas_404=$(grep "404" "$1" | tail -3)
    lineas_con_500=$(grep "500" "$1" | wc -l)
    lineasCompletas_500=$(grep "500" "$1")
    total=$(wc -l < "$1")
    echo "$lineasCompletas_500" >> errores_servidor.log
    echo "===== RESUMEN ====="
    echo ""
    echo "Total 404: $lineas_con_404"
    echo "----------------------"
    echo "Ultimas 3 de 404: $ultimas_404"
    echo "----------------------"
    echo "Total 500: $lineas_con_500"
    echo "----------------------"
    echo "Total peticiones: $total"
    if [ $lineas_con_500 -gt 10 ];then
        echo "ALERTA: Hay más de 10 líneas con error 500"
        exit 0
    fi
    exit 0
else
    echo "Este archivo no existe y no es legible";
    exit 1
fi