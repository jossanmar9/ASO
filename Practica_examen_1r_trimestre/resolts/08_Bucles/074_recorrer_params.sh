#!/bin/bash

# Ejercicio 074 · 074_recorrer_params.sh — Recorrer los parámetros
# Bloque 8: Bucles · Dificultad: ★★★★☆
#
# Muestra cada parámetro recibido en una línea, numerado. Si no hay
# ninguno, avisa.
#
# Ejemplo:
#   $ ./074_recorrer_params.sh rojo verde azul
#   Parámetro 1: rojo
#   Parámetro 2: verde
#   Parámetro 3: azul
#
# Pista: Chuleta, apartados 3 ($@) y 8.

# Solución:

if [[ $# -eq 0 ]]; then
    echo "No has pasado ningún parámetro"
    exit 1
fi
n=1
for p in "$@"; do
    echo "Parámetro $n: $p"
    ((n++))
done
