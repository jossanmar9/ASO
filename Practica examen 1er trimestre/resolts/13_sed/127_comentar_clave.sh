#!/bin/bash

# Ejercicio 127 · 127_comentar_clave.sh — Comentar una línea
# Bloque 13: sed · Dificultad: ★★★★☆
#
# Recibe una clave. Si existe en servidor.conf una línea que empieza por
# CLAVE=, ponle un # delante (sin modificar el original: guarda el resultado
# en servidor.conf.nuevo).
#
# Ejemplo:
#   $ ./127_comentar_clave.sh MODO
#   Línea comentada en servidor.conf.nuevo:
#   #MODO=produccion
#   $ ./127_comentar_clave.sh XYZ
#   Error: la clave XYZ no existe
#
# Pista: sed "s/^CLAVE=/#CLAVE=/" fichero > nuevo.

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 CLAVE"
    exit 1
fi
if ! grep -q "^$1=" servidor.conf; then
    echo "Error: la clave $1 no existe"
    exit 1
fi
sed "s/^$1=/#$1=/" servidor.conf > servidor.conf.nuevo
echo "Línea comentada en servidor.conf.nuevo:"
grep "^#$1=" servidor.conf.nuevo
