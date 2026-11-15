#!/bin/bash

# Ejercicio 157 · 157_rotar_copias.sh — Rotación de copias
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Recibe un directorio de copias y un máximo N. Las copias se llaman
# etc-AAAAMMDD-HHMMSS.tar.gz. Cuenta solo los ficheros que cumplen ese formato
# (regex). Si hay más de N, muestra cuáles se borrarían (las más antiguas:
# como la fecha va en el nombre, basta con ordenar los nombres).
# Para probarlo, crea copias de ejemplo con touch.
#
# Ejemplo:
#   $ ./157_rotar_copias.sh __copias 2
#   Copias encontradas: 4
#   Se borrarían las 2 más antiguas:
#   etc-20261110-210000.tar.gz
#   etc-20261111-210000.tar.gz
#   $ ./157_rotar_copias.sh __copias 9
#   Copias encontradas: 4
#   No hay que borrar nada
#
# Pista: for + regex con {8} {6}; ls | grep -E | sort | head -n (sobran).

# Solución:

if [[ $# -ne 2 || ! -d $1 || ! $2 =~ ^[0-9]+$ ]]; then
    echo "Uso: $0 directorio maximo"
    exit 1
fi
re='^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$'
total=0
for f in "$1"/*; do
    nombre=${f##*/}
    if [[ $nombre =~ $re ]]; then
        ((total++))
    fi
done
echo "Copias encontradas: $total"
if [[ $total -le $2 ]]; then
    echo "No hay que borrar nada"
    exit 0
fi
sobran=$(( total - $2 ))
echo "Se borrarían las $sobran más antiguas:"
ls "$1" | grep -E "$re" | sort | head -n "$sobran"
