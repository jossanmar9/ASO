#!/bin/bash

# Ejercicio 121 · 121_sustituir_palabra.sh — Sustituir una palabra
# Bloque 13: sed · Dificultad: ★★★★☆
#
# Recibe un fichero, una palabra y otra nueva. Muestra el fichero con la
# primera aparición de cada línea cambiada y después con todas cambiadas.
# Pruébalo con texto.txt el EL.
#
# Ejemplo:
#   $ ./121_sustituir_palabra.sh texto.txt el EL
#   --- Solo la primera de cada línea:
#   EL sol sale por el este
#   la solución está en EL soldador
#   EL  sol y   la luna
#       texto con espacios al principio
#   --- Todas:
#   EL sol sale por EL este
#   la solución está en EL soldador
#   ...
#
# Pista: sed 's/a/b/' y sed 's/a/b/g'. Comillas DOBLES para usar variables.

# Solución:

