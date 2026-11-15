#!/bin/bash

# Ejercicio 079 · 079_menu_bucle.sh — Menú que se repite
# Bloque 8: Bucles · Dificultad: ★★★★☆
#
# Muestra un menú (1: fecha, 2: usuario, 3: equipo, 4: salir) y lo repite
# hasta que el usuario elija 4.
#
# Ejemplo:
#   $ ./079_menu_bucle.sh
#   1) Fecha
#   2) Usuario
#   3) Equipo
#   4) Salir
#   Opción: 1
#   2026-11-15
#   ...
#   Opción: 4
#   Adiós
#
# Pista: Chuleta, apartados 7 (case) y 8 (while).

# Solución:

opcion=0
while [[ $opcion != 4 ]]; do
    echo
    echo "1) Fecha"
    echo "2) Usuario"
    echo "3) Equipo"
    echo "4) Salir"
    read -p "Opción: " opcion
    case $opcion in
        1) date +%F ;;
        2) echo "$USER" ;;
        3) echo "$HOSTNAME" ;;
        4) echo "Adiós" ;;
        *) echo "Opción no válida" ;;
    esac
done
