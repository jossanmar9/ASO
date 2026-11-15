#!/bin/bash

# Ejercicio 012 · 012_pide_dos.sh — Pedir dos datos
# Bloque 2: Entrada y parámetros · Dificultad: ★☆☆☆☆
#
# Pide el nombre y la edad y muestra una frase con los dos.
#
# Ejemplo:
#   $ ./012_pide_dos.sh
#   Nombre: Ana
#   Edad: 20
#   Ana tiene 20 años
#
# Pista: Chuleta, apartado 2.

# Solución:

read -p "¿Como te llamas?: " nombre
read -p "¿Cuántos años tienes?: " edad

echo "Mi nombre es $nombre y tengo $edad años de edad"