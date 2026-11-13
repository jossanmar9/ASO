#!/bin/bash

# Ejercicio 4. comprobar_password.sh — Política de contraseñas
#
# Recibe una contraseña como parámetro y comprueba si cumple la política de
# contraseñas del centro:
# 1. Tiene al menos 12 caracteres.
# 2. Contiene algún dígito.
# 3. Contiene alguna letra mayúscula.
# 4. Contiene algún símbolo, es decir, algún carácter que no sea una letra ni
#    un dígito.
# 5. No es una palabra del diccionario /usr/share/dict/spanish, sin distinguir
#    mayúsculas de minúsculas.
# 6. Si no recibe ningún parámetro, muestra un mensaje de uso y termina.
# 7. Las condiciones 1 a 4 se comprueban con una expresión regular cada una.
#    La condición 5, con grep.
# 8. El script muestra el resultado de todas las condiciones, no solo de la
#    primera que falle, y al final indica si la contraseña es segura.
#
# Ejemplo:
# $ ./comprobar_password.sh administrador
#   Tiene al menos 12 caracteres: sí
#   Contiene algún dígito: no
#   Contiene alguna mayúscula: no
#   Contiene algún símbolo: no
#   No es una palabra del diccionario: no
# La contraseña no es segura
#
# $ ./comprobar_password.sh 'Caminas2026!'
#   Tiene al menos 12 caracteres: sí
#   Contiene algún dígito: sí
#   Contiene alguna mayúscula: sí
#   Contiene algún símbolo: sí
#   No es una palabra del diccionario: sí
# La contraseña es segura
#
# Si la contraseña contiene símbolos, hay que escribirla entre comillas simples
# al ejecutar el script. Si no, la shell puede interpretar algunos de ellos.
#
# Pregunta: Caminas2026! cumple todas las condiciones. ¿Te parece realmente una
# contraseña segura? ¿Por qué? Responde en un comentario al final del script.

# Solución:

if [ $# -eq 0 ]; then
    echo "Uso: $0 '<contraseña>'"
    exit 1
fi

password=$1
diccionario=/usr/share/dict/spanish
segura=si

re_longitud='.{12}'
re_digito='[0-9]'
re_mayuscula='[A-Z]'
re_simbolo='[^A-Za-z0-9]'

if [[ $password =~ $re_longitud ]]; then
    echo "  Tiene al menos 12 caracteres: sí"
else
    echo "  Tiene al menos 12 caracteres: no"
    segura=no
fi

if [[ $password =~ $re_digito ]]; then
    echo "  Contiene algún dígito: sí"
else
    echo "  Contiene algún dígito: no"
    segura=no
fi

if [[ $password =~ $re_mayuscula ]]; then
    echo "  Contiene alguna mayúscula: sí"
else
    echo "  Contiene alguna mayúscula: no"
    segura=no
fi

if [[ $password =~ $re_simbolo ]]; then
    echo "  Contiene algún símbolo: sí"
else
    echo "  Contiene algún símbolo: no"
    segura=no
fi

if grep -q -i "^$password$" "$diccionario"; then
    echo "  No es una palabra del diccionario: no"
    segura=no
else
    echo "  No es una palabra del diccionario: sí"
fi

if [ "$segura" = "si" ]; then
    echo "La contraseña es segura"
else
    echo "La contraseña no es segura"
fi


# Pregunta: Caminas2026! cumple todas las condiciones, pero NO es realmente segura. Sigue un patrón muy típico y previsible: una palabra conocida (el nombre del instituto) + el año actual + un símbolo al final. Los programas que adivinan contraseñas prueban justo estas combinaciones primero, así que caería rápido. Es mejor una frase larga de palabras al azar o una contraseña aleatoria guardada en un gestor de contraseñas.
