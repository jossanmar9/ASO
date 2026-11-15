#!/bin/bash

# Ejercicio 085 · 085_funcion_mayor.sh — Función mayor
# Bloque 9: Funciones · Dificultad: ★★★★★
#
# Crea una función mayor que reciba dos números y devuelva (con echo) el
# mayor. Úsala para mostrar el mayor de tres números: mayor de los dos
# primeros, y el resultado con el tercero.
#
# Ejemplo:
#   $ ./085_funcion_mayor.sh 4 9 2
#   El mayor es 9
#
# Pista: Chuleta, apartado 9.

# Solución:

mayor() {
    if [[ $1 -gt $2 ]]; then
        echo "$1"
    else
        echo "$2"
    fi
}

m=$(mayor "$1" "$2")
m=$(mayor "$m" "$3")
echo "El mayor es $m"
