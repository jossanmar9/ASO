#!/bin/bash

# Ejercicio 021 · 021_suma.sh — Sumar dos números
# Bloque 3: Matemáticas · Dificultad: ★★☆☆☆
#
# Recibe dos números como parámetros y muestra su suma.
#
# Ejemplo:
#   $ ./021_suma.sh 3 5
#   3 + 5 = 8
#
# Pista: Chuleta, apartado 4.

# Solución:

suma=$(( $1 + $2 ))
echo "$1 + $2 = $suma"
