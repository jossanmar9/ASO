#!/bin/bash

# Ejercicio 158 · 158_renombrar_con_sed.sh — Renombrar con sed
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Recibe un directorio. Para cada fichero cuyo nombre tenga espacios o
# mayúsculas, muestra la orden mv que lo dejaría en minúsculas y con _ en lugar
# de espacios (sin ejecutarla). Al final, cuántos habría que renombrar.
#
# Ejemplo:
#   $ ./158_renombrar_con_sed.sh __renombrar
#   mv "__renombrar/Foto Playa.JPG" "__renombrar/foto_playa.jpg"
#   mv "__renombrar/Mis Apuntes.txt" "__renombrar/mis_apuntes.txt"
#   A renombrar: 2
#
# Pista: nuevo=$(echo "$nombre" | sed 's/ /_/g' | tr 'A-Z' 'a-z'). Ojo con las comillas en mv.

# Solución:

