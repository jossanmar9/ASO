#!/bin/bash

# UT1.1 - Bash - Bucles
# Exercici 22 - Listar entradas de un directorio
#
# Enunciat:
# Realiza un script que reciba como unico parametro el nombre de un
# directorio mediante su ruta completa.
# Debe mostrar un listado no recursivo de todas las entradas,
# indicando para cada una si es un fichero o un directorio.
# Al final debe indicar el numero total de entradas procesadas.
#
# Solucion:

directori="$1"
comptador=0

for element in "$directori"/*; do

    if [ -f "$element" ]; then
        echo "$element és un fitxer"

    elif [ -d "$element" ]; then
        echo "$element és un directori"
    fi

    comptador=$((comptador + 1))

done

echo "Total d'elements processats: $comptador"