#!/bin/bash

# Ejercicio 5. config_activa.sh — Configuración sin comentarios
#
# Recibe un fichero de configuración y muestra solo las líneas útiles.
# - Si no recibe parámetro, usa /etc/login.defs.
# - Si el fichero no existe, muestra un error y termina.
# - Salta las líneas que empiezan por # y las líneas vacías.
# - Al final, muestra cuántas líneas tiene el fichero y cuántas son útiles.
#
# Ejemplo:
# $ ./config_activa.sh
# MAIL_DIR        /var/mail
# FAILLOG_ENAB    yes
# ...
# PASS_MAX_DAYS   99999
# ...
# ----
# Líneas totales: 395
# Líneas útiles: 37
#
# Pregunta: busca en la salida el valor de PASS_MAX_DAYS.
# ¿Qué significa? ¿Te parece seguro? Responde en un comentario al final.

# Solución:

if [ $# -eq 0 ]; then
    fichero=/etc/login.defs
else
    fichero=$1
fi

if [ ! -f "$fichero" ]; then
    echo "Error: el fichero $fichero no existe"
    exit 1
fi

re_util='^[^#]'
total=0
utiles=0

while read -r linea; do
    total=$(( total + 1 ))
    if [[ $linea =~ $re_util ]]; then
        echo "$linea"
        utiles=$(( utiles + 1 ))
    fi
done < "$fichero"

echo "----"
echo "Líneas totales: $total"
echo "Líneas útiles: $utiles"

# Indica el número máximo de días que se puede usar una contraseña antes de que se obligue a cambiarla. 99999 sonunos 274 años, por lo que no sería seguro, en un tentorno empresarial se suele solicitar el cambio cada 3 o 6 meses.