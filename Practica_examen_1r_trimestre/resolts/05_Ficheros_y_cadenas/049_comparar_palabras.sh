#!/bin/bash

# Ejercicio 049 · 049_comparar_palabras.sh — Comparar palabras
# Bloque 5: Ficheros y cadenas · Dificultad: ★★★☆☆
#
# Recibe dos palabras. Di si son iguales; si no, cuál va antes en orden
# alfabético.
#
# Ejemplo:
#   $ ./049_comparar_palabras.sh pera manzana
#   manzana va antes que pera
#   $ ./049_comparar_palabras.sh sol sol
#   Son iguales
#
# Pista: Chuleta, apartado 5: cadenas (==, <).

# Solución:

if [[ $1 == $2 ]]; then
    echo "Son iguales"
elif [[ $1 < $2 ]]; then
    echo "$1 va antes que $2"
else
    echo "$2 va antes que $1"
fi
