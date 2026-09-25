#!/bin/bash

# UT1.1 - Bash
# Exercici 2 - Listado del directorio /etc
#
# Enunciat:
# Realiza un script que guarde en un fichero el listado de archivos y
# directorios de la carpeta /etc, y posteriormente imprima por pantalla
# dicho listado.
#
# Solucion:

ls /etc > listado
cat listado