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
