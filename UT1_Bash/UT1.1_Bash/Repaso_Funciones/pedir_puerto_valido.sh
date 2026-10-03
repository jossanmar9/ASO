#!/bin/bash

# Actividad 4. pedir_puerto_valido.sh
# Repasa: Funciones + Entrada de datos + Bucles
#
# Escribe una función pedir_puerto_valido que pida repetidamente
# un puerto TCP con read -p hasta que el usuario introduzca un
# número entre 1 y 65535.
#
# Cuando se introduzca un puerto válido, la función debe terminar.
#
# Llama a la función y, cuando acabe, muestra el puerto recibido.
#
# Pistas:
#
# [[ $puerto =~ ^[0-9]+$ ]]
# comprueba que la cadena contiene únicamente dígitos.
#
# (( puerto >= 1 && puerto <= 65535 ))
# comprueba que el puerto está dentro del rango válido.
#
# Si no declaras puerto con local dentro de la función, seguirá
# estando disponible fuera de ella al terminar.
#
# Lista de verificación:
# - "abc" → avisa y vuelve a pedir el puerto.
# - "99999" → avisa y vuelve a pedir el puerto.
# - "8080" → termina y muestra:
#   Puerto válido recibido: 8080

# Solución:
