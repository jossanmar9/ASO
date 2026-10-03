#!/bin/bash

# Ejercicio B1. clasificar_entradas.sh
#
# Escribe un script clasificar_entradas.sh que recorra todas las entradas
# de ~/prueba_bash (no solo la carpeta datos) y muestre, para cada una,
# su nombre seguido de "fichero" o "directorio", según corresponda.
#
# Pista:
# - Usa -f para comprobar si es un fichero.
# - Usa -d para comprobar si es un directorio.
# - Para mostrar solo el nombre y no la ruta completa:
#   basename "$entrada"
#
# Lista de verificación:
# - El resultado tiene una línea por cada entrada de ~/prueba_bash.
# - datos y proyecto deben aparecer como directorio.
# - plantilla.sh, sistema.log y los scripts creados deben aparecer
#   como fichero.
# - El número exacto de líneas puede variar según los ficheros existentes.

# Solución:

for entrada in ~/prueba_bash/*; do
    nombre=$(basename "$entrada")

    if [ -d "$entrada" ]; then
        echo "$nombre directorio"
    elif [ -f "$entrada" ]; then
        echo "$nombre fichero"
    fi
done