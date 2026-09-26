#!/bin/bash

# UT1.1 - Bash - Bucles
# Exercici 21 - Adivinar un numero
#
# Enunciat:
# Crea un juego para adivinar un numero del 1 al 100.
# El numero a adivinar se pondra fijo al principio del script.
# Se preguntaran numeros al usuario y se indicara si el numero
# introducido es mayor o menor que el que hay que adivinar.
# El juego termina si se averigua el numero o se introduce un 0.
#
# Solucion:

secret=42
numero=-1

while [ "$numero" -ne "$secret" ] && [ "$numero" -ne 0 ]; do

    read -p "Introdueix un número entre 1 i 100 (0 per rendir-te): " numero

    if [ "$numero" -eq 0 ]; then
        echo "T'has rendit. El número era $secret."

    elif [ "$numero" -eq "$secret" ]; then
        echo "Enhorabona! Has encertat el número."

    elif [ "$numero" -lt "$secret" ]; then
        echo "El número secret és major."

    else
        echo "El número secret és menor."
    fi

done