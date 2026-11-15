#!/bin/bash

# Ejercicio 083 · 083_funcion_es_par.sh — Función sí/no
# Bloque 9: Funciones · Dificultad: ★★★★★
#
# Crea una función es_par que devuelva 0 si el número es par y 1 si no.
# Úsala en un if con el parámetro del script.
#
# Ejemplo:
#   $ ./083_funcion_es_par.sh 6
#   6 es par
#
# Pista: Chuleta, apartado 9: return 0 / return 1.

# Solución:

es_par() {
    if [[ $(( $1 % 2 )) -eq 0 ]]; then
        return 0
    else
        return 1
    fi
}

if es_par "$1"; then
    echo "$1 es par"
else
    echo "$1 es impar"
fi
