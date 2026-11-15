#!/bin/bash

# Ejercicio 153 · 153_resumen_passwd.sh — Resumen de cuentas
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# De passwd.txt muestra: total de cuentas, cuántas no pueden iniciar sesión
# (shell nologin o false), cuántas sí, y las shells usadas con su recuento.
#
# Ejemplo:
#   $ ./153_resumen_passwd.sh
#   Cuentas: 10
#   Sin inicio de sesión: 6
#   Con inicio de sesión: 4
#   Shells:
#         5 /usr/sbin/nologin
#         3 /bin/bash
#         1 /bin/zsh
#         1 /bin/false
#
# Pista: wc -l, grep -cE "(nologin|false)$", cut | sort | uniq -c.

# Solución:

f=passwd.txt
total=$(wc -l < "$f")
sin_login=$(grep -cE "(nologin|false)$" "$f")
echo "Cuentas: $total"
echo "Sin inicio de sesión: $sin_login"
echo "Con inicio de sesión: $(( total - sin_login ))"
echo "Shells:"
cut -d: -f7 "$f" | sort | uniq -c | sort -nr
