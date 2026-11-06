# 🐚 Chuleta de Bash — UT1

> Explicado desde cero. Cada apartado tiene: **qué es**, **un ejemplo** y **qué sale por pantalla**.

---

## 1. ¿Qué es un script?

Un script es un **fichero de texto con órdenes** que se ejecutan una detrás de otra, como si las escribieras tú en la terminal.

```bash
#!/bin/bash
echo "Hola mundo"
```
- La **primera línea** (`#!/bin/bash`) siempre es igual. Dice "ejecuta esto con Bash".
- `echo` **muestra un texto** por pantalla.
- Las líneas que empiezan por `#` son **comentarios**: notas para ti, Bash las ignora.

**Cómo ejecutarlo:**
```bash
chmod +x hola.sh     # 1. darle permiso (solo la primera vez)
./hola.sh            # 2. ejecutarlo
```
Sale: `Hola mundo`

---

## 2. ⚠️ Los errores más típicos

| ❌ Así NO | ✅ Así SÍ | Por qué |
|---|---|---|
| `nombre = Jose` | `nombre=Jose` | Para guardar, **sin espacios** en el `=` |
| `echo nombre` | `echo $nombre` | Para leer una variable, **con `$`** |
| `[-z $1]` | `[ -z $1 ]` | Dentro de los `[ ]` **siempre espacios** |
| `if [ ... ]` y ya | `if [ ... ]; then` | Después de la condición va **`then`** |
| `[[ $x =~ "$re" ]]` | `[[ $x =~ $re ]]` | Con comillas, el patrón **deja de funcionar** como patrón |
| `re='[0-9]+'` | `re='^[0-9]+$'` | Sin `^` y `$`, `12a` también "cumple" (basta con que tenga una cifra) |

---

## 3. Variables (cajas para guardar cosas)

Una variable es una **caja con nombre** donde guardas un valor.

```bash
nombre="Jose"              # GUARDAR: sin $ y sin espacios
echo "Hola $nombre"        # LEER: con $
```
Sale: `Hola Jose`

**Guardar el resultado de una orden** → `$( orden )`
```bash
hoy=$(date)
echo "Hoy es $hoy"
```

**Guardar el resultado de una cuenta** → `$(( cuenta ))`
```bash
suma=$(( 3 + 4 ))
echo $suma
```
Sale: `7`

---

## 4. Argumentos (datos que pasas al ejecutar)

Puedes pasarle datos al script al ejecutarlo. Bash los guarda en `$1`, `$2`...

```bash
./saluda.sh Jose Maria
#           $1   $2
```
```bash
#!/bin/bash
echo "Hola $1 y $2"
```
Sale: `Hola Jose y Maria`

| Variable | Qué contiene |
|---|---|
| `$1`, `$2`... | el 1.º, 2.º... argumento |
| `$#` | **cuántos** argumentos me han pasado |
| `$0` | el nombre del script |
| `$?` | si la última orden ha ido bien (`0`) o mal (otro número) |

**Si no te pasan argumentos, avisar y salir:**
```bash
if [ $# -eq 0 ]; then
    echo "Uso: $0 <puerto>"
    exit 1
fi
```
`exit 1` = **termina el script** aquí. El número dice cómo ha ido: `0` = todo bien, cualquier otro (normalmente `1`) = ha habido un error.

**Si no te pasan argumentos, usar uno por defecto:**
```bash
if [ $# -eq 0 ]; then
    fichero=/etc/login.defs
else
    fichero=$1
fi
```

**Dos argumentos opcionales**, cada uno con su valor por defecto:
```bash
if [ $# -ge 1 ]; then       # ¿me han pasado AL MENOS 1?
    destino=$1
else
    destino=/var/backups
fi

if [ $# -ge 2 ]; then       # ¿me han pasado AL MENOS 2?
    maximo=$2
else
    maximo=7
fi
```
| Ejecutas | `destino` | `maximo` |
|---|---|---|
| `./backup.sh` | `/var/backups` | `7` |
| `./backup.sh ~/copias` | `~/copias` | `7` |
| `./backup.sh ~/copias 2` | `~/copias` | `2` |

---

## 5. Preguntar al usuario

```bash
read -p "¿Cómo te llamas? " nombre
echo "Hola $nombre"
```
El script **se espera** a que escribas algo y lo guarda en `nombre`. La opción `-p` sirve para mostrar la pregunta en la misma línea.

> Si el enunciado dice "**como argumento**", usa `$1`, **no** `read`.

---

## 6. Cuentas

```bash
echo $(( 10 + 3 ))   # 13  suma
echo $(( 10 - 3 ))   # 7   resta
echo $(( 10 * 3 ))   # 30  multiplicación
echo $(( 10 / 3 ))   # 3   división (¡SIN decimales!)
echo $(( 10 % 3 ))   # 1   lo que sobra de la división
```

**Sumar 1 a una variable** (para contar):
```bash
i=$(( i + 1 ))
```

**Porcentajes:** multiplica **primero**, divide **después**.
```bash
echo $(( 35 * 100 / 100 ))   # 35 ✅
echo $(( 35 / 100 * 100 ))   # 0  ❌ (35/100 da 0 sin decimales)
```

**Si necesitas decimales**, usa `bc`:
```bash
echo "scale=2; 10 / 3" | bc
```
Sale: `3.33` (`scale=2` = 2 decimales)

---

## 7. Tomar decisiones: `if`

"**Si** pasa esto, **haz** eso. **Si no**, haz esto otro."

```bash
if [ $edad -ge 18 ]; then
    echo "Mayor de edad"
else
    echo "Menor de edad"
fi
```
- `if` = si
- `then` = entonces
- `else` = si no
- `fi` = final (es `if` al revés)

**Con más de dos opciones** → `elif` ("si no, pero si..."):
```bash
if [ $nota -ge 9 ]; then
    echo "Sobresaliente"
elif [ $nota -ge 5 ]; then
    echo "Aprobado"
else
    echo "Suspenso"
fi
```
Va mirando **de arriba abajo** y hace **solo la primera** que se cumple.

### Comparar números

| Escribe | Significa | Truco para recordarlo |
|---|---|---|
| `-eq` | igual a | **eq**ual |
| `-ne` | distinto de | **n**ot **e**qual |
| `-gt` | mayor que | **g**reater **t**han |
| `-ge` | mayor o igual que | **g**reater or **e**qual |
| `-lt` | menor que | **l**ess **t**han |
| `-le` | menor o igual que | **l**ess or **e**qual |

### Comparar texto

| Escribe | Significa |
|---|---|
| `[ "$a" = "$b" ]` | son iguales |
| `[ "$a" != "$b" ]` | son distintos |
| `[ -z "$a" ]` | está **vacío** |
| `[ -n "$a" ]` | **no** está vacío |

### Preguntar por ficheros y carpetas

| Escribe | Pregunta |
|---|---|
| `[ -e "$x" ]` | ¿existe? |
| `[ -f "$x" ]` | ¿es un **fichero**? |
| `[ -d "$x" ]` | ¿es una **carpeta**? |

### Dos condiciones a la vez

```bash
if [[ $n -ge 1 && $n -le 10 ]]; then echo "Entre 1 y 10"; fi
```
- `&&` = **y** (se tienen que cumplir las dos)
- `||` = **o** (basta con una)
- `!` = **no** (al revés)

### ¿`[ ]` o `[[ ]]`?

Los dos sirven para hacer preguntas en un `if`. `[[ ]]` (doble) es la versión **mejorada**.

**Regla fácil:**
- `[ ]` → para preguntas sencillas: `[ $n -gt 5 ]`, `[ -f "$x" ]`.
- `[[ ]]` → **obligatorio** cuando uses:
  - `=~` (expresiones regulares)
  - `&&` o `||` **dentro** de la pregunta

Si dudas, usa `[[ ]]`: funciona en todos los casos.

### Comprobar si una orden funciona

El `if` también puede mirar si una orden ha ido bien:
```bash
if id jose &>/dev/null; then
    echo "El usuario jose existe"
fi
```
`&>/dev/null` = "no me muestres nada, solo quiero saber si ha funcionado".

---

## 8. Muchos casos: `case`

Cuando una variable puede tener **muchos valores** distintos. Más limpio que muchos `elif`.

```bash
case $opcion in
    1) echo "Has elegido uno" ;;
    2) echo "Has elegido dos" ;;
    *) echo "Opción no válida" ;;
esac
```
- `*)` = **cualquier otra cosa**
- Cada opción acaba en `;;`
- `esac` = final (es `case` al revés)

---

## 9. Repetir cosas: bucles

### `for`: para cada elemento de una lista
```bash
for fruta in manzana pera naranja; do
    echo "Me gusta la $fruta"
done
```
Sale:
```
Me gusta la manzana
Me gusta la pera
Me gusta la naranja
```
En cada vuelta, `fruta` coge el **siguiente** valor.

### `for` con ficheros ⭐
`*` significa "**todo lo que hay** en la carpeta":
```bash
for fichero in ~/Documentos/*; do
    echo "$fichero"
done
```
Muestra cada fichero de la carpeta, uno por línea.

### `for` para contar
```bash
for (( i=1; i<=5; i++ )); do
    echo "Vuelta $i"
done
```
Sale: `Vuelta 1`, `Vuelta 2`... hasta `Vuelta 5`.
(`i++` = súmale 1 a `i` en cada vuelta.)

### `while`: mientras se cumpla
```bash
i=1
while [ $i -le 3 ]; do
    echo $i
    i=$(( i + 1 ))
done
```
Sale: `1 2 3`
> ⚠️ Si olvidas el `i=$(( i + 1 ))`, no para nunca (bucle infinito). Para pararlo: **Ctrl + C**.

### `until`: hasta que se cumpla
Es lo contrario de `while`: repite **hasta que** la condición sea cierta.
```bash
until [ "$respuesta" = "si" ]; do
    read -p "¿Quieres salir? " respuesta
done
```

### Leer un fichero línea a línea ⭐
```bash
while read -r linea; do
    echo "Línea: $linea"
done < /etc/passwd
```
En cada vuelta, `linea` es **una línea entera** del fichero.

**¿Qué hace el `<` del final?** "**Mete** este fichero dentro del bucle". Es como decirle: "lee de aquí". Sin él, `read` esperaría a que escribieras tú con el teclado.

```
done < /etc/passwd
     ↑
     "coge las líneas de este fichero"
```

**Quedarse con lo de antes del primer `:`**
```bash
linea="root:x:0:0:root:/root:/bin/bash"
echo ${linea%%:*}
```
Sale: `root`

**Cómo se lee `${linea%%:*}`:**

| Trozo | Significa |
|---|---|
| `${linea ... }` | coge lo que hay en la variable `linea`... |
| `%%` | ...y **borra por el final**... |
| `:*` | ...desde **los dos puntos** (`:`) **hasta el final** (`*` = todo lo que venga) |

```
root:x:0:0:root:/root:/bin/bash
    └──────── se borra ────────┘
Queda: root
```
Truco: `%` borra por **detrás**.

### Leer y separar los campos a la vez: `IFS` ⭐
Si necesitas **varios trozos** de cada línea, es mejor que `${linea%%:*}`:
```bash
while IFS=':' read -r usuario x uid gid desc home shell; do
    echo "$usuario tiene UID $uid y shell $shell"
done < /etc/passwd
```
`IFS=':'` = "corta la línea por cada `:`". `read` guarda **cada trozo en una variable, por orden**:
```
alumno : x : 1000 : 1000 : Alumno : /home/alumno : /bin/bash
   ↓     ↓    ↓      ↓       ↓          ↓             ↓
usuario  x   uid    gid    desc       home          shell
```
- Hay que poner variables para **todos** los trozos hasta el último que quieras, aunque no los uses (`x`, `gid`, `desc`). Si no, se descoloca todo.
- Con otro separador funciona igual: `IFS=','` para un fichero CSV.
- `-r` hace que `read` lea las `\` tal cual. Ponlo siempre.

### Salir o saltar
| Escribe | Qué hace |
|---|---|
| `break` | **sale** del bucle ya |
| `continue` | **salta** a la vuelta siguiente |

**Ejemplo:** preguntar hasta que la respuesta sea buena
```bash
while true; do                     # repite para siempre...
    read -p "Número entre 1 y 10: " n
    if [[ $n -ge 1 && $n -le 10 ]]; then
        break                      # ...hasta que es correcto
    fi
    echo "No válido, vuelve a probar"
done
```

---

## 10. Funciones (órdenes hechas por ti)

Una función es un **trocito de código con nombre** que puedes usar tantas veces como quieras.

```bash
saludar() {              # 1. la CREAS
    echo "Hola $1"
}

saludar Jose             # 2. la USAS
saludar Maria
```
Sale:
```
Hola Jose
Hola Maria
```
- Primero **se crea**, después **se usa**.
- Para usarla, **sin paréntesis**: `saludar Jose`.
- Dentro de la función, `$1`, `$2`... son **lo que le pasas a la función**.

**Guardar lo que devuelve una función:**
```bash
doble() {
    echo $(( $1 * 2 ))
}

resultado=$(doble 5)
echo $resultado
```
Sale: `10`

**Función + bucle** (muy habitual):
```bash
for nombre in Jose Maria Pepe; do
    saludar $nombre
done
```

**Función para los errores** ⭐ (muestra el mensaje y **termina**):
```bash
error() {
    echo "Error: $1"
    echo "Uso: $0 alta | baja identificador"
    exit 1
}

if [ $# -eq 0 ]; then
    error "falta la acción"
fi
```
Así no repites las tres líneas en cada error: solo escribes `error "mensaje"`.

**Función que responde sí o no** (para usarla en un `if`):
```bash
existe() {
    grep -q "^$1:" /etc/passwd
}

if existe "root"; then
    echo "root existe"
fi
if ! existe "pepito"; then
    echo "pepito no existe"
fi
```
La función "responde" lo mismo que su **última orden**: si `grep -q` encuentra algo, es **sí**; si no, es **no**.

---

## 11. Listas (arrays)

Una variable que guarda **varios valores**.

```bash
colores=(rojo verde azul)
echo ${colores[0]}       # rojo  (¡se empieza a contar por 0!)
echo ${colores[1]}       # verde
echo ${colores[@]}       # rojo verde azul  (todos)
echo ${#colores[@]}      # 3  (cuántos hay)
```

---

## 12. Expresiones regulares (patrones de texto)

Sirven para preguntar si un texto **tiene una forma concreta**: si son solo números, si acaba en `.conf`, si empieza por minúscula...

```bash
re='^[0-9][0-9]*$'
if [[ $dato =~ $re ]]; then
    echo "Es un número"
else
    echo "No es un número"
fi
```
- El patrón se guarda en una **variable** (`re`).
- Se compara con `=~` dentro de `[[ ]]`.
- Después de `=~`, la variable va **sin comillas**.

**Si NO cumple** → pon `!` delante:
```bash
if [[ ! $dato =~ $re ]]; then
    echo "Error: $dato no es un número"
    exit 1
fi
```

### Los símbolos

| Símbolo | Significa | Ejemplo | Cumple | No cumple |
|---|---|---|---|---|
| `^` | **empieza** por | `^#` | `# comentario` | `hola #` |
| `$` | **acaba** en | `bash$` | `/bin/bash` | `bash.txt` |
| `.` | **cualquier** carácter | `^h.la$` | `hola`, `hxla` | `hla` |
| `\.` | un **punto** de verdad | `\.conf$` | `a.conf` | `aXconf` |
| `*` | lo de antes, **0 o más** veces | `^[0-9][0-9]*$` | `5`, `123` | `12a` |
| `[ ]` | **uno** de estos caracteres | `[aeiou]` | `a`, `e`... | `b` |
| `[^ ]` | un carácter que **NO** sea de estos | `^[^#]` | `MAIL_DIR` | `# nota` |

Rangos dentro de `[ ]`: `[0-9]` = una cifra, `[a-z]` = una minúscula, `[A-Za-z]` = cualquier letra.

### Símbolos extendidos

| Símbolo | Significa | Ejemplo | Cumple | No cumple |
|---|---|---|---|---|
| `+` | lo de antes, **1 o más** veces | `^[0-9]+$` | `5`, `123` | *(vacío)*, `12a` |
| `{n}` | lo de antes, **exactamente n** veces | `^[0-9]{4}$` | `2026` | `26`, `20261` |
| `( )` | **agrupa** un trozo (para repetirlo entero) | `^(ab)+$` | `ab`, `abab` | `aba` |

> `*` = **0** o más (puede no haber ninguno). `+` = **1** o más (tiene que haber al menos uno).
> Por eso `^[0-9][0-9]*$` y `^[0-9]+$` comprueban lo mismo: "solo cifras".

### ⚠️ Cuidado: el `^` tiene DOS significados

El mismo símbolo significa cosas distintas según **dónde** esté:

| Dónde está | Significa | Ejemplo | Se lee |
|---|---|---|---|
| **Fuera** de `[ ]` (al principio) | **empieza por** | `^#` | "empieza por `#`" |
| **Dentro** de `[ ]` (justo después de `[`) | **NO** | `[^#]` | "un carácter que **no** es `#`" |

Cuando salen **los dos juntos**, léelos uno a uno, de izquierda a derecha:

```
^[^#]
│ └─┴── un carácter que NO es #
└────── empieza por...
```
= "**empieza por** un carácter que **no es** `#`".

| Línea | ¿Cumple `^[^#]`? | Por qué |
|---|---|---|
| `MAIL_DIR /var/mail` | ✅ sí | empieza por `M`, que no es `#` |
| `# comentario` | ❌ no | empieza por `#` |
| *(línea vacía)* | ❌ no | no tiene ningún carácter para empezar |

Por eso `^[^#]` sirve para quedarse con las **líneas útiles**: quita los comentarios y las líneas vacías a la vez.

> Para comprobar el texto **entero**, pon `^` al principio y `$` al final. Sin ellos, basta con que el patrón aparezca **en algún sitio**.

### Patrones típicos

| Patrón | Qué comprueba |
|---|---|
| `^[0-9][0-9]*$` | solo números |
| `^[a-z][a-z0-9]*$` | empieza por minúscula y luego solo minúsculas o cifras |
| `\.conf$` | acaba en `.conf` |
| `~$` | acaba en `~` |
| `^#` | es un comentario |
| `^[^#]` | línea útil: no está vacía y no es un comentario |
| `^[0-9]+$` | solo números (versión extendida) |
| `^[A-Za-z]+$` | una sola palabra, solo letras |
| `^[A-Za-z]+ [A-Za-z]+$` | dos palabras separadas por un espacio |
| `^(/[a-z]+)+$` | ruta absoluta: `/bin/bash`, `/usr/bin/zsh` |
| `^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$` | nombre tipo `etc-20261014-211317.tar.gz` |
| `^alu[a-z]{5}$` | `alu` + exactamente 5 minúsculas: `alulufem` |

**Cómo se lee `^(/[a-z]+)+$`:**
```
^  ( /[a-z]+ )  +  $
│    │  │       │  └─ final
│    │  │       └──── el grupo, 1 o más veces
│    │  └──────────── una o más minúsculas
│    └─────────────── una barra
└──────────────────── principio
```
= "uno o más trozos del tipo `/palabra`". `/bin/bash` ✅ (`/bin` + `/bash`) · `bash` ❌ (no empieza por `/`).

---

## 13. Órdenes útiles

| Orden | Qué hace | Ejemplo → Resultado |
|---|---|---|
| `echo` | muestra un texto | `echo hola` → `hola` |
| `basename` | quita la ruta, deja el nombre | `basename /home/jose/a.txt` → `a.txt` |
| `grep` | busca líneas que tienen una palabra | `grep ERROR fichero.log` |
| `grep -c` | **cuenta** cuántas líneas la tienen | `grep -c ERROR fichero.log` → `2` |
| `wc -l` | cuenta líneas | `wc -l fichero.txt` → `10` |
| `sort` | ordena | `sort nombres.txt` |
| `find` | busca ficheros | `find ~ -name "*.txt"` |
| `id` | dice si un usuario existe | `id root` |
| `grep -q` | busca **sin mostrar nada**, solo para el `if` | `if grep -q "^root:" /etc/passwd; then` |
| `cut -d: -f1` | corta por `:` y se queda con el **1.er** trozo | `cut -d: -f1 /etc/passwd` → nombres de usuarios |
| `cut -d' ' -f2` | corta por espacios y se queda con la **2.ª** palabra | `echo "Ferrer Mas" \| cut -d' ' -f2` → `Mas` |
| `cut -c1-2` | se queda con los **caracteres** 1 a 2 | `echo "Lucia" \| cut -c1-2` → `Lu` |
| `tr 'A-Z' 'a-z'` | pasa a **minúsculas** | `echo "LuFeM" \| tr 'A-Z' 'a-z'` → `lufem` |
| `date` | fecha y hora | `date` |
| `date +%Y%m%d-%H%M%S` | fecha para nombres de fichero | → `20261014-211317` |
| `date +%H:%M:%S` | solo la hora | → `21:13:18` |
| `tar -czf copia.tar.gz -C / etc` | comprime la carpeta `/etc` | `c` = crear, `z` = comprimir, `f` = nombre del fichero |
| `logger -t etiqueta "mensaje"` | guarda un mensaje en el **registro del sistema** | `logger -t aso-backup "Copia creada"` |
| `journalctl -t etiqueta` | muestra los mensajes con esa etiqueta | `journalctl -t aso-backup` |

### `sed`: buscar y cambiar texto
```bash
sed 's/hola/adios/' fichero.txt      # cambia el PRIMER "hola" de cada línea
sed 's/hola/adios/g' fichero.txt     # cambia TODOS (g = global)
sed '/^#/d' fichero.txt              # borra las líneas que empiezan por #
```
- `s/viejo/nuevo/` = **s**ustituye.
- `/patrón/d` = **d**elete: borra las líneas que cumplen el patrón (usa las mismas regex).
- `sed` **muestra** el resultado, pero **no cambia** el fichero.

```bash
echo "hola mundo hola" | sed 's/hola/adios/g'
```
Sale: `adios mundo adios`

### La tubería `|`
Pasa el resultado de una orden a la siguiente:
```bash
ls | wc -l
```
= "lista los ficheros **y después** cuenta cuántas líneas salen" → cuántos ficheros hay.

---

## 14. Cuando no funciona

- Ejecútalo así para ver **paso a paso** qué hace:
  ```bash
  bash -x script.sh
  ```
- Pon un `echo` para ver qué vale una variable:
  ```bash
  echo "La variable vale: $nombre"
  ```
- Lee el error: normalmente te dice **la línea** donde está el problema.
- Revisa la tabla de **errores típicos** (apartado 2).
- Para las expresiones regulares, pruébalas sueltas en la terminal antes de meterlas en el script:
  ```bash
  re='^[0-9]+$'
  if [[ 12a =~ $re ]]; then echo "cumple"; else echo "no cumple"; fi
  ```
  Sale: `no cumple`
- Si el editor subraya algo (ShellCheck), léelo: a veces es un error y a veces solo un consejo (por ejemplo, "variable no usada" en `x`, `gid`, `desc`).