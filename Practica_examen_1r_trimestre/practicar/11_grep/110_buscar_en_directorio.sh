#!/bin/bash

# Ejercicio 110 · 110_buscar_en_directorio.sh — Buscar en un directorio
# Bloque 11: grep · Dificultad: ★★★☆☆
#
# Recibe un directorio y una palabra. Muestra el nombre de los ficheros (de
# ese directorio y sus subdirectorios) que contienen la palabra, y cuántos
# son.
#
# Ejemplo:
#   $ ./110_buscar_en_directorio.sh __grep_dir ERROR
#   __grep_dir/logs/viejo.log
#   __grep_dir/sistema.log
#   ----
#   Ficheros: 2
#
# Pista: man grep: opciones -r (recursivo) y -l (solo nombres). Para contar: | wc -l.

# Solución:

