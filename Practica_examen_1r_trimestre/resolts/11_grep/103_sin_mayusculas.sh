#!/bin/bash

# Ejercicio 103 · 103_sin_mayusculas.sh — Buscar sin distinguir mayúsculas
# Bloque 11: grep · Dificultad: ★★★☆☆
#
# Recibe un fichero y una palabra. Muestra cuántas líneas la contienen
# distinguiendo mayúsculas y cuántas sin distinguirlas. Pruébalo con
# sistema.log e info.
#
# Ejemplo:
#   $ ./103_sin_mayusculas.sh sistema.log info
#   Distinguiendo mayúsculas: 1
#   Sin distinguir: 5
#
# Pista: grep -c y grep -i.

# Solución:

if [[ $# -ne 2 || ! -f $1 ]]; then
    echo "Uso: $0 fichero palabra"
    exit 1
fi
echo "Distinguiendo mayúsculas: $(grep -c "$2" "$1")"
echo "Sin distinguir: $(grep -ci "$2" "$1")"
