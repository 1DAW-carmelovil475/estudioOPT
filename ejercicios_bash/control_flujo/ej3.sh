#!/bin/bash

read -p "Introduce un número: " n1
read -p "Introduce otro número: " n2

resta=$((n1-n2))
suma=$((n1+n2))
multiplicacion=$((n1*n2))
division=$(echo "scale=1; $n1/$n2" | bc)

echo "La suma es: $suma, la resta es $resta, la multiplicación es $multiplicacion y la división es $division";