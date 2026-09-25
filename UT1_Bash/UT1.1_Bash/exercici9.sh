#!/bin/bash

# UT1.1 - Bash - Estructuras condicionales
# Exercici 9 - Menu de operaciones matematicas
#
# Enunciat:
# Realiza un script que contenga un menu con las cuatro operaciones
# matematicas basicas: sumar, restar, multiplicar y dividir.
# Solicita dos numeros al usuario y muestra el resultado en funcion
# de la opcion seleccionada.
#
# Solucion:

echo "Menú d'operacions"
echo "1) Suma"
echo "2) Resta"
echo "3) Multiplica"
echo "4) Divideix"
read -p "Tria una opció (1-4): " opcio

read -p "Introdueix el primer numero: " numero1
read -p "Introdueix el segon numero: " numero2

case "$opcio" in
    1) resultat=$(($numero1 + $numero2));;
    2) resultat=$(($numero1 - $numero2));;
    3) resultat=$(($numero1 * $numero2));;
    4)  if [ "$numero2" -eq 0 ]; then
            echo "Error: No es pot dividir entre 0"
            exit 1
        fi
        resultat=$(($numero1 / $numero2));;
    *) echo "Operació no contemplada"
        exit 1;;
esac

echo "El resultat es: $resultat"