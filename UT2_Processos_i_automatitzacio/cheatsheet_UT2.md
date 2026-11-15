# ⚙️ Chuleta de procesos — UT2

> Explicado desde cero, con lo que se usa en la práctica `gestion_procesos.sh`. Cada apartado tiene: **qué es**, **un ejemplo** y **qué sale por pantalla**.

---

## 1. ¿Qué es un proceso?

Un proceso es **un programa que se está ejecutando**. Cada proceso tiene:

| Dato | Qué es | Ejemplo |
|---|---|---|
| **PID** | Su número de identificación (DNI del proceso) | `4310` |
| **USER** | El usuario que lo ha lanzado | `jose` |
| **%CPU** | Cuánto procesador está gastando | `0.0` |
| **NI** | Su prioridad (*nice*) | `0` |
| **COMMAND** | El nombre del programa | `sleep` |

---

## 2. ⚠️ Los errores más típicos

| ❌ Así NO | ✅ Así SÍ | Por qué |
|---|---|---|
| `validar_pid pid` | `validar_pid "$pid"` | Sin `$` le pasas la **palabra** "pid", no el número |
| `head -n $n+1` | `head -n $(( n + 1 ))` | Las cuentas van dentro de `$(( ))` |
| `exit 1` dentro de una función del menú | `return 1` | `exit` **cierra todo el script**; `return` solo sale de la función |
| `[ $valor -lt 0 ]` con `valor=-5` y `re='^[0-9]+$'` | `re='^-?[0-9]+$'` | El `-` del negativo no es una cifra: hay que permitirlo con `-?` |
| Registrar **después** de matar el proceso | Guardar el comando **antes** | Muerto el proceso, `ps -p` ya no encuentra su nombre |
| `ps -p $pid` sin comprobar que es número | Primero `=~ ^[0-9]+$` | `ps -p abc` da error raro |

---

## 3. Ver procesos: `ps`

```bash
ps                 # los procesos de esta terminal
ps -e              # TODOS los procesos del sistema
ps -ef             # todos, con más información
ps -u jose         # los del usuario jose
ps -C sleep        # los que se llaman sleep
ps -p 4310         # solo el proceso con PID 4310
```

### Elegir columnas: `-o`

```bash
ps -C sleep -o pid,user,%cpu,comm
```
Sale:
```
    PID USER     %CPU COMMAND
   4310 jose      0.0 sleep
```
- `-o` = **o**utput: "enséñame solo estas columnas", separadas por comas y **sin espacios**.
- Columnas útiles: `pid`, `user`, `%cpu`, `%mem`, `ni` (prioridad), `comm` (nombre corto), `cmd` (comando completo con sus argumentos).

### Sin cabecera: el `=` del final ⭐

```bash
ps -p 4310 -o comm=
```
Sale: `sleep`

**Cómo leerlo:** `comm=` significa "columna `comm` con el título vacío". Así sale **solo el dato**, perfecto para guardarlo en una variable:
```bash
comando=$(ps -p "$pid" -o comm=)
echo "El proceso $pid es $comando"
```
Sale: `El proceso 4310 es sleep`

### Ordenar: `--sort`

```bash
ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 6
```
**Cómo leerlo:**
- `-eo` = `-e` (todos) + `-o` (estas columnas).
- `--sort=-%cpu` = ordena por CPU. El `-` delante quiere decir **de mayor a menor**.
- `| head -n 6` = quédate con las 6 primeras líneas: **1 de cabecera + 5 procesos**.

Por eso, para mostrar N procesos: `head -n $(( N + 1 ))`.

---

## 4. ¿Existe? (para los `if`)

Muchas órdenes "responden" **sí** (funciona) o **no** (da error). Se pueden meter directamente en un `if`:

| Pregunta | Orden |
|---|---|
| ¿Existe el usuario? | `id "$usuario"` |
| ¿Hay algún proceso con ese nombre? | `ps -C "$nombre"` |
| ¿Existe el proceso con ese PID? | `ps -p "$pid"` |

```bash
if ! id "$usuario" &>/dev/null; then
    echo "Error: el usuario $usuario no existe"
fi
```
**Cómo leerlo:**
- `!` = "si **no**...".
- `&>/dev/null` = tira a la basura **todo** lo que escriba la orden (lo normal y los errores). Solo nos interesa si dice sí o no, no lo que muestra.

---

## 5. Prioridad: `nice` y `renice`

El valor *nice* va de **-20 a 19**:

```
-20 ◄──────────── 0 ────────────► 19
 más prioridad   normal   menos prioridad
 (solo root)              (cualquiera)
```
"Ser *nice*" (amable) = dejar pasar a los demás. Cuanto **más alto**, **más amable**, y **menos** CPU se lleva.

```bash
nice -n 10 sleep 1000 &       # LANZAR un proceso con prioridad 10
renice -n 15 -p 4310          # CAMBIAR la prioridad de uno que ya existe
ps -p 4310 -o pid,ni,comm     # VER su prioridad (columna NI)
```

**Quién puede qué:**
- **Usuario normal**: solo de 0 a 19, y solo para **bajar** la prioridad (subir el número).
- **root**: de -20 a 19.

**¿Soy root?**
```bash
if [[ $EUID -eq 0 ]]; then
    minimo=-20
else
    minimo=0
fi
```
`$EUID` es el número del usuario que ejecuta el script. El de root siempre es **0**.

---

## 6. Señales: `kill`

`kill` **no** solo mata: envía una **señal** (un aviso) a un proceso.

| Señal | Número | Qué hace |
|---|---|---|
| `SIGTERM` | 15 | "Termina, por favor". El proceso puede cerrar bien (guardar, etc.). Es la de por defecto |
| `SIGKILL` | 9 | "Muere YA". No se puede ignorar. Último recurso |
| `SIGHUP` | 1 | "Vuelve a leer tu configuración" |

```bash
kill -SIGTERM 4310       # igual que: kill -15 4310   o   kill 4310
kill -SIGKILL 4310       # igual que: kill -9 4310
```

**La forma educada de terminar un proceso** ⭐ (opción 5 de la práctica):
```bash
kill -SIGTERM "$pid"             # 1. se lo pido por las buenas
sleep 3                          # 2. le doy 3 segundos
if ps -p "$pid" &>/dev/null; then
    kill -SIGKILL "$pid"         # 3. si sigue vivo, por las malas
    echo "Proceso $pid finalizado con SIGKILL"
else
    echo "Proceso $pid finalizado con SIGTERM"
fi
```

---

## 7. Procesos de prueba: segundo plano `&`

Para practicar sin romper nada, crea procesos que no hacen nada:

```bash
sleep 1000 &      # el & lo deja en segundo plano: la terminal sigue libre
echo $!           # $! = PID del último proceso lanzado con &
jobs              # lista los procesos en segundo plano de esta terminal
```
Sale:
```
[1] 4310
4310
[1]+  Running    sleep 1000 &
```

---

## 8. Guardar un registro (log)

```bash
echo "$(date '+%F %T') - SIGTERM - 4310 - sleep" >> ~/gestion_procesos.log
```
Añade al fichero: `2026-11-15 10:25:22 - SIGTERM - 4310 - sleep`

**Cómo leerlo:**
- `date '+%F %T'` = fecha y hora. `%F` es `año-mes-día` y `%T` es `hora:min:seg`. Es lo mismo que `date '+%Y-%m-%d %H:%M:%S'`.
- `>>` = **añade** al final del fichero (si no existe, lo crea). Con un solo `>` lo **borraría** antes de escribir.
- `~` = tu carpeta personal (`/home/jose`).

**Mejor en una función**, así no repites la línea:
```bash
registrar() {
    echo "$(date '+%F %T') - $1 - $2 - $3" >> ~/gestion_procesos.log
}

registrar "renice 10" "$pid" "$comando"
```

---

## 9. Las piezas de la práctica

### Validar un PID ⭐

```bash
validar_pid() {
    re='^[0-9]+$'
    if [[ ! $1 =~ $re ]]; then     # ¿no es un número?
        return 1                   #   → no vale
    fi
    if ! ps -p "$1" &>/dev/null; then   # ¿no existe el proceso?
        return 1                   #   → no vale
    fi
    return 0                       # todo bien → vale
}

if ! validar_pid "$pid"; then
    echo "Error: el PID $pid no es válido o no existe"
fi
```
- `return 0` = **sí**, `return 1` = **no**. Así la función se puede usar en un `if`.

### Número que puede ser negativo

```bash
re='^-?[0-9]+$'
```
**Cómo leerlo:** `^` empieza → `-?` puede haber un `-` o no → `[0-9]+` una o más cifras → `$` y se acaba.
Cumplen: `5`, `-5`, `19`. No cumplen: `abc`, `5a`, `--5`.

### Valor por defecto de un parámetro

```bash
top_cpu() {
    if [ -z "$1" ]; then     # ¿no me han pasado nada?
        numero=5
    else
        numero=$1
    fi
    ...
}
```

### Menú que se repite

```bash
opcion=0
while [ "$opcion" != 6 ]; do
    echo "1) Listar  ...  6) Salir"
    read -p "Opción: " opcion
    case $opcion in
        1) listar_usuario ;;
        2) buscar_proceso ;;
        6) echo "Adiós" ;;
        *) echo "Opción no válida" ;;
    esac
done
```
- Las **funciones** se escriben **antes** del menú.
- Cada opción termina con `;;`. El `*)` recoge todo lo que no sea una opción válida.

---

## 10. Cómo probar el script

1. Abre procesos de prueba: `sleep 1000 &` (dos o tres veces).
2. Míralos: `ps -C sleep -o pid,ni,comm`.
3. Ejecuta el script y usa esos PID.
4. Prueba también los errores: un PID que no existe (`99999`), letras (`abc`), un valor nice de `-5` sin ser root, `25`...
5. Mira el registro: `cat ~/gestion_procesos.log`.
6. Para probar los valores negativos como root: `sudo ./gestion_procesos.sh`.
7. Para ver paso a paso qué hace: `bash -x gestion_procesos.sh`.
