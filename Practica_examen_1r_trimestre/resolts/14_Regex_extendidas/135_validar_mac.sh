#!/bin/bash

# Ejercicio 135 · 135_validar_mac.sh — Dirección MAC
# Bloque 14: Regex extendidas con =~ · Dificultad: ★★★★☆
#
# Recibe una MAC: 6 pares hexadecimales (0-9, a-f, A-F) separados por : o -.
#
# Ejemplo:
#   $ ./135_validar_mac.sh 08:00:27:3a:1f:01
#   08:00:27:3a:1f:01 es válido
#   $ ./135_validar_mac.sh 08:00:27:3a:1f:0g
#   08:00:27:3a:1f:0g NO es válido
#
# Pista: [0-9a-fA-F], {2}, {5}.

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 dato"
    exit 1
fi
re='^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$'
if [[ $1 =~ $re ]]; then
    echo "$1 es válido"
else
    echo "$1 NO es válido"
fi
