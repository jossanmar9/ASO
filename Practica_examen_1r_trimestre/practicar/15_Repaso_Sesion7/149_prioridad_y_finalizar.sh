#!/bin/bash

# Ejercicio 149 · 149_prioridad_y_finalizar.sh — Prioridad y finalizar con registro
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★★★☆
#
# Junta los ejercicios 146 y 147 en un menú que se repite hasta salir:
#     1) Cambiar la prioridad de un proceso
#     2) Finalizar un proceso
#     3) Salir
# Cada opción va en su función (cambiar_prioridad y finalizar_proceso) y las dos
# usan validar_pid. Cada cambio de prioridad y cada proceso finalizado se registra
# con la función registrar en ~/gestion_procesos.log.
# Dentro de las funciones, usa return en lugar de exit.
#
# Ejemplo:
#   Opción: 1
#   PID: 4310
#   Nuevo valor nice: 10
#   Prioridad de 4310 (sleep) cambiada a 10
#   Opción: 2
#   PID: 4310
#   ¿Finalizar 4310 (sleep)? (s/n): s
#   Proceso 4310 finalizado con SIGTERM
#   Opción: 3
#   $ cat ~/gestion_procesos.log
#   2026-11-15 10:25:19 - renice 10 - 4310 - sleep
#   2026-11-15 10:25:22 - SIGTERM - 4310 - sleep
#
# Pista: ¡Cuidado! registra ANTES de matar el proceso (después ps -p ya no encuentra el comando), o guarda el comando en una variable y pásaselo.

# Solución:
