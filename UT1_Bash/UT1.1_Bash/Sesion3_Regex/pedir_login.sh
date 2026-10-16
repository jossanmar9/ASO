#!/bin/bash

# Ejercicio 4. pedir_login.sh — Nombre de usuario válido
#
# Pide un nombre de usuario con read y lo vuelve a pedir hasta que sea
# válido. Un login es válido si:
# - Empieza por una letra minúscula.
# - Después solo tiene letras minúsculas o dígitos.
# Cuando sea válido, comprueba si ya existe en el sistema.
# Si no existe, muestra la orden para crearlo (sin ejecutarla).
#
# Ejemplo:
# $ ./pedir_login.sh
# Nombre de usuario: 1alumno
#   No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos.
# Nombre de usuario: Alumno
#   No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos.
# Nombre de usuario: root
# El usuario root ya existe.
# $ ./pedir_login.sh
# Nombre de usuario: alumno07
# Para crearlo: sudo useradd -m -s /bin/bash alumno07
#
# Ayuda: para saber si existe: grep -q "^$login:" /etc/passwd

# Solución:

re='^[a-z][a-z0-9]*$'

while true; do
    read -p "Nombre de usuario: " login
    if [[ $login =~ $re ]]; then
        break
    fi
    echo "  No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos."
done

if grep -q "^$login:" /etc/passwd; then
    echo "El usuario $login ya existe."
else
    echo "Para crearlo: sudo useradd -m -s /bin/bash $login"
fi