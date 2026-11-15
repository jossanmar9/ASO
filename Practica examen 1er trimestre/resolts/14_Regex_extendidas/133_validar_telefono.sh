#!/bin/bash

# Ejercicio 133 · 133_validar_telefono.sh — Teléfono
# Bloque 14: Regex extendidas con =~ · Dificultad: ★★★★☆
#
# Recibe un teléfono español: 9 cifras que empiezan por 6, 7 o 9.
#
# Ejemplo:
#   $ ./133_validar_telefono.sh 612345678
#   612345678 es válido
#   $ ./133_validar_telefono.sh 512345678
#   512345678 NO es válido
#
# Pista: [679] y {8}.

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 dato"
    exit 1
fi
re='^[679][0-9]{8}$'
if [[ $1 =~ $re ]]; then
    echo "$1 es válido"
else
    echo "$1 NO es válido"
fi
