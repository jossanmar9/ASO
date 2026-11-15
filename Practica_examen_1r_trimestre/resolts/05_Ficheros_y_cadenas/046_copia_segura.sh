#!/bin/bash

# Ejercicio 046 · 046_copia_segura.sh — Copia segura
# Bloque 5: Ficheros y cadenas · Dificultad: ★★★☆☆
#
# Recibe origen y destino. Comprueba que hay 2 parámetros, que el origen
# es un fichero regular y que el destino NO existe (para no machacar nada).
# Si todo está bien, copia con cp.
#
# Ejemplo:
#   $ ./046_copia_segura.sh notas.txt copia.txt
#   Copiado notas.txt en copia.txt
#   $ ./046_copia_segura.sh notas.txt copia.txt
#   Error: copia.txt ya existe
#
# Pista: Chuleta, apartados 3 y 5.

# Solución:

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 origen destino"
    exit 1
fi
if [[ ! -f $1 ]]; then
    echo "Error: $1 no es un fichero"
    exit 1
fi
if [[ -e $2 ]]; then
    echo "Error: $2 ya existe"
    exit 1
fi
cp "$1" "$2"
echo "Copiado $1 en $2"
