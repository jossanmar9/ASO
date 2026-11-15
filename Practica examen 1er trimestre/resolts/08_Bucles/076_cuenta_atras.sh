#!/bin/bash

# Ejercicio 076 · 076_cuenta_atras.sh — Cuenta atrás
# Bloque 8: Bucles · Dificultad: ★★★★☆
#
# Recibe un número y hace una cuenta atrás con until hasta 0. Al final
# muestra "¡Despegue!".
#
# Ejemplo:
#   $ ./076_cuenta_atras.sh 3
#   3
#   2
#   1
#   0
#   ¡Despegue!
#
# Pista: Chuleta, apartado 8: until.

# Solución:

n=$1
until [[ $n -lt 0 ]]; do
    echo "$n"
    ((n--))
done
echo "¡Despegue!"
