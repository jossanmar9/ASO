#!/bin/bash

# Ejercicio 150 · 150_vigilar_procesos.sh — Vigilancia de procesos (tipo examen)
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★★★★
#
# Script parecido a la práctica de la sesión 7, pero no igual. Menú que se
# repite hasta salir:
#     ===== VIGILANCIA DE PROCESOS =====
#     1) Ver los procesos de un usuario ordenados por CPU
#     2) Ver el nombre de un proceso a partir de su PID
#     3) Bajar la prioridad de un proceso
#     4) Finalizar un proceso
#     5) Ver el registro
#     6) Salir
#     Opción:
# - Cada opción en su función; case dentro de un while.
# - Opción 1: comprueba que el usuario existe (id) y muestra sus procesos
#   ordenados por CPU (ps con --sort).
# - Opciones 2, 3 y 4 usan validar_pid.
# - Opción 3: el valor nice debe estar entre 0 y 19, aunque seas root.
# - Opciones 3 y 4 registran lo que hacen en ~/vigilancia.log con el formato
#   "fecha hora - acción - PID - comando".
# - Opción 5: si el fichero no existe (-f): "Todavía no hay registro".
# - Opción incorrecta: "Opción no válida".
#
# Ejemplo:
#   Opción: 5
#   Todavía no hay registro
#   Opción: 1
#   Usuario: jose
#       PID %CPU COMMAND
#      2154  0.3 bash
#      4310  0.0 sleep
#   Opción: 3
#   PID: 4310
#   Nuevo valor nice: 15
#   Prioridad de 4310 (sleep) cambiada a 15
#   Opción: 5
#   2026-11-15 10:30:02 - renice 15 - 4310 - sleep
#
# Pista: Es la sesión 7 con cambios. Reaprovecha tus funciones de 149 y adapta lo que cambia.

# Solución:
