#!/bin/bash

# Ejercicio 029 · 029_resto_entre_2.sh — Resto entre 2
# Bloque 3: Matemáticas · Dificultad: ★★☆☆☆
#
# Recibe un número y muestra el resto de dividirlo entre 2 (sin usar if).
# En un comentario, explica qué significa que el resto sea 0.
#
# Ejemplo:
#   $ ./029_resto_entre_2.sh 7
#   El resto de 7 entre 2 es 1
#
# Pista: Chuleta, apartado 4: %.

# Solución:

echo "El resto de $1 entre 2 es $(( $1 % 2 ))"
# Si el resto es 0, el número es par; si es 1, es impar.
