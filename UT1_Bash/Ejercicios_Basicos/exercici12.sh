#!/bin/bash

# UT1.1 - Bash - Estructuras condicionales
# Exercici 12 - Buenos dias / tardes / noches segun la hora
#
# Enunciat:
# Crea un shell script que muestre "Buenos dias", "Buenas tardes" o
# "Buenas noches" en funcion de la hora del sistema.
# De 8:00 a 15:00 sera manana, de 15:00 a 20:00 sera tarde
# y el resto sera noche.
# Para obtener la hora del sistema utiliza el comando date.
#
# Solucion:

hora=$(date +"%H")

if [ "$hora" -ge 8 ] && [ "$hora" -lt 15 ]; then
    echo "Bon dia"
elif
    [ "$hora" -ge 15 ] && [ "$hora" -lt 20 ]; then
    echo "Bona vesprada"
else
    echo "Bona nit"
fi