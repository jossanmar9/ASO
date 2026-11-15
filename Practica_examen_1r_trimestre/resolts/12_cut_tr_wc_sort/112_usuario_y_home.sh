#!/bin/bash

# Ejercicio 112 · 112_usuario_y_home.sh — Usuario y directorio personal
# Bloque 12: cut, tr, wc, sort · Dificultad: ★★★☆☆
#
# Muestra, de passwd.txt, el usuario y su directorio personal (campos 1 y
# 6) solo de los usuarios con UID de 4 cifras (los que empiezan en 1000).
#
# Ejemplo:
#   $ ./112_usuario_y_home.sh
#   jose:/home/jose
#   alumno:/home/alumno
#   profe:/home/profe
#
# Pista: grep con :[0-9]{4}: (grep -E) y cut -d: -f1,6.

# Solución:

grep -E "^[^:]*:[^:]*:[0-9]{4}:" passwd.txt | cut -d: -f1,6
# ^[^:]*:   el usuario (lo que sea hasta el primer :)
# [^:]*:    la x
# [0-9]{4}: el UID con exactamente 4 cifras
