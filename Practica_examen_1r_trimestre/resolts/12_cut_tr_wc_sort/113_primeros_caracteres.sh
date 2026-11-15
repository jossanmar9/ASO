#!/bin/bash

# Ejercicio 113 · 113_primeros_caracteres.sh — Primeros caracteres con cut
# Bloque 12: cut, tr, wc, sort · Dificultad: ★★★☆☆
#
# Recibe una palabra y un número N. Muestra los N primeros caracteres
# usando cut. Comprueba que N es un número.
#
# Ejemplo:
#   $ ./113_primeros_caracteres.sh administracion 5
#   admin
#   $ ./113_primeros_caracteres.sh hola x
#   Uso: ./113_primeros_caracteres.sh palabra numero
#
# Pista: cut -c1-N. Para pasarle un texto: echo "$texto" | cut ...

# Solución:

if [[ $# -ne 2 || ! $2 =~ ^[0-9]+$ ]]; then
    echo "Uso: $0 palabra numero"
    exit 1
fi
echo "$1" | cut -c1-"$2"
