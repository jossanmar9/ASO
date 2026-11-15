#!/bin/bash

# Ejercicio 096 · 096_copia_seguridad.sh — Copia de seguridad con fecha
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Recibe un directorio. Comprueba que existe. Crea en la carpeta actual una
# copia llamada <nombre>_AAAA-MM-DD (por ejemplo apuntes_2026-11-15) con
# cp -r. Si ya existe una copia de hoy, avisa y no hace nada. Al final
# muestra cuántos ficheros tiene la copia (solo el primer nivel).
#
# Ejemplo:
#   $ ./096_copia_seguridad.sh ~/apuntes
#   Copia creada: apuntes_2026-11-15 (12 ficheros)
#   $ ./096_copia_seguridad.sh ~/apuntes
#   Aviso: ya existe la copia apuntes_2026-11-15
#
# Pista: Chuleta, apartados 2 (date +%F), 5, 6 (${r##*/}) y 8.

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 directorio"
    exit 1
fi
origen=$1
if [[ ! -d $origen ]]; then
    echo "Error: $origen no es un directorio"
    exit 1
fi

nombre=${origen%/}
nombre=${nombre##*/}
destino="${nombre}_$(date +%F)"

if [[ -e $destino ]]; then
    echo "Aviso: ya existe la copia $destino"
    exit 1
fi

cp -r "$origen" "$destino"
total=0
for f in "$destino"/*; do
    if [[ -f $f ]]; then
        ((total++))
    fi
done
echo "Copia creada: $destino ($total ficheros)"
# ${origen%/} quita la / final por si escriben "apuntes/".
