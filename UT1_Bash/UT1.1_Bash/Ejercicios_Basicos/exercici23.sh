#!/bin/bash

# UT1.1 - Bash - Bucles
# Exercici 23 - Tipos de entrada en /dev
#
# Enunciat:
# Modifica el script anterior para que indique si cada entrada es
# un fichero, directorio, enlace simbolico, archivo especial de bloque
# o archivo especial de caracter.
# Ejecutalo sobre el directorio /dev para verificar su funcionamiento.
#
# Solucion:

directori="$1"
comptador=0

for element in "$directori"/*; do

    if [ -L "$element" ]; then
        echo "$element és un enllaç simbòlic"

    elif [ -f "$element" ]; then
        echo "$element és un fitxer"

    elif [ -d "$element" ]; then
        echo "$element és un directori"

    elif [ -b "$element" ]; then
        echo "$element és un dispositiu de bloc"

    elif [ -c "$element" ]; then
        echo "$element és un dispositiu de caràcters"

    else
        echo "$element és d'un altre tipus"
    fi

    comptador=$((comptador + 1))

done

echo "Total d'elements processats: $comptador"