#!/bin/bash

# Ejercicio 033 · 033_mayor_de_dos.sh — El mayor de dos
# Bloque 4: Condicionales · Dificultad: ★★☆☆☆
#
# Recibe dos números y dice cuál es mayor, o si son iguales.
#
# Ejemplo:
#   $ ./033_mayor_de_dos.sh 3 9
#   9 es mayor que 3
#   $ ./033_mayor_de_dos.sh 4 4
#   Son iguales
#
# Pista: Chuleta, apartado 7: if / elif / else.

# Solución:

if [[ $1 -gt $2 ]]; then
    echo "$1 es mayor que $2"
elif [[ $1 -lt $2 ]]; then
    echo "$2 es mayor que $1"
else
    echo "Son iguales"
fi
