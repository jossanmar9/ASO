#!/bin/bash

# UT1.1 - Bash - Bucles
# Exercici 15 - Tabla de multiplicar de n
#
# Enunciat:
# Realiza un script que, dado un numero n pasado por parametro,
# muestre su tabla de multiplicar con el formato:
# i x n = resultado
#
# Solucion:

numero="$1"

for i in {1..10}; do
    resultat=$((i * numero))
    echo "$i x $numero = $resultat"
done