#!/bin/bash

kernel=$(uname -r)
so=$(uname -s)
arquitectura=$(uname -m)

touch sistema.txt 

echo "Kernel: $kernel" > sistema.txt
echo "SO: $so" >> sistema.txt
echo "Arquitectura: $arquitectura" >> sistema.txt
echo "Fecha: $(date)" >> sistema.txt

if [[ $so = "Linux" && $arquitectura = "x86_64" ]];then
    echo "Plataforma soportada" >> sistema.txt
else
    echo "Plataforma no soportada" >> sistema.txt
    exit 5
fi