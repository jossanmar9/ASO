#!/bin/bash

# Ejercicio 1. puerto.sh — ¿Es un número de puerto?
#
# Recibe un número de puerto como parámetro y dice si es válido.
# - Si no recibe ningún parámetro, muestra un mensaje de uso y termina.
# - Comprueba con una expresión regular que el parámetro solo tiene dígitos.
# - Si son dígitos, comprueba que el número está entre 1 y 65535.
#
# Ejemplo:
# $ ./puerto.sh 22      → 22 es un puerto válido
# $ ./puerto.sh 80a     → 80a no es un número
# $ ./puerto.sh 70000   → 70000 está fuera de rango (1-65535)

# Solución:

if [ $# -eq 0 ]; then
    echo "Uso: $0 <puerto>"
    exit 1
fi

re='^[0-9][0-9]*$'

if [[ $1 =~ $re ]]; then
    if [ "$1" -lt 1 ]; then
        echo "$1 está fuera de rango (1-65535)"
    elif [ "$1" -gt 65535 ]; then
        echo "$1 está fuera de rango (1-65535)"
    else
        echo "$1 es un puerto válido"
    fi
else
    echo "$1 no es un número"
fi