#!/bin/bash

# UT1.1 - Bash - Bucles
# Exercici 16 - Suma del 1 al 1000 con for, while y until
#
# Enunciat:
# Crea un shell script que sume los numeros del 1 al 1000 mediante
# una estructura for, while y until.
#
# Solucion:

suma=0

for i in {1..1000}; do
    suma=$((suma + 1))
done

echo "La suma amb for és: $suma"

suma=0

while [ "$suma" -lt 1000 ]; do
    suma=$((suma + 1))
done

echo "La suma amb while és: $suma"

suma=0

until [ "$suma" -eq 1000 ]; do
    suma=$((suma + 1))
done

echo "La suma amb until és: $suma"