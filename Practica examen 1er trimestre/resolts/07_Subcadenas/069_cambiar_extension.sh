#!/bin/bash

# Ejercicio 069 · 069_cambiar_extension.sh — Cambiar la extensión
# Bloque 7: Subcadenas · Dificultad: ★★★★☆
#
# Recibe un nombre de fichero y una extensión nueva. Muestra la orden mv
# que habría que ejecutar (sin ejecutarla).
#
# Ejemplo:
#   $ ./069_cambiar_extension.sh notas.txt bak
#   mv notas.txt notas.bak
#
# Pista: Chuleta, apartado 6: ${f%.*}.

# Solución:

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 fichero extension"
    exit 1
fi
f=$1
echo "mv $f ${f%.*}.$2"
