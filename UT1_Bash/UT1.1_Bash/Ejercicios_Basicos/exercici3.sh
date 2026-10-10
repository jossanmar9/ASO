#!/bin/bash

# UT1.1 - Bash
# Exercici 3 - Listado de /etc con recuento de lineas y palabras
#
# Enunciat:
# Modifica el script anterior para que ademas muestre por pantalla
# el numero de lineas del archivo y el numero de palabras.
#
# Solucion:

ls /etc > listado
cat listado
linies=$(wc -l < listado)
paraules=$(wc -w < listado)

echo "El numero de linies del arxiu es: $linies"

echo "El numero de paraules del arxiu es: $paraules"