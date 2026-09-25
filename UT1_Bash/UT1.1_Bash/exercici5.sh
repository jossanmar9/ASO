#!/bin/bash

# UT1.1 - Bash
# Exercici 5 - Media aritmetica de dos numeros
#
# Enunciat:
# Crea un script donde se pida al usuario dos numeros y muestre
# la media aritmetica.
#
# Solucion:

echo "Escriu un numero: "
read numero1
echo "Escriu un alre numero: "
read numero2
mitja=$(($numero1 + $numero2) / 2)
echo "La mitja aritmètica de $numero1 i $numero2 es $mitja"