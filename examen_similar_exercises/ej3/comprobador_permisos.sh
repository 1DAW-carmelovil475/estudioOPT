#!/bin/bash

if [ "${#1}" -gt 0 ];then
    if [ -r $1 ];then
        if [ -w $1 ];then
            if [ -x $1 ];then
                echo "Este archivo existe, es legible, escribible y ejecutable";
                exit 0;
            else
                echo "Este archivo existe, es legible y escribible";
                exit 0;
            fi
        else
            echo "Este archivo existe y es legible";
            exit 0;
        fi
        
    elif [ -w $1 ];then
        if [ -x $1 ];then
            echo "Este archivo es escribible y ejecutable";
            exit 0;
        else
            echo "Este archivo es escribible";
            exit 0;
        fi
    elif [ -x $1 ];then
        echo "Este archivo es ejecutable";
        exit 0;
    else
        echo "Esto no es un archivo";
        exit 1;
    fi

else
    echo "No has introducido ningun argumento";
    exit 1;
fi

