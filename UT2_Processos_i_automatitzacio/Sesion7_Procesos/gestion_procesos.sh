#!/bin/bash

# Práctica: gestión de procesos — gestion_procesos.sh
#
# Se aplica lo trabajado en la UT1 de Bash junto a la gestión de procesos en
# Linux de la UT2: consultar los procesos con ps, cambiar su prioridad con
# renice y enviarles señales con kill.
#
# Requisitos del script:
# - El código debe estar comentado y seguir las buenas prácticas vistas en la UT1.
# - Controlar los errores: parámetros o datos que faltan o que no son válidos.
#   En caso de error, el script muestra un mensaje.
#
# Muestra un menú y lo repite hasta que el usuario elija salir:
#
#   ===== GESTIÓN DE PROCESOS =====
#   1) Listar los procesos de un usuario
#   2) Buscar un proceso por nombre
#   3) Mostrar los N procesos que más CPU consumen
#   4) Cambiar la prioridad de un proceso
#   5) Finalizar un proceso
#   6) Salir
#   Opción:
#
# 1. Cada opción del menú se implementa en su propia función: listar_usuario,
#    buscar_proceso, top_cpu, cambiar_prioridad y finalizar_proceso. La opción
#    se selecciona con case dentro de un bucle while.
# 2. Listar los procesos de un usuario: pide el nombre de usuario y comprueba
#    que existe (id) antes de mostrar sus procesos con ps.
# 3. Buscar un proceso por nombre: muestra el PID, el usuario, el porcentaje de
#    CPU y el comando de los procesos que coincidan. Si no hay ninguno, informa
#    de ello.
# 4. Mostrar los N procesos que más CPU consumen: la función recibe N como
#    parámetro (por defecto, 5) y usa ps ordenado por consumo de CPU.
# 5. Cambiar la prioridad: pide el PID y el nuevo valor nice. Comprueba que el
#    PID existe (ps -p) y que el valor está entre -20 y 19; si el script no se
#    ejecuta como root, solo permite valores entre 0 y 19. Aplica el cambio con
#    renice.
# 6. Finalizar un proceso: pide el PID y una confirmación (s/n). Envía primero
#    la señal SIGTERM; si a los 3 segundos el proceso sigue vivo, envía SIGKILL.
# 7. Crea una función validar_pid que reciba un PID como parámetro y devuelva 0
#    si es un número y el proceso existe, o 1 en caso contrario. Reutilízala en
#    las opciones 4 y 5.
# 8. Registra cada cambio de prioridad y cada proceso finalizado en el fichero
#    ~/gestion_procesos.log con el formato: fecha hora - acción - PID - comando.
#
# Ejemplos de ejecución de algunas opciones (sin el menú):
#
#   Opción: 2
#   Nombre del proceso: firefox
#   No hay ningún proceso que coincida con firefox
#
#   Opción: 4
#   PID: 4310
#   Nuevo valor nice: -5
#   Error: el valor debe estar entre 0 y 19
#
#   Opción: 5
#   PID: 4310
#   ¿Finalizar 4310 (sleep)? (s/n): s
#   Proceso 4310 finalizado con SIGTERM
#
#   $ cat ~/gestion_procesos.log
#   2026-10-27 10:25:19 - renice 10 - 4310 - sleep
#   2026-10-27 10:25:22 - SIGTERM - 4310 - sleep
#
# Ayuda:
# - Para saber si el script se ejecuta como root: [[ $EUID -eq 0 ]]
# - Para obtener solo el nombre del comando de un PID, sin cabecera:
#   ps -p "$pid" -o comm=
# - Para enviar una señal: kill -SIGTERM "$pid"

# Solución:

