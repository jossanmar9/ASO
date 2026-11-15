#!/bin/bash

# Ejercicio 041 · 041_existe.sh — ¿Existe?
# Bloque 5: Ficheros y cadenas · Dificultad: ★★★☆☆
#
# Recibe una ruta y dice si existe o no.
#
# Ejemplo:
#   $ ./041_existe.sh /etc/passwd
#   /etc/passwd existe
#   $ ./041_existe.sh /noexiste
#   /noexiste no existe
#
# Pista: Chuleta, apartado 5: ficheros (-e).

# Solución:

if [[ -e $1 ]]; then
    echo "$1 existe"
else
    echo "$1 no existe"
fi
