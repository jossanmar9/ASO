#!/bin/bash

# Ejercicio 115 · 115_estadisticas_fichero.sh — Líneas, palabras y caracteres
# Bloque 12: cut, tr, wc, sort · Dificultad: ★★★☆☆
#
# Recibe un fichero y muestra cuántas líneas, palabras y caracteres tiene,
# cada dato en una línea.
#
# Ejemplo:
#   $ ./115_estadisticas_fichero.sh sistema.log
#   Líneas: 10
#   Palabras: 74
#   Caracteres: 531
#
# Pista: wc -l, wc -w, wc -c. Con < fichero no muestra el nombre.

# Solución:

if [[ ! -f $1 ]]; then
    echo "Uso: $0 fichero"
    exit 1
fi
echo "Líneas: $(wc -l < "$1")"
echo "Palabras: $(wc -w < "$1")"
echo "Caracteres: $(wc -c < "$1")"
