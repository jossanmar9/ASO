#!/bin/bash

# UT1.1 - Bash - Bucles
# Exercici 24 - Estadisticas de ficheros y subdirectorios
#
# Enunciat:
# Escribe un script que, dado el nombre de un directorio como parametro,
# muestre cuantos ficheros y cuantos subdirectorios contiene.
# Debe comprobar que el parametro existe y que efectivamente
# corresponde a un directorio.
#
# Solucion:

directori="$1"

if [ ! -d "$directori" ]; then
    echo "Error: $directori no existeix o no és un directori"
    exit 1
fi

fitxers=0
subdirectoris=0

for element in "$directori"/*; do

    if [ -f "$element" ]; then
        fitxers=$((fitxers + 1))

    elif [ -d "$element" ]; then
        subdirectoris=$((subdirectoris + 1))
    fi

done

echo "Nombre de fitxers: $fitxers"
echo "Nombre de subdirectoris: $subdirectoris"