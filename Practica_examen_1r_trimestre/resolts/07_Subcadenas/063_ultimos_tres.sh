#!/bin/bash

# Ejercicio 063 · 063_ultimos_tres.sh — Los tres últimos
# Bloque 7: Subcadenas · Dificultad: ★★★★☆
#
# Recibe una palabra y muestra los 3 primeros y los 3 últimos caracteres.
#
# Ejemplo:
#   $ ./063_ultimos_tres.sh administracion
#   Primeros: adm
#   Últimos: ion
#
# Pista: Chuleta, apartado 6 y 10 (¡espacio antes del -!).

# Solución:

c=$1
echo "Primeros: ${c:0:3}"
echo "Últimos: ${c: -3}"
