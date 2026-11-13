#!/bin/bash

# Ejercicio A2. nivel_disco.sh
#
# Escribe un script nivel_disco.sh que reciba dos argumentos:
# los bytes usados y los bytes totales de un disco.
#
# El script debe calcular el porcentaje de uso y mostrar:
#
# - Por debajo de 70 → OK
# - Entre 70 y 89 (ambos incluidos) → AVISO
# - 90 o más → CRÍTICO
#
# Lista de verificación:
# - ./nivel_disco.sh 35 100 → OK
# - ./nivel_disco.sh 70 100 → AVISO
# - ./nivel_disco.sh 190 200 → CRÍTICO
# - Usa $(( )) para calcular el porcentaje.
# - Usa elif para encadenar las tres condiciones.

# Solución:

porcentaje=$(( $1 * 100 / $2 )) 

if [ $porcentaje -lt 70 ]; then
    echo "OK, el uso del disco es menos que el 70%"
elif [ $porcentaje -le 89 ]; then
    echo "Aviso, el uso del disco está entre el 70% y el 89%"
else
    echo "Crítico, el uso del disco es igual o superior al 90%"
fi