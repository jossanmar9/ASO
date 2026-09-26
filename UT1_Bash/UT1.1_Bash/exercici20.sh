#!/bin/bash

# UT1.1 - Bash - Bucles
# Exercici 20 - Comprobar si un numero es primo
#
# Enunciat:
# Crea un script que verifique si el numero pasado por parametro
# es primo o no.
#
# Solucion:

numero="$1"
primer=true

if [ "$numero" -le 1 ]; then
    primer=false
else
    for ((i=2; i<numero; i++)); do
        if [ $((numero % i)) -eq 0 ]; then
            primer=false
            break
        fi
    done
fi

if [ "$primer" = true ]; then
    echo "$numero és un número primer"
else
    echo "$numero no és un número primer"
fi