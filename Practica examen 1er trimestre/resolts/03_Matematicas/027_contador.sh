#!/bin/bash

# Ejercicio 027 · 027_contador.sh — Incrementar un contador
# Bloque 3: Matemáticas · Dificultad: ★★☆☆☆
#
# Empieza con un contador a 0, increméntalo 3 veces con ((cont++)) y
# muestra su valor después de cada incremento.
#
# Ejemplo:
#   $ ./027_contador.sh
#   1
#   2
#   3
#
# Pista: Chuleta, apartado 4: ((cont++)).

# Solución:

cont=0
((cont++))
echo $cont
((cont++))
echo $cont
((cont++))
echo $cont
