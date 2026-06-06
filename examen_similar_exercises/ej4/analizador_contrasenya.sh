#!/bin/bash

if [ ${#1} -gt 0 ];then
    if [ ${#1} -gt 7 ];then
        if [[ "$1" =~ [A-Z] ]];then
            if [[ "$1" =~ [0-9] ]];then
                if [[ "$1" =~ [^[:alnum:]_] ]];then
                    echo "Tu contraseña es muy fuerte";
                    exit 0;
                else
                    echo "Tu contraseña es fuerte, te recomentamos carácteres especiales";
                    exit 0;
                fi
            else
                echo "Tu conraseña es media, te recomendamos mayúsculas y carácteres especiales";
                exit 0;
            fi
        else
            echo "Tu contraseña es débil, te recomendamos números, mayúsculas y carácteres especiales";
            exit 0;
        fi
    elif [[ "$1" =~ [A-Z] ]];then
        if [[ "$1" =~ [0-9] ]];then
            if [[ "$1" =~ [^[:alnum:]_] ]];then
                echo "Tu contraseña es fuerte, te recomendamos longitud de 8 carácteres";
                exit 0;
            else
                echo "Tu contraseña es media, te recomentamos carácteres especiales y longitud de 8 carácteres";
                exit 0;
            fi
        else
            echo "Tu conraseña es debil, te recomendamos longitud de 8, mayúsculas y carácteres especiales";
            exit 0;
        fi
    elif [[ "$1" =~ [0-9] ]];then
        if [[ "$1" =~ [^[:alnum:]_] ]];then
            echo "Tu contraseña es media, te recomendamos longitud de 8 carácteres y mayúsculas";
            exit 0;
        else
            echo "Tu contraseña es débil, te recomentamos carácteres especiales, longitud de 8 carácteres y mayúsculas";
            exit 0;
        fi
    elif [[ "$1" =~ [^[:alnum:]_] ]];then
        echo "Tu contraseña es débil, te recomendamos longitud de 8 carácteres, mayúsculas y números";
        exit 0;
    else
        echo "Tu contraseña no cumple el mínimo de longitud, es muy débil";
        exit 1;
    fi
            
        
else
    echo "No has pasado la contraseña por parámetros"
    exit 1
fi