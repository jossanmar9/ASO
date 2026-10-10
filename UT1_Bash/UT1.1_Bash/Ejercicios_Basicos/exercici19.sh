#!/bin/bash

# UT1.1 - Bash - Bucles
# Exercici 19 - Patron con for (II)
#
# Enunciat:
# Realiza un script utilizando el bucle for que muestre el patron
# indicado en el enunciado de la practica.
#
# Solucion:

for i in {1..5}; do
    for ((n=1; n<=i; n++)); do
        echo -n "$i"
    done
    echo
done