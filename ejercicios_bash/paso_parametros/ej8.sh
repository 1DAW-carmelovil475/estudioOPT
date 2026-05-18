#!/bin/bash

if [ $# -lt 3 ]; then
    echo "Hay que escribir al menos 3 palabras"
else
    echo "$@" | tr '[:lower:]' '[:upper:]'
fi