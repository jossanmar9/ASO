#!/bin/bash

# Ejercicio 066 · 066_reemplazar_letra.sh — Reemplazar letras
# Bloque 7: Subcadenas · Dificultad: ★★★★☆
#
# Recibe una frase (entre comillas) y muestra: la frase con la primera "a"
# cambiada por "4", y con todas las "a" cambiadas por "4".
#
# Ejemplo:
#   $ ./066_reemplazar_letra.sh "la casa amarilla"
#   Primera: l4 casa amarilla
#   Todas: l4 c4s4 4m4rill4
#
# Pista: Chuleta, apartado 6: ${s/old/new} y ${s//old/new}.

# Solución:

s=$1
echo "Primera: ${s/a/4}"
echo "Todas: ${s//a/4}"
