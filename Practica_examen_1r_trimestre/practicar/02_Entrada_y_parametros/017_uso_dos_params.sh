#!/bin/bash

# Ejercicio 017 · 017_uso_dos_params.sh — Exigir dos parámetros
# Bloque 2: Entrada y parámetros · Dificultad: ★☆☆☆☆
#
# Necesita exactamente 2 parámetros (origen y destino). Si no recibe 2,
# muestra un mensaje de uso y termina con error. Si los recibe, muestra lo
# que haría.
#
# Ejemplo:
#   $ ./017_uso_dos_params.sh
#   Uso: ./017_uso_dos_params.sh origen destino
#   $ ./017_uso_dos_params.sh a.txt b.txt
#   Copiaría a.txt en b.txt
#
# Pista: Chuleta, apartado 3 (el ejemplo de abajo del todo).

# Solución:

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 origen destino"
    exit 1
fi

echo "Copiaría $1 en $2"