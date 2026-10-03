#!/bin/bash

# Ejercicio A1. iniciar_servicio.sh
#
# Escribe un script iniciar_servicio.sh que reciba el nombre de un servicio
# como argumento (parámetro posicional, no con read) y muestre:
#
# "Iniciando el servicio <nombre>..."
#
# Si se ejecuta sin ningún argumento, debe mostrar:
#
# "Debes indicar el nombre del servicio"
#
# Lista de verificación:
# - ./iniciar_servicio.sh apache2 → Iniciando el servicio apache2...
# - ./iniciar_servicio.sh → Debes indicar el nombre del servicio
# - El script no usa read; el nombre llega como $1.

# Solución:

if [ -z "$1" ]; then
    echo "Debes indicar el nombre del servicio"
else
    echo "Iniciando el servicio $1..."
fi
