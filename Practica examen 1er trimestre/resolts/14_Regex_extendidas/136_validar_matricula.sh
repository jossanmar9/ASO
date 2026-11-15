#!/bin/bash

# Ejercicio 136 · 136_validar_matricula.sh — Matrícula de coche
# Bloque 14: Regex extendidas con =~ · Dificultad: ★★★★☆
#
# Recibe una matrícula actual: 4 cifras y 3 consonantes mayúsculas (sin
# vocales ni Ñ ni Q).
#
# Ejemplo:
#   $ ./136_validar_matricula.sh 1234BCD
#   1234BCD es válido
#   $ ./136_validar_matricula.sh 1234ABC
#   1234ABC NO es válido
#
# Pista: Una clase [ ] con las consonantes permitidas.

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 dato"
    exit 1
fi
re='^[0-9]{4}[BCDFGHJKLMNPRSTVWXYZ]{3}$'
if [[ $1 =~ $re ]]; then
    echo "$1 es válido"
else
    echo "$1 NO es válido"
fi
