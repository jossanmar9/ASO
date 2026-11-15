#!/bin/bash

# Ejercicio 143 · 143_top.sh — Los N procesos que más CPU consumen
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★☆☆☆
#
# Crea una función top_cpu que reciba N como parámetro y muestre los N procesos
# que más CPU consumen. Si no recibe N, muestra 5.
# El script le pasa a la función su propio $1.
# - Si N no es un número: "Error: N debe ser un número".
#
# Ejemplo:
#   $ ./203_top.sh        (muestra 5)
#   $ ./203_top.sh 3      (muestra 3)
#   $ ./203_top.sh hola
#   Error: N debe ser un número
#
# Pista: Opción 3 de la sesión 7. ps -eo ... --sort=-%cpu | head -n ... (¡la cabecera ocupa una línea!).

# Solución:

top_cpu() {
    n=$1
    if [[ -z $n ]]; then
        n=5
    fi
    if [[ ! $n =~ ^[0-9]+$ ]]; then
        echo "Error: N debe ser un número"
        return 1
    fi
    ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n $(( n + 1 ))
}

top_cpu "$1"
