#!/bin/bash

# Ejercicio 132 · 132_validar_dni.sh — DNI
# Bloque 14: Regex extendidas con =~ · Dificultad: ★★★★☆
#
# Recibe un DNI y comprueba que tiene 8 cifras y una letra mayúscula.
#
# Ejemplo:
#   $ ./132_validar_dni.sh 12345678Z
#   12345678Z es válido
#   $ ./132_validar_dni.sh 1234567Z
#   1234567Z NO es válido
#
# Pista: {n} y [A-Z].

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 dato"
    exit 1
fi
re='^[0-9]{8}[A-Z]$'
if [[ $1 =~ $re ]]; then
    echo "$1 es válido"
else
    echo "$1 NO es válido"
fi
