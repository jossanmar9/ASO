#!/bin/bash

# Ejercicio 091 · 091_inventario_directorio.sh — Inventario de un directorio
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Recibe un directorio (por defecto, $HOME). Si no existe, error.
# Recorre su contenido y cuenta cuántos ficheros regulares, directorios y
# enlaces simbólicos hay. Muestra cada entrada con su tipo y, al final,
# un resumen.
#
# Ejemplo:
#   $ ./091_inventario_directorio.sh /etc/ssh
#   [D] ssh_config.d
#   [F] ssh_config
#   ...
#   ----
#   Ficheros: 5
#   Directorios: 2
#   Enlaces: 0
#
# Pista: Chuleta, apartados 3, 5, 6 (${f##*/}), 7 y 8.

# Solución:

if [[ $# -eq 0 ]]; then
    dir=$HOME
else
    dir=$1
fi
if [[ ! -d $dir ]]; then
    echo "Error: $dir no es un directorio"
    exit 1
fi

ficheros=0
directorios=0
enlaces=0
for e in "$dir"/*; do
    nombre=${e##*/}
    if [[ -h $e ]]; then
        echo "[L] $nombre"
        ((enlaces++))
    elif [[ -d $e ]]; then
        echo "[D] $nombre"
        ((directorios++))
    elif [[ -f $e ]]; then
        echo "[F] $nombre"
        ((ficheros++))
    fi
done
echo "----"
echo "Ficheros: $ficheros"
echo "Directorios: $directorios"
echo "Enlaces: $enlaces"
