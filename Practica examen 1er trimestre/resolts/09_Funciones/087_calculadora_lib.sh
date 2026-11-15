#!/bin/bash

# Ejercicio 087 · 087_calculadora_lib.sh — Librería de funciones
# Bloque 9: Funciones · Dificultad: ★★★★★
#
# Crea un fichero funciones_mates.sh (SIN permiso de ejecución) con las
# funciones sumar, restar y multiplicar. Después, este script carga la
# librería con source y usa las tres funciones con dos parámetros.
#
# Ejemplo:
#   $ ./087_calculadora_lib.sh 6 3
#   Suma: 9
#   Resta: 3
#   Multiplicación: 18
#
# Pista: Chuleta, apartado 9: librería de funciones.

# Solución:

# Contenido de funciones_mates.sh (fichero aparte, en la misma carpeta):
#   sumar()       { echo $(( $1 + $2 )); }
#   restar()      { echo $(( $1 - $2 )); }
#   multiplicar() { echo $(( $1 * $2 )); }

source "./funciones_mates.sh"

echo "Suma: $(sumar "$1" "$2")"
echo "Resta: $(restar "$1" "$2")"
echo "Multiplicación: $(multiplicar "$1" "$2")"
