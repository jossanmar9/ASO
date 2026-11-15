#!/bin/bash

# Ejercicio 068 · 068_ocultar_tarjeta.sh — Ocultar una tarjeta
# Bloque 7: Subcadenas · Dificultad: ★★★★☆
#
# Recibe un número de tarjeta. Comprueba que solo tiene cifras y que tiene
# 16. Muestra solo las 4 últimas, con asteriscos delante.
#
# Ejemplo:
#   $ ./068_ocultar_tarjeta.sh 1234567812345678
#   ************5678
#   $ ./068_ocultar_tarjeta.sh 1234
#   Error: la tarjeta debe tener 16 cifras
#
# Pista: Chuleta, apartados 5 (regex) y 6 (${#c}, ${c: -4}).

# Solución:

t=$1
if [[ ! $t =~ ^[0-9]+$ ]]; then
    echo "Error: solo se admiten cifras"
    exit 1
fi
if [[ ${#t} -ne 16 ]]; then
    echo "Error: la tarjeta debe tener 16 cifras"
    exit 1
fi
echo "************${t: -4}"
