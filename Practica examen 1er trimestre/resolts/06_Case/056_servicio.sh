#!/bin/bash

# Ejercicio 056 · 056_servicio.sh — Simular un servicio
# Bloque 6: case · Dificultad: ★★★☆☆
#
# Recibe start, stop, restart o status y muestra lo que haría. Con
# cualquier otra cosa (o nada), el uso.
#
# Ejemplo:
#   $ ./056_servicio.sh start
#   Arrancando el servicio...
#   $ ./056_servicio.sh hola
#   Uso: ./056_servicio.sh start|stop|restart|status
#
# Pista: Chuleta, apartado 7.

# Solución:

case $1 in
    start)   echo "Arrancando el servicio..." ;;
    stop)    echo "Parando el servicio..." ;;
    restart) echo "Reiniciando el servicio..." ;;
    status)  echo "El servicio está activo" ;;
    *)       echo "Uso: $0 start|stop|restart|status"
             exit 1 ;;
esac
