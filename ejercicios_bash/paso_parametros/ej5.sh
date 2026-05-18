#!/bin/bash

case $1 in
    fecha)
        date
        ;;
    usuario)
        whoami
        ;;
    ruta)
        pwd
        ;;
    *)
        echo "Opción no válida, solo puede ser: 'fecha', 'usuario', 'ruta'"
        ;;
esac