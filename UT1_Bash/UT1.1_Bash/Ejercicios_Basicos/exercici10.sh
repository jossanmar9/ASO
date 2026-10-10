#!/bin/bash

# UT1.1 - Bash - Estructuras condicionales
# Exercici 10 - Par o impar
#
# Enunciat:
# Crea un script que solicite un numero y diga si es par o impar.
#
# Solucion:
read -p "Introdueix un numero: " numero

if [ $((numero % 2)) -eq 0 ]; then
    echo "El numero $numero es par"
else
    echo "El numero $numero es impar"
fi