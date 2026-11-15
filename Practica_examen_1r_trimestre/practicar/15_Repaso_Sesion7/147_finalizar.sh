#!/bin/bash

# Ejercicio 147 · 147_finalizar.sh — Finalizar un proceso
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★★☆☆
#
# Pide un PID, lo valida y pregunta "¿Finalizar PID (COMANDO)? (s/n): ".
# - Si la respuesta no es s: "Operación cancelada".
# - Si es s: envía SIGTERM, espera 3 segundos y, si el proceso sigue vivo,
#   envía SIGKILL. Al final indica con qué señal ha terminado.
#
# Ejemplo:
#   $ ./207_finalizar.sh
#   PID: 4310
#   ¿Finalizar 4310 (sleep)? (s/n): s
#   Proceso 4310 finalizado con SIGTERM
#
# Pista: Opción 5 de la sesión 7. kill -SIGTERM, sleep 3, y para saber si sigue vivo: ps -p (o tu validar_pid).

# Solución:
