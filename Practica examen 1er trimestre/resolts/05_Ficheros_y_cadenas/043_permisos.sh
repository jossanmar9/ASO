#!/bin/bash

# Ejercicio 043 · 043_permisos.sh — Permisos de un fichero
# Bloque 5: Ficheros y cadenas · Dificultad: ★★★☆☆
#
# Recibe un fichero y dice si puedes leerlo, escribirlo y ejecutarlo.
# Si no existe, error.
#
# Ejemplo:
#   $ ./043_permisos.sh /etc/shadow
#   Lectura: no
#   Escritura: no
#   Ejecución: no
#
# Pista: Chuleta, apartado 5: -r, -w, -x.

# Solución:

if [[ ! -e $1 ]]; then
    echo "Error: $1 no existe"
    exit 1
fi
if [[ -r $1 ]]; then echo "Lectura: sí"; else echo "Lectura: no"; fi
if [[ -w $1 ]]; then echo "Escritura: sí"; else echo "Escritura: no"; fi
if [[ -x $1 ]]; then echo "Ejecución: sí"; else echo "Ejecución: no"; fi
