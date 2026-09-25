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
