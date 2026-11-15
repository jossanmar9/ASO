#!/bin/bash

# Ejercicio 129 · 129_espacios.sh — Arreglar espacios
# Bloque 13: sed · Dificultad: ★★★★☆
#
# Recibe un fichero y muéstralo con los espacios repetidos cambiados por
# uno solo y sin los espacios del principio de cada línea.
#
# Ejemplo:
#   $ ./129_espacios.sh texto.txt
#   el sol sale por el este
#   la solución está en el soldador
#   el sol y la luna
#   texto con espacios al principio
#
# Pista: sed -E 's/ +/ /g' y 's/^ +//'. Dos sed unidos con |.

# Solución:

