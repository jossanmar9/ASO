#!/bin/bash

# UT1.1 - Bash - Estructuras condicionales
# Exercici 11 - Copiar un fichero con validaciones
#
# Enunciat:
# Realiza un shell script que copie el fichero indicado como primer
# parametro posicional, de manera que la copia tenga el nombre indicado
# en el segundo parametro posicional.
#
# Hay que controlar:
# a) Que se indiquen dos parametros.
# b) Que exista y sea archivo ordinario el primer parametro.
# c) Que no exista un identificador con el mismo nombre que el indicado
#    en el segundo parametro.
#
# Si se produce alguna de estas situaciones se visualizara un mensaje
# de error indicativo.
#
# Solucion:
if [ "$#" -ne 2 ]; then
    echo "Error: has d'indicar dos paràmetres."
    echo "Ús: $0 fitxer_origen fitxer_desti"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: $1 no existeix o no és un fitxer."
    exit 1
fi


if [ -e "$2" ]; then
    echo "Error: $2 ja existeix."
    exit 1
fi


cp "$1" "$2"

echo "Fitxer copiat correctament."