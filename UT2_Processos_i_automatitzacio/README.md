# UT2 - Processos i automatització

Pràctiques de gestió de processos en Linux amb Bash: consultar processos amb `ps`, canviar-ne la prioritat amb `renice` i enviar-los senyals amb `kill`.

## Estructura

| Carpeta | Contingut |
|---|---|
| [`Sesion7_Procesos/`](Sesion7_Procesos/) | Pràctica de gestió de processos |

Chuleta de consulta de la unitat: [`cheatsheet_UT2.md`](cheatsheet_UT2.md)

## Sesion7_Procesos

- `gestion_procesos.sh` - Menú per a gestionar processos:
  - Llistar els processos d'un usuari (comprovant que existix amb `id`)
  - Buscar un procés pel nom
  - Mostrar els N processos que més CPU consumixen (per defecte, 5)
  - Canviar la prioritat d'un procés amb `renice` (de -20 a 19 com a root i de 0 a 19 com a usuari normal)
  - Finalitzar un procés amb `SIGTERM` i, si als 3 segons continua viu, amb `SIGKILL`
  - Funció `validar_pid` reutilitzada en les opcions 4 i 5
  - Registre de cada canvi de prioritat i procés finalitzat en `~/gestion_procesos.log`

## Pràctica per a l'examen

Els blocs 15 (repàs de la sessió 7) i 16 (tipus examen UT1 + UT2) de [`Practica_examen_1r_trimestre`](../Practica_examen_1r_trimestre/) practiquen el que s'ha vist en esta unitat.

## Valoració personal

Esta pràctica l'he feta pas a pas, funció per funció, utilitzant una eina d'intel·ligència artificial com a tutor per a demanar pistes i explicacions quan m'he quedat encallat.

M'ha servit per a aplicar el que vaig aprendre de Bash a la UT1 (funcions, menús amb `case` i `while`, validacions amb expressions regulars) a la gestió de processos. El que més m'ha costat ha sigut passar bé els paràmetres a les funcions.
