#!/bin/bash

# Ejercicio 040 · 040_rango.sh — Entre 1 y 100
# Bloque 4: Condicionales · Dificultad: ★★☆☆☆
#
# Recibe un número y dice si está entre 1 y 100 (ambos incluidos).
# En un comentario explica por qué [[ 10 > 9 ]] no sirve para comparar números.
#
# Ejemplo:
#   $ ./040_rango.sh 50
#   50 está entre 1 y 100
#   $ ./040_rango.sh 150
#   150 está fuera del rango
#
# Pista: Chuleta, apartado 5 (lógicas y el aviso en negrita).

# Solución:

if [[ $1 -ge 1 && $1 -le 100 ]]; then
    echo "$1 está entre 1 y 100"
else
    echo "$1 está fuera del rango"
fi
# [[ 10 > 9 ]] compara como TEXTO (orden alfabético): "1" va antes que "9",
# así que da falso. Para números hay que usar -gt, -lt, -ge, -le...
