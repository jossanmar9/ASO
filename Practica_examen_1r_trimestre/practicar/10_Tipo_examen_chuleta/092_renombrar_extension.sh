#!/bin/bash

# Ejercicio 092 · 092_renombrar_extension.sh — Renombrar extensiones
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Recibe un directorio, una extensión vieja y una nueva (sin punto).
# Comprueba: 3 parámetros, que el directorio existe y que las extensiones
# solo tienen minúsculas y cifras. Muestra la orden mv para cada fichero con
# la extensión vieja (sin ejecutarla) y cuántos hay.
#
# Ejemplo:
#   $ ./092_renombrar_extension.sh fotos jpeg jpg
#   mv fotos/playa.jpeg fotos/playa.jpg
#   mv fotos/monte.jpeg fotos/monte.jpg
#   Ficheros a renombrar: 2
#
# Pista: Chuleta, apartados 3, 5 (regex), 6 (${f%.*}) y 8.

# Solución:

