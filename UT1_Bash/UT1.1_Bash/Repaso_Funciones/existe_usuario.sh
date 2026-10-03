#!/bin/bash

# Actividad 5. existe_usuario.sh
# Repasa: Funciones + Gestión de usuarios
#
# Escribe una función existe_usuario que reciba un nombre de usuario
# y devuelva (con echo) si existe o no en el sistema.
#
# Llama a la función con un usuario que exista (por ejemplo, root)
# y con otro que no exista.
#
# Pista:
#
# if id "$1" &>/dev/null; then ...
#
# id falla si el usuario no existe.
# &>/dev/null descarta la salida del comando.
#
# Lista de verificación:
# - existe_usuario root
#   → El usuario root existe en el sistema.
#
# - existe_usuario noexiste123
#   → El usuario noexiste123 no existe.

# Solución:
