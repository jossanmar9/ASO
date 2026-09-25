#!/bin/bash

# UT1.1 - Bash - Estructuras condicionales
# Exercici 8 - Mayor de dos numeros
#
# Enunciat:
# Crea un script donde se pida al usuario dos numeros y diga cual es mayor.
#
# Solucion:

echo "Escriu un numero: "
read numero1
echo "Escriu un alre numero: "
read numero2

if [ "$numero1" -gt "$numero2" ]; then
    echo "El numero $numero1 es el major"
elif
    echo "El numero $numero2 es el major"
else
    echo "Els dos numeros son iguals"
fi