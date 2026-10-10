#!/bin/bash

# Actividad 2. clasificar_http.sh
# Repasa: Funciones + Condicionales
#
# Escribe una función clasificar_http que reciba un código de
# estado HTTP y devuelva (con echo):
#
# - 200-299 → Éxito
# - 300-399 → Redirección
# - 400-499 → Error del cliente
# - 500-599 → Error del servidor
#
# Prueba la función con varios códigos.
#
# Lista de verificación:
# - clasificar_http 200 → Éxito
# - clasificar_http 301 → Redirección
# - clasificar_http 404 → Error del cliente
# - clasificar_http 500 → Error del servidor
# - Usa elif para encadenar los cuatro tramos, con [[ ]].

# Solución:

clasificar_http() {
    if [[ $1 -ge 200 && $1 -le 299 ]]; then
        echo "Éxito"
    elif [[ $1 -ge 300 && $1 -le 399 ]]; then
        echo "Redirección"
    elif [[ $1 -ge 400 && $1 -le 499 ]]; then
        echo "Error del cliente"
    elif [[ $1 -ge 500 && $1 -le 599 ]]; then
        echo "Error del servidor"
    fi
}

clasificar_http 200
clasificar_http 301
clasificar_http 404
clasificar_http 500