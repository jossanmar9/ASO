#!/bin/bash

# Ejercicio 073 · 073_lista_compra.sh — Lista de la compra
# Bloque 8: Bucles · Dificultad: ★★★★☆
#
# Recorre una lista fija de productos (pan leche huevos fruta) y muestra
# cada uno numerado.
#
# Ejemplo:
#   $ ./073_lista_compra.sh
#   1. pan
#   2. leche
#   3. huevos
#   4. fruta
#
# Pista: Chuleta, apartados 4 (cont++) y 8 (for con lista).

# Solución:

n=1
for p in pan leche huevos fruta; do
    echo "$n. $p"
    ((n++))
done
