#!/bin/bash

read -p "Introduce un número: "  n1

echo "Tabla de multiplicar de $n1"

for i in {1..10}; do
    echo "$n1 x $i: $((n1*i))"
done