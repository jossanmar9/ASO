#!/bin/bash

# Ejercicio 138 · 138_validar_hora.sh — Hora HH:MM
# Bloque 14: Regex extendidas con =~ · Dificultad: ★★★★☆
#
# Recibe una hora en formato 24 h (00:00 a 23:59).
#
# Ejemplo:
#   $ ./138_validar_hora.sh 23:59
#   23:59 es válido
#   $ ./138_validar_hora.sh 24:10
#   24:10 NO es válido
#
# Pista: ( | ): de 00 a 19 o de 20 a 23.

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 dato"
    exit 1
fi
re='^([01][0-9]|2[0-3]):[0-5][0-9]$'
if [[ $1 =~ $re ]]; then
    echo "$1 es válido"
else
    echo "$1 NO es válido"
fi
