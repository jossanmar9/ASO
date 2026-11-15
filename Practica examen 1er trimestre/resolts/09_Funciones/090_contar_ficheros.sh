#!/bin/bash

# Ejercicio 090 · 090_contar_ficheros.sh — Contar ficheros de un directorio
# Bloque 9: Funciones · Dificultad: ★★★★★
#
# Crea una función contar que reciba un directorio y devuelva (con echo)
# cuántos ficheros regulares tiene. El script la usa con el directorio que
# recibe (por defecto, $HOME).
#
# Ejemplo:
#   $ ./090_contar_ficheros.sh /etc
#   /etc tiene 87 ficheros
#
# Pista: Chuleta, apartados 5, 8 y 9.

# Solución:

contar() {
    total=0
    for f in "$1"/*; do
        if [[ -f $f ]]; then
            ((total++))
        fi
    done
    echo "$total"
}

if [[ $# -eq 0 ]]; then
    dir=$HOME
else
    dir=$1
fi
if [[ ! -d $dir ]]; then
    echo "Error: $dir no es un directorio"
    exit 1
fi
echo "$dir tiene $(contar "$dir") ficheros"
