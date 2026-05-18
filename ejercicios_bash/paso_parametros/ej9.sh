#!/bin/bash

read -p "Introduce el número, el operador(+, -, x, /) y el segundo número: " n1 op n2

if [ $op == '+' ];then
    resultado=$((n1+n2))
elif [ $op == '-' ];then
    resultado=$((n1-n2))
elif [ $op == 'x' ];then
    resultado=$((n1*n2))
elif [ $op == '/' ];then
    resultado=$((n1/n2))
else
    echo "Operador no válido"
    exit 1
fi

echo "Resultado: $resultado"