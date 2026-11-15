#!/bin/bash

# Ejercicio 044 · 044_fichero_vacio.sh — ¿Fichero vacío?
# Bloque 5: Ficheros y cadenas · Dificultad: ★★★☆☆
#
# Recibe un fichero. Si no existe o no es un fichero regular, error.
# Si existe, di si está vacío o tiene contenido.
#
# Ejemplo:
#   $ ./044_fichero_vacio.sh /etc/passwd
#   /etc/passwd tiene contenido
#
# Pista: Chuleta, apartado 5: -f y -s.

# Solución:

if [[ ! -f $1 ]]; then
    echo "Error: $1 no es un fichero"
    exit 1
fi
if [[ -s $1 ]]; then
    echo "$1 tiene contenido"
else
    echo "$1 está vacío"
fi
