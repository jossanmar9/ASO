#!/bin/bash

# Ejercicio 034 · 034_nota.sh — Calificación
# Bloque 4: Condicionales · Dificultad: ★★☆☆☆
#
# Recibe una nota de 0 a 10 y muestra: Suspenso (<5), Aprobado (5-6),
# Notable (7-8) o Sobresaliente (9-10). Si está fuera de rango, error.
#
# Ejemplo:
#   $ ./034_nota.sh 7
#   Notable
#   $ ./034_nota.sh 12
#   Error: la nota debe estar entre 0 y 10
#
# Pista: Chuleta, apartados 5 (lógicas) y 7.

# Solución:

nota=$1
if [[ $nota -lt 0 || $nota -gt 10 ]]; then
    echo "Error: la nota debe estar entre 0 y 10"
    exit 1
elif [[ $nota -lt 5 ]]; then
    echo "Suspenso"
elif [[ $nota -lt 7 ]]; then
    echo "Aprobado"
elif [[ $nota -lt 9 ]]; then
    echo "Notable"
else
    echo "Sobresaliente"
fi
