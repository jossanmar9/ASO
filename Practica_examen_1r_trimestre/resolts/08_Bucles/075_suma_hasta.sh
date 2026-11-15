#!/bin/bash

# Ejercicio 075 · 075_suma_hasta.sh — Sumar del 1 al N
# Bloque 8: Bucles · Dificultad: ★★★★☆
#
# Recibe N y suma todos los números del 1 al N con un while.
#
# Ejemplo:
#   $ ./075_suma_hasta.sh 100
#   La suma del 1 al 100 es 5050
#
# Pista: Chuleta, apartado 8: while.

# Solución:

n=$1
i=1
suma=0
while [[ $i -le $n ]]; do
    suma=$(( suma + i ))
    ((i++))
done
echo "La suma del 1 al $n es $suma"
