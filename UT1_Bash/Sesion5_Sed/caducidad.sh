#!/bin/bash

# Ejercicio 4. caducidad.sh — Caducidad de las contraseñas
#
# Recibe un número de días y cambia el valor de PASS_MAX_DAYS en la copia
# login.defs de tu carpeta (~/lab-sed).
# - Comprueba con una expresión regular que el parámetro es un número de 1 a 3
#   cifras. Si no lo es, muestra un error y termina.
# - Modifica el fichero con sed, guardando una copia del original con la
#   extensión .bak.
# - Al final, muestra el valor anterior y el nuevo.
#
# Ejemplo:
# $ ./caducidad.sh 90
# Antes:   PASS_MAX_DAYS   99999
# Después: PASS_MAX_DAYS 90
# $ ./caducidad.sh noventa
# Error: noventa no es un número de días válido

# Solución:

fichero=~/lab-sed/login.defs

if [ $# -eq 0 ]; then
    echo "Uso: $0 <días>"
    exit 1
fi

re_dias='^[0-9]{1,3}$'
if [[ ! $1 =~ $re_dias ]]; then
    echo "Error: $1 no es un número de días válido"
    exit 1
fi

if [ ! -f "$fichero" ]; then
    echo "Error: el fichero $fichero no existe"
    exit 1
fi

antes=$(grep "^PASS_MAX_DAYS" "$fichero")
sed -i.bak "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS $1/" "$fichero"
despues=$(grep "^PASS_MAX_DAYS" "$fichero")

echo "Antes:   $antes"
echo "Después: $despues"