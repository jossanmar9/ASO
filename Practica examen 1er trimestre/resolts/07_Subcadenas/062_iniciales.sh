#!/bin/bash

# Ejercicio 062 · 062_iniciales.sh — Iniciales
# Bloque 7: Subcadenas · Dificultad: ★★★★☆
#
# Recibe nombre y apellido y muestra las iniciales.
#
# Ejemplo:
#   $ ./062_iniciales.sh Lucia Ferrer
#   Iniciales: LF
#
# Pista: Chuleta, apartado 6: ${c:0:1}.

# Solución:

nombre=$1
apellido=$2
echo "Iniciales: ${nombre:0:1}${apellido:0:1}"
