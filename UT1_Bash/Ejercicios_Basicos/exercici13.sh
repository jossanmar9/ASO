#!/bin/bash

# UT1.1 - Bash - Estructuras condicionales
# Exercici 13 - AGENDA: mantenimiento de lista.txt
#
# Enunciat:
# Construye un programa denominado AGENDA que permita mediante un menu
# el mantenimiento de un archivo lista.txt con el nombre, direccion
# y telefono de varias personas.
#
# Debe incluir las opciones:
# - Anadir: anadir un registro.
# - Buscar: buscar entradas por nombre, direccion o telefono.
# - Listar: visualizar todo el archivo.
# - Ordenar: ordenar los registros alfabeticamente.
# - Borrar: borrar el archivo.
#
# Solucion:

echo "Benvingut a la teua agenda. Que vols fer?"
echo "1) Afegir"
echo "2) Buscar"
echo "3) Llistar"
echo "4) Ordenar alfabèticament"
echo "5) Esborrar agenda"
read -p "Tria una opció (1-5): " opcio


case "$opcio" in
    1) read -p "Nom: " nom
       read -p "Direcció: " direccio
       read -p "Telèfon: " telefon
       echo "$nom;$direccio;$telefon" >> lista.txt  ;;
    2) read -p "Nom a buscar: " nom
       grep "$nom" lista.txt ;;
    3) cat lista.txt ;;
    4) sort lista.txt >temp.txt
       mv temp.txt lista.txt ;;
    5) rm lista.txt
       echo "S'ha esborrat l'agenda";;
    *) echo "Opció no contemplada"
        exit 1;;
esac

