#!/bin/bash

# Ejercicio 110 · 110_buscar_en_directorio.sh — Buscar en un directorio
# Bloque 11: grep · Dificultad: ★★★☆☆
#
# Recibe un directorio y una palabra. Muestra el nombre de los ficheros (de
# ese directorio y sus subdirectorios) que contienen la palabra, y cuántos
# son.
#
# Ejemplo:
#   $ ./110_buscar_en_directorio.sh __grep_dir ERROR
#   __grep_dir/logs/viejo.log
#   __grep_dir/sistema.log
#   ----
#   Ficheros: 2
#
# Pista: man grep: opciones -r (recursivo) y -l (solo nombres). Para contar: | wc -l.

# Solución:

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 directorio palabra"
    exit 1
fi
if [[ ! -d $1 ]]; then
    echo "Error: $1 no es un directorio"
    exit 1
fi
grep -rl "$2" "$1"
echo "----"
echo "Ficheros: $(grep -rl "$2" "$1" | wc -l)"
