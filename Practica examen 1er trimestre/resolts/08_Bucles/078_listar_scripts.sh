#!/bin/bash

# Ejercicio 078 · 078_listar_scripts.sh — Listar scripts
# Bloque 8: Bucles · Dificultad: ★★★★☆
#
# Recibe un directorio (por defecto, el actual). Recorre sus ficheros .sh y
# di para cada uno si es ejecutable o no. Al final, cuántos hay.
#
# Ejemplo:
#   $ ./078_listar_scripts.sh .
#   hola.sh: ejecutable
#   suma.sh: NO ejecutable
#   Total: 2 scripts
#
# Pista: Chuleta, apartados 5 (-x, -d) y 8 (for f in dir/*.sh).

# Solución:

if [[ $# -eq 0 ]]; then
    dir=.
else
    dir=$1
fi
if [[ ! -d $dir ]]; then
    echo "Error: $dir no es un directorio"
    exit 1
fi
total=0
for f in "$dir"/*.sh; do
    if [[ -f $f ]]; then
        if [[ -x $f ]]; then
            echo "${f##*/}: ejecutable"
        else
            echo "${f##*/}: NO ejecutable"
        fi
        ((total++))
    fi
done
echo "Total: $total scripts"
# El if -f evita contar "*.sh" literal cuando no hay ningún script.
