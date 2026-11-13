#!/bin/bash

# Ejercicio 3. correo_centro.sh — Cuentas de correo del centro
#
# Recibe una dirección de correo como parámetro e indica si es una cuenta
# educativa de Conselleria y de qué tipo:
# - Profesorado: nombre@edu.gva.es
# - Alumnado:    nombre@alu.edu.gva.es
# El nombre tiene al menos un carácter y solo puede contener letras minúsculas,
# dígitos, puntos, guiones o guiones bajos.
# - Si no recibe ningún parámetro, muestra un mensaje de uso y termina.
# - Comprueba con una sola expresión regular que la dirección es de alguno de
#   los dos tipos.
# - Si lo es, indica si pertenece a profesorado o a alumnado.
#
# Ejemplo:
# $ ./correo_centro.sh jgarcia@edu.gva.es
# jgarcia@edu.gva.es es una cuenta de profesorado
# $ ./correo_centro.sh lucia.ferrer@alu.edu.gva.es
# lucia.ferrer@alu.edu.gva.es es una cuenta de alumnado
# $ ./correo_centro.sh nerea@alu.edu.gva
# nerea@alu.edu.gva no es una cuenta educativa
# $ ./correo_centro.sh pepe@gmail.com
# pepe@gmail.com no es una cuenta educativa

# Solución:

if [ $# -eq 0 ]; then
    echo "Uso: $0 <correo>"
    exit 1
fi

re_educativa='^[a-z0-9._-]+@(alu\.)?edu\.gva\.es$'
re_alumnado='@alu\.edu\.gva\.es$'

if [[ $1 =~ $re_educativa ]]; then
    if [[ $1 =~ $re_alumnado ]]; then
        echo "$1 es una cuenta de alumnado"
    else
        echo "$1 es una cuenta de profesorado"
    fi
else
    echo "$1 no es una cuenta educativa"
fi