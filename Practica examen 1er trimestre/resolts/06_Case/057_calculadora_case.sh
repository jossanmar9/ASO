#!/bin/bash

# Ejercicio 057 · 057_calculadora_case.sh — Calculadora con case
# Bloque 6: case · Dificultad: ★★★☆☆
#
# Recibe: número operador número. Operadores: + - x / (usa x para
# multiplicar). Controla la división por cero y el operador desconocido.
#
# Ejemplo:
#   $ ./057_calculadora_case.sh 6 x 7
#   6 x 7 = 42
#   $ ./057_calculadora_case.sh 6 / 0
#   Error: no se puede dividir entre 0
#
# Pista: Chuleta, apartados 4 y 7.

# Solución:

if [[ $# -ne 3 ]]; then
    echo "Uso: $0 num1 operador num2"
    exit 1
fi
a=$1
op=$2
b=$3
case $op in
    +) echo "$a + $b = $(( a + b ))" ;;
    -) echo "$a - $b = $(( a - b ))" ;;
    x) echo "$a x $b = $(( a * b ))" ;;
    /) if [[ $b -eq 0 ]]; then
           echo "Error: no se puede dividir entre 0"
           exit 1
       fi
       echo "$a / $b = $(( a / b ))" ;;
    *) echo "Error: operador $op desconocido" ;;
esac
