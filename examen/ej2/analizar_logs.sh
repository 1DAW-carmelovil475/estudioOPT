#!/bin/bash

if [ $# -eq 0 ];then
    echo "Error: debes proporcionar la ruta del archivo"
    exit 1
fi

if [ -r $1 ];then
    total_lineas=$(wc -l < "$1")
    total=$(grep -c "ERROR" "$1")
    ultimas_5=$(grep "ERROR" "$1" | tail -5)
    grep_fatal=$(grep -E "CRITICAL|FATAL" "$1")
    grep -E "CRITICAL|FATAL" "$1" >> errores_criticos.log
    echo "Hay un total de $total_lineas en el archivo"
    echo "En total hay $total líneas con error"
    echo "Errores críticos encontrados: $grep_fatal"
    echo "Últimas 5 líneas con ERROR:"
    echo "$ultimas_5"
else
    echo "Error: el archivo no existe o no el legible"
    exit 1
fi