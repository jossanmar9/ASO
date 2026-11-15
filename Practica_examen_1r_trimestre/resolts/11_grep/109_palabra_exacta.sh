#!/bin/bash

# Ejercicio 109 · 109_palabra_exacta.sh — Palabra exacta
# Bloque 11: grep · Dificultad: ★★★☆☆
#
# Recibe un fichero y una palabra. Muestra cuántas líneas la contienen en
# cualquier sitio y cuántas como palabra completa. Pruébalo con texto.txt y
# sol (no debe contar "solución" ni "soldador" como palabra completa).
#
# Ejemplo:
#   $ ./109_palabra_exacta.sh texto.txt sol
#   Contienen "sol": 3
#   Como palabra completa: 2
#
# Pista: man grep: busca la opción para palabras completas (word).

# Solución:

if [[ $# -ne 2 || ! -f $1 ]]; then
    echo "Uso: $0 fichero palabra"
    exit 1
fi
echo "Contienen \"$2\": $(grep -c "$2" "$1")"
echo "Como palabra completa: $(grep -cw "$2" "$1")"
