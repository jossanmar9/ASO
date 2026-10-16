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
