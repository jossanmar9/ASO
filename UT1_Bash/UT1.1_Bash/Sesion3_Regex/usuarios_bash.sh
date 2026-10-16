#!/bin/bash

# Ejercicio 3. usuarios_bash.sh — Usuarios con shell bash
#
# Lee /etc/passwd línea a línea y muestra el nombre de los usuarios
# cuya línea termina en bash. Al final, muestra cuántos hay.
#
# Ejemplo:
# $ ./usuarios_bash.sh
# root
# alumno
# ----
# Usuarios con bash: 2
#
# Ayuda:
# - while read -r linea; do ... done < /etc/passwd
# - El nombre del usuario es lo que hay antes del primer ":".
#   Puedes sacarlo con ${linea%%:*}

# Solución:

re='bash$'
total=0

while read -r linea; do
    if [[ $linea =~ $re ]]; then
        echo "${linea%%:*}"
        total=$(( total + 1 ))
    fi
done < /etc/passwd

echo "----"
echo "Usuarios con bash: $total"