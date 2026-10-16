#!/bin/bash

# Ejercicio 1. puerto.sh — ¿Es un número de puerto?
#
# Recibe un número de puerto como parámetro y dice si es válido.
# - Si no recibe ningún parámetro, muestra un mensaje de uso y termina.
# - Comprueba con una expresión regular que el parámetro solo tiene dígitos.
# - Si son dígitos, comprueba que el número está entre 1 y 65535.
#
# Ejemplo:
# $ ./puerto.sh 22      → 22 es un puerto válido
# $ ./puerto.sh 80a     → 80a no es un número
# $ ./puerto.sh 70000   → 70000 está fuera de rango (1-65535)

# Solución:
