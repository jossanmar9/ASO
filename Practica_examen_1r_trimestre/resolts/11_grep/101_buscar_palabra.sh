#!/bin/bash

# Ejercicio 101 · 101_buscar_palabra.sh — Buscar una palabra
# Bloque 11: grep · Dificultad: ★★★☆☆
#
# Recibe un fichero y una palabra. Comprueba que hay 2 parámetros y que el
# fichero existe. Muestra las líneas del fichero que contienen la palabra.
#
# Ejemplo:
#   $ ./101_buscar_palabra.sh sistema.log Disco
#   2026-11-10 11:45:51 ERROR Disco lleno en /var
#   $ ./101_buscar_palabra.sh sistema.log
#   Uso: ./101_buscar_palabra.sh fichero palabra
#
# Pista: Mini-chuleta, grep. man grep.

# Solución:

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 fichero palabra"
    exit 1
fi
if [[ ! -f $1 ]]; then
    echo "Error: $1 no existe"
    exit 1
fi
grep "$2" "$1"
