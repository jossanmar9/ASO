#!/bin/bash

# Ejercicio 048 · 048_hacer_ejecutable.sh — Hacer ejecutable
# Bloque 5: Ficheros y cadenas · Dificultad: ★★★☆☆
#
# Recibe un fichero. Si no existe, error. Si ya es ejecutable, avisa. Si no,
# dale permiso de ejecución con chmod +x.
#
# Ejemplo:
#   $ ./048_hacer_ejecutable.sh prueba.sh
#   Permiso de ejecución añadido a prueba.sh
#   $ ./048_hacer_ejecutable.sh prueba.sh
#   prueba.sh ya era ejecutable
#
# Pista: Chuleta, apartados 1 (chmod) y 5 (-f, -x).

# Solución:

if [[ ! -f $1 ]]; then
    echo "Error: $1 no existe"
    exit 1
fi
if [[ -x $1 ]]; then
    echo "$1 ya era ejecutable"
else
    chmod +x "$1"
    echo "Permiso de ejecución añadido a $1"
fi
