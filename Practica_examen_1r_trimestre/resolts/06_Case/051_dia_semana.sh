#!/bin/bash

# Ejercicio 051 · 051_dia_semana.sh — Día de la semana
# Bloque 6: case · Dificultad: ★★★☆☆
#
# Recibe un número del 1 al 7 y muestra el día de la semana.
#
# Ejemplo:
#   $ ./051_dia_semana.sh 3
#   Miércoles
#   $ ./051_dia_semana.sh 9
#   Error: escribe un número del 1 al 7
#
# Pista: Chuleta, apartado 7: case.

# Solución:

case $1 in
    1) echo "Lunes" ;;
    2) echo "Martes" ;;
    3) echo "Miércoles" ;;
    4) echo "Jueves" ;;
    5) echo "Viernes" ;;
    6) echo "Sábado" ;;
    7) echo "Domingo" ;;
    *) echo "Error: escribe un número del 1 al 7" ;;
esac
