#!/bin/bash

# Ejercicio 098 · 098_comprobar_password.sh — Política de contraseñas
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Recibe una contraseña (entre comillas simples si tiene símbolos) y
# comprueba: al menos 8 caracteres, alguna cifra, alguna mayúscula y alguna
# minúscula. Muestra el resultado de TODAS las condiciones y, al final, si es
# segura (cumple las 4) o no.
#
# Ejemplo:
#   $ ./098_comprobar_password.sh 'Bash2026'
#     Al menos 8 caracteres: sí
#     Alguna cifra: sí
#     Alguna mayúscula: sí
#     Alguna minúscula: sí
#   La contraseña es segura
#
# Pista: Chuleta, apartados 5 (regex sin ^ ni $ = 'contiene') y 6 (${#p}).

# Solución:

