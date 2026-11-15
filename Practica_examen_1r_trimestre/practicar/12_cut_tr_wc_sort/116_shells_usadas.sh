#!/bin/bash

# Ejercicio 116 · 116_shells_usadas.sh — Shells usadas
# Bloque 12: cut, tr, wc, sort · Dificultad: ★★★☆☆
#
# Muestra qué shells se usan en passwd.txt (último campo) y cuántos usuarios
# usan cada una, de más a menos.
#
# Ejemplo:
#   $ ./116_shells_usadas.sh
#         5 /usr/sbin/nologin
#         3 /bin/bash
#         1 /bin/zsh
#         1 /bin/false
#
# Pista: cut -d: -f7 | sort | uniq -c | sort -nr. man uniq, man sort.

# Solución:

