#!/bin/bash

# Ejercicio 152 · 152_usuarios_reales.sh — Usuarios reales
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# De passwd.txt, muestra los usuarios con UID >= 1000 con el formato
# "usuario (UID) -> home, shell" y cuántos hay. Usa while IFS=: read.
#
# Ejemplo:
#   $ ./152_usuarios_reales.sh
#   jose (1000) -> /home/jose, /bin/bash
#   alumno (1001) -> /home/alumno, /bin/bash
#   profe (1002) -> /home/profe, /bin/zsh
#   ----
#   Usuarios reales: 3
#
# Pista: while IFS=: read -r usuario x uid gid desc home shell; do ... done < passwd.txt

# Solución:

total=0
while IFS=: read -r usuario x uid gid desc home shell; do
    if [[ $uid -ge 1000 ]]; then
        echo "$usuario ($uid) -> $home, $shell"
        ((total++))
    fi
done < passwd.txt
echo "----"
echo "Usuarios reales: $total"
