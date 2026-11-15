#!/bin/bash

# Ejercicio 088 · 088_factorial.sh — Factorial
# Bloque 9: Funciones · Dificultad: ★★★★★
#
# Crea una función factorial que calcule el factorial de un número con un
# bucle (5! = 5 x 4 x 3 x 2 x 1). Comprueba que el parámetro es un número.
#
# Ejemplo:
#   $ ./088_factorial.sh 5
#   5! = 120
#
# Pista: Chuleta, apartados 8 y 9.

# Solución:

factorial() {
    resultado=1
    for (( i=2; i<=$1; i++ )); do
        resultado=$(( resultado * i ))
    done
    echo "$resultado"
}

if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "Uso: $0 numero"
    exit 1
fi
echo "$1! = $(factorial "$1")"
