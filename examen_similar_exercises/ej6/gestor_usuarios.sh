#!/bin/bash

if [ $# -eq 0 ];then
    echo "Debes de pasar un usuario como parámetro"
    exit 1
fi

usuario_existe=$(grep "$1" "/etc/passwd");

if [ ${#usuario_existe} -gt 0 ];then
    uid=$(echo "$usuario_existe" | awk -F: '{print $3}')
    gid=$(echo "$usuario_existe" | awk -F: '{print $4}')
    home=$(echo "$usuario_existe" | awk -F: '{print $6}')

    echo "==== INFORMACIÓN DEL USUARIO ===="
    echo "El UID es: $uid"
    echo "El GID es: $gid"
    echo "El home es: $home"
    echo "================================="

else
    usuario_fecha=$(date +%Y%m%d_%H%M%S);
    echo "--------------------------------------"
    echo "*** SE HA AÑADIDO UN NUEVO USUARIO ***"
    echo "--------------------------------------"
    echo "Usuario nuevo: $1-$usuario_fecha " >> usuarios_nuevos.log
    exit 0
fi