#!/bin/bash

# Ejercicio 005 · 005_fecha_hoy.sh — Fecha de hoy
# Bloque 1: Script y variables · Dificultad: ★☆☆☆☆
#
# Guarda la fecha de hoy (formato AAAA-MM-DD) en una variable y muéstrala.
#
# Ejemplo:
#   $ ./005_fecha_hoy.sh
#   Hoy es 2026-11-15
#
# Pista: Chuleta, apartado 2: hoy=$(date +%F).

# Solución:

hoy=$(date +%F)
echo "Hoy es $hoy"
