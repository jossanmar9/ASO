#!/bin/bash

# Ejercicio 032 · 032_par_impar.sh — Par o impar
# Bloque 4: Condicionales · Dificultad: ★★☆☆☆
#
# Recibe un número y dice si es par o impar.
#
# Ejemplo:
#   $ ./032_par_impar.sh 8
#   8 es par
#   $ ./032_par_impar.sh 7
#   7 es impar
#
# Pista: Chuleta, apartados 4 (%) y 7.

# Solución:

if [[ $(( $1 % 2 )) -eq 0 ]]; then
    echo "$1 es par"
else
    echo "$1 es impar"
fi
