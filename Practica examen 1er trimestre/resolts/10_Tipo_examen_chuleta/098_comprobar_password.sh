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

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 'contraseña'"
    exit 1
fi
p=$1
segura=si

if [[ ${#p} -ge 8 ]]; then
    echo "  Al menos 8 caracteres: sí"
else
    echo "  Al menos 8 caracteres: no"
    segura=no
fi
if [[ $p =~ [0-9] ]]; then
    echo "  Alguna cifra: sí"
else
    echo "  Alguna cifra: no"
    segura=no
fi
if [[ $p =~ [A-Z] ]]; then
    echo "  Alguna mayúscula: sí"
else
    echo "  Alguna mayúscula: no"
    segura=no
fi
if [[ $p =~ [a-z] ]]; then
    echo "  Alguna minúscula: sí"
else
    echo "  Alguna minúscula: no"
    segura=no
fi

if [[ $segura == si ]]; then
    echo "La contraseña es segura"
else
    echo "La contraseña no es segura"
fi
