#!/bin/bash

# Ejercicio 1. inventario_cuentas.sh — Inventario de cuentas de login
#
# Muestra las cuentas de /etc/passwd que usan una shell determinada.
# - Acepta opcionalmente la shell por parámetro. Si no se indica, se usa /bin/bash.
# - Comprueba con una expresión regular que el parámetro es una ruta absoluta:
#   empieza por / y está formada por nombres en minúsculas separados por /.
# - Muestra por pantalla, para cada cuenta con esa shell, una línea con el
#   formato usuario:uid:home:shell.
# - Al final, muestra un resumen con el total de cuentas listadas y cuántas
#   tienen un UID mayor o igual que 1000.
#
# Ejemplo:
# $ ./inventario_cuentas.sh
# root:0:/root:/bin/bash
# alumno:1000:/home/alumno:/bin/bash
# ----
# Cuentas listadas: 2
# Con UID >= 1000: 1
# $ ./inventario_cuentas.sh bash
# Error: bash no es una ruta válida
#
# Ayuda: while IFS=':' read -r usuario x uid gid desc home shell; do ... done < /etc/passwd

# Solución:

if [ $# -eq 0 ]; then
    shell_buscada=/bin/bash
else
    shell_buscada=$1
fi

re_ruta='^(/[a-z]+)+$'
if [[ ! $shell_buscada =~ $re_ruta ]]; then
    echo "Error: $shell_buscada no es una ruta válida"
    exit 1
fi

total=0
mayores=0

while IFS=':' read -r usuario x uid gid desc home shell; do
    if [ "$shell" = "$shell_buscada" ]; then
        echo "$usuario:$uid:$home:$shell"
        total=$(( total + 1 ))
        if [ "$uid" -ge 1000 ]; then
            mayores=$(( mayores + 1 ))
        fi
    fi
done < /etc/passwd

echo "----"
echo "Cuentas listadas: $total"
echo "Con UID >= 1000: $mayores"