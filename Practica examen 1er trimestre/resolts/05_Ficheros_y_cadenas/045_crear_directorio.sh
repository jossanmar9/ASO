#!/bin/bash

# Ejercicio 045 · 045_crear_directorio.sh — Crear directorio si no existe
# Bloque 5: Ficheros y cadenas · Dificultad: ★★★☆☆
#
# Recibe el nombre de un directorio. Si no recibe nada, uso. Si ya existe,
# avisa. Si no, lo crea con mkdir.
#
# Ejemplo:
#   $ ./045_crear_directorio.sh pruebas
#   Directorio pruebas creado
#   $ ./045_crear_directorio.sh pruebas
#   Aviso: pruebas ya existe
#
# Pista: Chuleta, apartados 3 y 5 (-d).

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 directorio"
    exit 1
fi
if [[ -d $1 ]]; then
    echo "Aviso: $1 ya existe"
else
    mkdir "$1"
    echo "Directorio $1 creado"
fi
