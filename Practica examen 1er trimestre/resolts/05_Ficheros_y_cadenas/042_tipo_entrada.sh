#!/bin/bash

# Ejercicio 042 · 042_tipo_entrada.sh — Tipo de entrada
# Bloque 5: Ficheros y cadenas · Dificultad: ★★★☆☆
#
# Recibe una ruta y dice si es un enlace simbólico, un directorio, un
# fichero regular u otra cosa, o si no existe. Comprueba primero el enlace.
#
# Ejemplo:
#   $ ./042_tipo_entrada.sh /etc
#   /etc es un directorio
#   $ ./042_tipo_entrada.sh /etc/passwd
#   /etc/passwd es un fichero regular
#
# Pista: Chuleta, apartado 5: -h, -d, -f, -e.

# Solución:

if [[ -h $1 ]]; then
    echo "$1 es un enlace simbólico"
elif [[ -d $1 ]]; then
    echo "$1 es un directorio"
elif [[ -f $1 ]]; then
    echo "$1 es un fichero regular"
elif [[ -e $1 ]]; then
    echo "$1 es otro tipo de fichero"
else
    echo "$1 no existe"
fi
# El enlace se comprueba primero porque -d y -f "siguen" el enlace:
# un enlace a un directorio también daría verdadero con -d.
