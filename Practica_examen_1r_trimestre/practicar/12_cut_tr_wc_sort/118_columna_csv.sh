#!/bin/bash

# Ejercicio 118 · 118_columna_csv.sh — Una columna de un CSV
# Bloque 12: cut, tr, wc, sort · Dificultad: ★★★☆☆
#
# Recibe un fichero CSV y un número de columna. Comprueba que el fichero
# existe y que la columna es un número mayor que 0. Muestra esa columna.
#
# Ejemplo:
#   $ ./118_columna_csv.sh notas.csv 1
#   Ana
#   Luis
#   Marta
#   Pedro
#   Sara
#   Jorge
#   $ ./118_columna_csv.sh notas.csv 0
#   Error: la columna debe ser un número mayor que 0
#
# Pista: cut -d, -f.

# Solución:

