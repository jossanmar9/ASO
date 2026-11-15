#!/bin/bash

# Ejercicio 055 · 055_tipo_fichero_ext.sh — Tipo según la extensión
# Bloque 6: case · Dificultad: ★★★☆☆
#
# Recibe un nombre de fichero y dice su tipo según cómo acaba:
# .sh -> script, .txt -> texto, .jpg o .png -> imagen, otro -> desconocido.
#
# Ejemplo:
#   $ ./055_tipo_fichero_ext.sh foto.png
#   foto.png es una imagen
#
# Pista: Chuleta, apartado 7 (case) y 5 (comodines con *).

# Solución:

case $1 in
    *.sh)        echo "$1 es un script" ;;
    *.txt)       echo "$1 es un texto" ;;
    *.jpg|*.png) echo "$1 es una imagen" ;;
    *)           echo "$1 es de tipo desconocido" ;;
esac
