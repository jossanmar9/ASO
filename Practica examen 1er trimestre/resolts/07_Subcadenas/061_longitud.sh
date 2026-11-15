#!/bin/bash

# Ejercicio 061 · 061_longitud.sh — Longitud de una palabra
# Bloque 7: Subcadenas · Dificultad: ★★★★☆
#
# Recibe una palabra y muestra cuántas letras tiene.
#
# Ejemplo:
#   $ ./061_longitud.sh administracion
#   administracion tiene 14 caracteres
#
# Pista: Chuleta, apartado 6: ${#c}.

# Solución:

palabra=$1
echo "$palabra tiene ${#palabra} caracteres"
