#!/bin/bash

# Ejercicio 059 · 059_alta_baja.sh — Alta o baja
# Bloque 6: case · Dificultad: ★★★☆☆
#
# Recibe una acción y un nombre. alta -> "Daría de alta a X".
# baja o borrar -> "Daría de baja a X". Otra -> "Acción no reconocida".
# Si falta el nombre, uso.
#
# Ejemplo:
#   $ ./059_alta_baja.sh borrar ana
#   Daría de baja a ana
#
# Pista: Chuleta, apartado 7 (es casi el ejemplo).

# Solución:

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 alta|baja nombre"
    exit 1
fi
case $1 in
    alta)        echo "Daría de alta a $2" ;;
    baja|borrar) echo "Daría de baja a $2" ;;
    *)           echo "Acción no reconocida" ;;
esac
