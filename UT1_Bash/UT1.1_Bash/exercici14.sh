#!/bin/bash

# UT1.1 - Bash - Estructuras condicionales
# Exercici 14 - Alta y baja de usuarios
#
# Enunciat:
# Realiza un script que permita dar de alta y de baja a usuarios
# del sistema GNU/Linux indicados como argumento:
#
# ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]
#
# En caso de alta, el identificador tendra el formato aluXXYYZ,
# donde XX son las dos primeras letras del apellido1,
# YY las dos primeras letras del apellido2 y Z la inicial del nombre.
#
# Si no se indica grupo, se creara uno con el mismo identificador.
#
# En caso de baja, se calculara la identificacion del usuario
# y se procedera a dar de baja la cuenta.
#
# En cualquier otro caso se mostrara un error indicando la sintaxis correcta.
#
# Solucion:

accio="$1"
nom="$2"
cognom1="$3"
cognom2="$4"
grup="$5"

identitat="alu${cognom1:0:2}${cognom2:0:2}${nom:0:1}"
identitat="${identitat,,}"

if [ "$#" -lt 4 ]; then
        echo "No s'han passat tots els parametres, has d'indicar si vols alta/baixa, nom, cognom1, cognom2 i grup (opcional)"
        exit 1
    else
        echo "El nom de l'usuari serà: $identitat"
    fi

case "$accio" in
    alta) if [ -z "$grup" ]; then
        sudo groupadd "$identitat"
        sudo useradd -m -g "$identitat" "$identitat"
    else
        sudo useradd -m -g "$grup" "$identitat"
    fi

    echo "Usuari $identitat creat correctament" ;;
    baixa)
        sudo userdel -r "$identitat"
    echo "Usuari $identitat eliminat correctament"
    ;;
    *)
        echo "Error: has d'indicar alta o baixa"
        exit 1
        ;;
esac