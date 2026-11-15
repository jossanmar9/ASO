#!/bin/bash

# Ejercicio 111 · 111_nombres_usuarios.sh — Nombres de usuario
# Bloque 12: cut, tr, wc, sort · Dificultad: ★★★☆☆
#
# Muestra solo los nombres de usuario de passwd.txt (el primer campo).
#
# Ejemplo:
#   $ ./111_nombres_usuarios.sh
#   root
#   daemon
#   bin
#   sys
#   www-data
#   sshd
#   jose
#   alumno
#   ...
#
# Pista: cut -d: -f1.

# Solución:

cut -d: -f1 passwd.txt
