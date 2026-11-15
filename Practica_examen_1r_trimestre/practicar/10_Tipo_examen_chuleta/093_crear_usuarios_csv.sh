#!/bin/bash

# Ejercicio 093 · 093_crear_usuarios_csv.sh — Altas desde un CSV
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Lee usuarios.csv (está en esta misma carpeta) con el formato nombre,apellido,departamento (en
# minúsculas). Para cada línea genera el login: la primera letra del nombre y
# el apellido (lucia,ferrer -> lferrer). Si ese usuario ya existe en el
# sistema (id), avisa. Si no, muestra la orden useradd (sin ejecutarla).
# Al final, cuántas altas habría.
#
# Ejemplo:
#   $ ./093_crear_usuarios_csv.sh usuarios.csv
#   sudo useradd -m -c "lucia ferrer (informatica)" lferrer
#   sudo useradd -m -c "hugo marti (contabilidad)" hmarti
#   ...
#   ----
#   Altas: 4
#
# Pista: Chuleta, apartados 6 (${n:0:1}), 7 (if id) y 8 (IFS=,).

# Solución:

