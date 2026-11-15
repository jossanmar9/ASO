#!/bin/bash

# Ejercicio 035 · 035_signo.sh — Positivo, negativo o cero
# Bloque 4: Condicionales · Dificultad: ★★☆☆☆
#
# Pide un número con read y di si es positivo, negativo o cero.
#
# Ejemplo:
#   $ ./035_signo.sh
#   Número: -4
#   -4 es negativo
#
# Pista: Chuleta, apartado 7.

# Solución:

read -p "Número: " n
if [[ $n -gt 0 ]]; then
    echo "$n es positivo"
elif [[ $n -lt 0 ]]; then
    echo "$n es negativo"
else
    echo "$n es cero"
fi
