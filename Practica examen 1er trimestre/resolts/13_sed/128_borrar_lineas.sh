#!/bin/bash

# Ejercicio 128 · 128_borrar_lineas.sh — Borrar las líneas que contienen...
# Bloque 13: sed · Dificultad: ★★★★☆
#
# Recibe un fichero y una palabra. Crea fichero.filtrado sin las líneas que
# contienen la palabra y di cuántas se han eliminado.
#
# Ejemplo:
#   $ ./128_borrar_lineas.sh sistema.log INFO
#   Líneas eliminadas: 4
#   Creado sistema.log.filtrado
#
# Pista: sed "/palabra/d" > nuevo; grep -c para contar.

# Solución:

if [[ $# -ne 2 || ! -f $1 ]]; then
    echo "Uso: $0 fichero palabra"
    exit 1
fi
sed "/$2/d" "$1" > "$1.filtrado"
echo "Líneas eliminadas: $(grep -c "$2" "$1")"
echo "Creado $1.filtrado"
