#!/bin/bash

# Ejercicio 091 · 091_inventario_directorio.sh — Inventario de un directorio
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Recibe un directorio (por defecto, $HOME). Si no existe, error.
# Recorre su contenido y cuenta cuántos ficheros regulares, directorios y
# enlaces simbólicos hay. Muestra cada entrada con su tipo y, al final,
# un resumen.
#
# Ejemplo:
#   $ ./091_inventario_directorio.sh /etc/ssh
#   [D] ssh_config.d
#   [F] ssh_config
#   ...
#   ----
#   Ficheros: 5
#   Directorios: 2
#   Enlaces: 0
#
# Pista: Chuleta, apartados 3, 5, 6 (${f##*/}), 7 y 8.

# Solución:

