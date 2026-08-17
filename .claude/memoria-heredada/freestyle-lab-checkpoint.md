---
name: freestyle-lab-checkpoint
description: "Estado de Freestyle Lab: 10 técnicas, 3 modos (normal/bestia/principiante), diseño móvil+escritorio, barra de cuenta, y 1 de 3 clips de video promo hechos (30-jul-2026)"
metadata: 
  node_type: memory
  type: project
  originSessionId: f2ad7aca-112e-4514-818a-a7452d53c30e
  modified: 2026-08-10T23:56:11.804Z
---

## Freestyle Lab — estado al 27 de julio de 2026 (ruta actualizada 4-ago-2026)

**Archivo de trabajo ACTUAL:** `C:\Users\asfura\PROYECTO FREESTYLE\index.html` (un solo archivo, HTML+CSS+JS vanilla). Copia exacta con historial git de `C:\Users\asfura\Desktop\freestyle-lab-html`, que queda como respaldo sin tocar — ver [[freestyle-lab-html-vanilla]]. Todas las rutas de `marca/`, `videos/` y `versiones/` mencionadas más abajo con prefijo `Desktop\freestyle-lab-html\` deben leerse hoy como `C:\Users\asfura\PROYECTO FREESTYLE\`.
**Original del usuario:** `C:\Users\asfura\Downloads\freestyle-lab-app_2.html`

Se trabaja en HTML vanilla, no React — ver [[freestyle-lab-html-vanilla]].

### Técnicas implementadas (10)
1. **Multisílabas & Palabras** (30s / 45s) — `analyzeMulti()`, `analyzePalabras()`, 4 niveles
2. **Palabra Camaleón** (40s) — `countCamaleon()`, modos cantidad/variedad, detecta sola/dentro/entre
3. **Doble Tempo** (60s) — `analyzeTempo()`, beat Web Audio a 80/90/100 BPM
4. **Cadena de Rimas** (40s) — `analyzeCadena()`, mide la cadena consecutiva más larga sin romperse
5. Aliteración · 6. Trabalenguas · 7. Encadenado Silábico · 8. Sin Repetir · 9. Temática Obligada · 10. Sin Muletillas

### Cómo funciona Cadena de Rimas
Dos palabras encadenan si comparten 2+ sílabas finales (perfecta) o 2+ vocales finales (asonante). Una palabra que no rima corta la cadena. El puntaje es la longitud de la cadena más larga.

### Logo oficial del sitio
Lámina de referencia: `C:\Users\asfura\Desktop\freestyle-lab-html\marca\freestyle-lab-logos.png` (1366×1639). Trae wordmark apilado, lockup horizontal con bajada e isotipo "FL", en dos variantes de color.

**Paleta de la lámina** (extraída del PNG, en `:root`): `--brand-pink:#EC4FA0`, `--brand-red:#EC3013`, `--brand-purple:#8B5CF6`.

**Implementado:** wordmark "FREE**STYLE** LAB" en `.home-brand`, neogrotesca `"Helvetica Neue",Helvetica,Arial` peso 700, mayúsculas, tracking `-.005em`; "STYLE" va en `<span class="st">` con `--brand-pink`. Sobre fondo oscuro, "FREE" y "LAB" van en `--paper` (en la lámina son negros, pensados para fondo claro). **El punto rosa que había antes se eliminó** — la lámina no lo tiene.

**Historia:** el 27-jul hubo un logo previo en tipografía Aqua Grotesque incrustada en base64; el usuario lo reemplazó por esta lámina. La fuente quedó guardada en `marca/aqua-grotesque.ttf` y su base64 se quitó del HTML (−47,6 KB, volvió a ~100 KB).

**Pendiente:** el rosa del logo (`#EC4FA0`) NO es el de la interfaz (`--stage:#FF2E63`, botones/tarjetas/glows). Se dejó así a propósito, sin tocar la paleta de la app; falta decidir si se unifica.

### Portada de bienvenida (`#splash`)
Pantalla completa sobre la app que **espera al botón "Entrar"** (no se auto-cierra). La marca "Freestyle Lab" rota entre 9 tipografías cada 200 ms; cada fuente tiene un factor `--sp-scale` en el array `FACES` porque cada una ocupa distinto ancho, y el contenedor `.sp-brand-wrap` tiene `min-height` fija para que no salte el layout. Las fuentes se precargan con `document.fonts.load()` — `document.fonts.ready` NO sirve, porque no descarga las que ningún elemento usa todavía. Al pulsar Entrar el ciclo se detiene y la marca **aterriza en el wordmark oficial** (Helvetica Bold, escala .80, tracking `-.005em`, clase `.locked` con golpe de escala y glow; ahí "STYLE" pasa de heredar el degradado a `--brand-pink`); el fundido empieza 560 ms después, para que dé tiempo a ver el remate. El ciclo corre **siempre**, también con "reducir movimiento" activo: al principio estaba condicionado a `prefers-reduced-motion` y el usuario no veía nada. Solo las animaciones de entrada y el glow respetan ese ajuste.

### Titular de la portada (`.hero-title`)
Dice **"DONDE TU TALENTO / EXPLOTA"**, con "explota" en `.accent` rosa (la convención del diseño es que el remate de la frase va en color). Antes decía "Donde el caos se vuelve flow". Como la frase nueva es más larga, hubo que bajar el escalado a `clamp(34px,10.6vw,66px)`: con el `12vw` original se desbordaba y partía en 3 líneas a 320 px de ancho. Regla útil para medir: en Anton el ancho es ≈ **6,94 px por cada px de tamaño de fuente**.

El glow del titular se bajó a la mitad a pedido del usuario: halo rosa `.38→.22`, brillo blanco `.14→.08`; en el acento `.95→.50` y `.55→.26`.

### Cómo verificar cambios (aprendido a la mala)
El panel de navegador interno queda **oculto** cuando el usuario mira su propio Chrome, y entonces `document.hidden` es `true`: Chrome estrangula los timers a ~1/segundo, los screenshots fallan y los clics sintéticos solo enfocan sin disparar el `click`. Eso produce lecturas que parecen bugs y no lo son. Trucos que sí funcionan ahí: `elemento.click()` en vez de clic por coordenadas, y crear un `setInterval` de referencia para distinguir "no dispara" de "va lento". Para abrir en el Chrome del usuario: `Start-Process chrome.exe` con la URL `file://` y un `?v=<hora>` colgando, porque si no Chrome sirve la copia cacheada.

Ojo también al medir anchos: `.home-brand` es flex, así que su `getBoundingClientRect()` siempre da el ancho del contenedor. Para el ancho real del texto hay que usar un `Range` sobre el contenido.

### Pasada gráfica (27-jul-2026)
**Jerarquía de brillo.** Había 66 sombras y 15+ selectores con el mismo halo rosa: todo brillaba, nada resaltaba. Ahora hay 3 niveles: halo fuerte solo para la acción principal (`.rec-btn`, `.btn-primary`, `.sp-enter`), halo sutil para estado (`.tab/.level/.bpm.active`, `.beat-dot.on`), y **cero** para contenido estático (tarjetas, chips, stats, `.tbar-name`, títulos). El `.score-num` conserva el suyo: es la recompensa.

**Color por técnica.** Cada tarjeta define `--tc` (10 tonos distintos) que pinta barra izquierda, etiqueta, acento del título y borde al pasar el mouse. La tinta de fondo usa `color-mix()` con fallback `background:var(--surface)` en la línea previa.

**Insignia de duración** en cada tarjeta (`.tcard-time`): 30-45s, 40s, 60s, 40s, 30s, 25s, 40s, 45s, 40s, 45s.

**Fondo en capas** (el usuario lo encontraba "demasiado simple"): sobre los 4 degradados radiales del `body` van (1) `.bg` — aurora de 4 manchas de color en `vmax` que derivan con animaciones de 54-78 s, solo `transform` para que sea barato; (2) `body::before` — retícula de estudio de 46 px difuminada hacia los bordes con `mask-image`; (3) `.bg::after` — viñeteado; (4) `body::after` — grano (ruido SVG `feTurbulence`, opacidad .05, `z-index:2`).

Clave del orden: `.bg` va **antes** de las cascadas en el DOM (ambos `z-index:0`), para que las columnas de palabras se pinten encima. El viñeteado queda detrás de `.app` (`z-index:1`), así oscurece el fondo sin ensuciar el texto. La aurora también está exceptuada del corte de "reducir movimiento".

### Cabeza cantando (`.singer`)
Origen: `Cabeza Cantando.html` del Escritorio, una página "bundled". **No era un GIF**: SVG de trazo + 7 `@keyframes` CSS, ~8 KB, con colores por variable. Componente limpio y aislado en `marca/cabeza-cantando.html`.

Aparece en **dos variantes** que comparten el mismo SVG (el del entrenador es el original; el del menú se **clona por JS** al cargar, así hay un solo SVG en el archivo):
- `.singer.in-clock` — detrás del reloj, `opacity:0` en reposo y `.5` con `body.recording`; animaciones `paused` → `running` al grabar. Escala `.32` en un contenedor de 900×700. `pointer-events:none` para no tapar el botón de grabar.
- `.singer.in-hero` — **preside el menú**, entre el texto de la portada y las tarjetas. **Dos cabezas enfrentadas cantándose, con una llama de fuego en medio.** Flex centrado: `.lado.izq` + `.llama` + `.lado.der`, escala por variable `--cs` (.32; .24 en móvil), bloque de 260 px (210 en móvil), `mask-image` que difumina ambos bordes. Corre **siempre**. Las palabras de los dos lados convergen sobre la llama.

**La trampa del espejado:** la cabeza derecha lleva `scaleX(-1)`, lo que también invierte el TEXTO de las palabras. Se resuelve envolviendo cada palabra en un `<i>` (lo hace el JS al clonar) y contra-espejándolo con `.lado.der .om-palabras i{transform:scaleX(-1)}`. La cabeza espejada se ancla con `left:100%` y `transform-origin:0 0`, porque con origen en el borde derecho el contenido se dibujaría fuera de la caja.

**La llama:** SVG de 3 capas (`--brand-red` exterior, `--stage` media, `--gold` núcleo) con tres animaciones de duración distinta y no múltiplo entre sí (1,15s / 0,83s / 0,61s) para que el titileo no se sienta cíclico. Palabras cambiadas al vocabulario de freestyle (flow, rima, barra, punchline, tempo…).

**Sincronía con BPM:** `--om-cycle = 240/bpm` (un ciclo = 4 tiempos), vía `syncSinger()`. En Doble Tempo sigue a 80/90/100 BPM (3s / 2,667s / 2,4s); en el resto vuelve a 2,4s. `restartSinger()` reinicia la animación al empezar a grabar para que arranque en fase con el beat — mismo tempo, no fase bloqueada.

**Dos trampas resueltas, no repetir:** la regla global `*{animation:none!important}` del media query de "reducir movimiento" (a) mataba toda la animación y (b) pisaba los `animation-delay` en línea, con lo que las 12 palabras salían a la vez. Por eso el cableado de animaciones va **después** del media query, con `!important`, usando **longhands** (el shorthand `animation:` resetea el delay) y con los desfases en reglas `:nth-child` proporcionales a `--om-cycle`.

### Bug del reconocimiento de voz (arreglado 27-jul-2026) — NO REINTRODUCIR
Doble Tempo marcaba **18200 palabras/min y 580 sílabas/seg**. No era el cálculo: el texto llegaba multiplicado. El manejador `recog.onresult` acumulaba con `finalText += t` recorriendo desde `e.resultIndex`. **Chrome en Android reenvía la lista completa de resultados con `resultIndex` en 0**, así que volvía a sumar todo lo ya dicho en cada evento: crecimiento cuadrático, N(N+1)/2 frases en vez de N. Medido: una ronda real de 130 palabras se reportaba como 4290 (33x).

**La solución es reconstruir, no acumular:** en cada evento se recorre `e.results` **desde 0** y se rearma el texto entero (idempotente, da igual cuántas veces reenvíe lo mismo). Como al reiniciar la sesión la lista vuelve a estar vacía, `recog.onend` consolida lo dicho en la variable `baseFinal`, y `finalText = baseFinal + <reconstruido>`. `baseFinal` se resetea en `newItem()`.

Se verificó inyectando el código real del archivo en un entorno aislado y simulando eventos al estilo Android, con y sin reinicio de sesión.

**SEGUNDA PARTE del mismo bug (28-jul).** Reconstruir no bastaba: Android además entrega los tramos de forma **acumulativa** —cada resultado repite todo lo anterior y añade un poco, y los marca como definitivos— así que concatenarlos seguía duplicando: `yo / yo entro / yo entro al / yo entro al sitio…`. La solución es `fusionarTramos()`: si un tramo empieza por el anterior, lo **reemplaza** en vez de sumarse; si es un prefijo de lo que ya hay, se descarta; si no se solapa, se añade. Del interim solo se conserva el **último**. En un navegador que se comporta bien los tramos son disjuntos y la función no altera nada (verificado con los tres casos: Android real de la captura 27→5 palabras, navegador correcto intacto, y mixto).

### Netlify: estado real (28-jul-2026)
La CLI **no tiene sesión** (`%APPDATA%\netlify\Config\config.json` con 0 usuarios). Iniciar sesión en netlify.com NO habilita la CLI: hace falta `netlify login` en una terminal, que abre el navegador para autorizar. Alternativa sin interacción: crear un token personal en el panel y definir la variable de entorno `NETLIFY_AUTH_TOKEN` (el usuario debe ponerla él; Claude no maneja el token).

Además se agotó el **cupo diario de despliegues anónimos**, así que ese camino ya no sirve hoy. Sitios anónimos publicados hoy: `tranquil-wisp-87e8e4` (con el bug de Doble Tempo).

### Conteo de palabras: conectores (27-jul-2026)
El proyecto ya tenía un `STOP` (línea ~684) con `de la el y a o en un una que se lo los las le les su mi tu no ni por con del al es te me da voy soy muy mas ya`, aplicado en Cadena, Aliteración, Temática y Sin Repetir. **Doble Tempo era la única que no lo usaba** y el usuario notó que contaba los conectores.

Ahora `analyzeTempo` filtra igual que las demás (`!STOP.has(w) && w.length>1`) y su marcador se llama **"Palabras con peso"**.

**Decisión importante:** las **sílabas/seg se siguen calculando sobre TODO lo dicho**, sin filtrar. Miden la velocidad real de la boca y son las que deciden el veredicto de doble tempo; si se filtraran, la app diría "no llegaste" cuando sí llegaste. Verificado: un texto de puro relleno da marcador 3 con 0,5 síl/seg, y uno con contenido da 21 con 0,9.

Las demás técnicas usan `tokenize` sin filtrar **a propósito** (Multi, Palabras, Trabalenguas y Muletillas necesitan el texto completo para buscar rimas, coincidencias o muletillas). No "arreglar" eso.

### Pasada de motion graphics (27-jul-2026)
Entradas escalonadas con variable `--i` para el retardo: tarjetas del menú en cascada (`:nth-child` fija `--i` de 0 a 9), vistas al cambiar (`.view:not(.hide)`), la consigna del entrenador por partes (kicker → palabra → subtítulo) y el desglose del resultado (bloques → stats → chips). El contador del puntaje pasó de `setInterval` lineal a `requestAnimationFrame` con **ease-out cúbico** y duración adaptada al número.

**Regla que NO hay que romper:** todas usan `animation-fill-mode:backwards`, nunca `both`. Con `both` el último fotograma queda fijado y **pisa los `transform` de `:hover`** — las tarjetas dejarían de levantarse al pasar el mouse. Verificado.

**Nota de verificación:** con el panel oculto (`document.hidden`) las animaciones CSS **no avanzan** (`currentTime` clavado en 0) y las entradas se ven congeladas en opacidad 0. Es artefacto del entorno, no un fallo. Para comprobarlas hay que forzar el tiempo con la Web Animations API (`a.currentTime = ...` o `a.finish()`), y para el contador hay que sustituir `requestAnimationFrame` por un conductor manual.

### Modo Bestia (27-jul-2026)
Botón al final del menú (`#bestiaBtn`) con un **tigre en SVG de trazo** (15 paths, hereda `currentColor`), interruptor deslizante y color naranja `#F97316`. Estado en `body.bestia-on`, se guarda en `localStorage` (`flBestia`) y sobrevive a recargar. En el entrenador aparece la etiqueta `.bestia-tag` para que se sepa por qué cambió el reloj.

**Cómo sube la exigencia** — tabla `SEGS` (normal → bestia):
Multi 30→20 · Camaleón 40→28 · Cadena 40→28 · Aliteración 30→20 · Trabalenguas 25→18 · Encadenado 40→28 · Temática 40→28 · **Sin Repetir 45→75** · **Sin Muletillas 45→75** · Tempo y Palabras mantienen el reloj.

**La clave que no hay que romper:** en Sin Repetir y Sin Muletillas *menos tiempo sería más FÁCIL* — lo difícil es aguantar sin repetirse ni meter muletillas, así que ahí el tiempo SUBE. Las otras dos que no cambian de reloj aprietan por otro lado: Palabras pide +2 palabras (`palN()`), y Doble Tempo exige el doble tempo entero (`sixteenth * 1` en vez de `* 0.7`: a 90 BPM pasa de 4,2 a 6,0 síl/seg).

Las insignias de duración de las tarjetas se reescriben al alternar (`pintarBestia()`), si no mentirían.

**Tema infierno.** Con `body.bestia-on` se **reescriben las variables CSS** (`--ink:#0A0503`, `--surface:#180F0A`, `--stage:#FF6A00`, `--paper:#FFF2E6`, `--gold:#FFC24A`…). Como las custom properties se heredan, con eso cambia toda la interfaz —botones, bordes, glows, chips— sin tocar ninguna otra regla. Los 10 `--tc` de las tarjetas pasan a escala de brasa, y se recolorean el fondo del body, la retícula y las 4 manchas de la aurora.

Añadidos: **llamas** en `.tcard::after`, `.panel::after` y `.verdict::after` (capas de radial-gradient, `mix-blend-mode:screen`, animación `lamer` cuya duración usa `--i` para que cada recuadro titile distinto); **20 brasas** que suben (`#brasas`, generadas por JS con posición, tamaño, deriva y duración al azar); y un **resplandor pulsante desde el suelo** en `.bg::before`.

Para que el texto siga legible, `body.bestia-on .tcard>*, .panel>*, .verdict>*` van a `z-index:1` y las llamas a `z-index:0`. **Pero hay que excluir `.tcard-time`**: esa regla le ponía `position:relative` y la insignia de segundos, que es `absolute` en la esquina, caía al flujo y se montaba sobre "Técnica NN". El selector correcto es `.tcard>*:not(.tcard-time)`, más `body.bestia-on .tcard-time{z-index:1}` aparte.

También se dio aire en el breakpoint ≤430px: con dos columnas a 340px el rótulo y la insignia quedaban a 5px. Bajando el tracking del rótulo a `.13em` y achicando la insignia a 9,5px pasan a 17px de holgura.

**Trampa repetida:** los valores en línea que pone el JS (duración y retardo de cada brasa) los pisaba la regla global `*{animation:none!important}`. Hay que ponerlos con `setProperty(..., "important")` — el inline con prioridad sí gana.

### Cascada de palabras a pantalla completa (28-jul-2026)
Antes `.cascade` solo ocupaba los márgenes laterales (`width:calc((100vw - 560px)/2)`), así que **en móvil su ancho era 0 y no se veía**. Ahora las dos capas se reparten la pantalla (`.left{left:0;right:50%}`, `.right{left:50%;right:0}`) y `montarCascadas()` calcula las columnas según el ancho real (≈ mitad/95): 4 columnas a 375px, 14 a 1280px. Se rearma al redimensionar con un debounce de 250 ms.

Aparece en **dos sitios**: la portada de bienvenida (capas `.splash-casc` DENTRO de `#splash`, porque el splash se pinta sobre todo el fondo; van `position:absolute` y `display:flex!important`, con `.sp-inner` en `z-index:1`) y el menú.

**Regla del usuario: NUNCA dentro de una técnica** — palabras cayendo mientras improvisás le dan material y es hacer trampa. Ya se cumple solo, porque `.cascade` depende de `body.home-active`, que `openTech()` quita y `goHome()` devuelve. No romper ese vínculo.

Opacidades: capa .5 en la portada y .7 en el menú, por .22 de cada palabra.

### Todo en mayúsculas (28-jul-2026)
Decisión de estilo del usuario ("se ve más serio"). Se hace con **una regla CSS global**, no reescribiendo los textos, así que se revierte quitándola: `body,body input,body textarea,body button,body select{text-transform:uppercase}` (los controles de formulario se nombran aparte porque no siempre heredan). También hubo que pasar `.word.tongue` de `none` a `uppercase`.

**Excepción: la cascada de palabras sigue en minúsculas** — el usuario lo pidió expresamente; es una textura deliberada.

No afecta al análisis: `text-transform` es solo visual, el `value` real del textarea no cambia y `tokenize()` lo recibe intacto (verificado).

### Ojo con el vocabulario del usuario
Llama **"portada"** a la pantalla de bienvenida (`#splash`, la del logo y el botón Entrar) y **"menú"** a `#home` (el hero con las 10 tarjetas). En el código el comentario HTML de `#home` dice "PORTADA", que induce a error. Ante la duda, preguntar.

### Dos diseños: móvil y escritorio (28-jul-2026)
Decisión del usuario: **lo que había ES la versión móvil** y no se toca; escritorio se rediseña aparte porque en pantalla grande quedaban ~460 px muertos a cada lado.

Antes NO existía ningún punto de corte de escritorio: los cuatro eran `max-width` (el diseño solo sabía encogerse, topando en `.app{max-width:520px}`). Ahora todo lo nuevo vive en **`@media (min-width:900px)`** (+ un refuerzo en 1240px), así que es puramente aditivo.

**Escritorio:** `.app` a 1120/1200 px. Menú en grid de 2 columnas — titular y descripción a la izquierda alineados a la izquierda, las dos cabezas a la derecha (`--cs` sube a .36/.42) — y tarjetas en `repeat(auto-fill,minmax(200px,1fr))`: 4 columnas a 960 px y **5 a 1280 px, que da dos filas exactas para las 10**. Entrenador partido en dos: consigna + reloj a la izquierda, panel "En vivo" + resultado a la derecha.

**El truco de los envoltorios:** el entrenador necesitaba agrupar sus hijos en dos columnas, pero sin romper el móvil. Se añadieron `.tr-cols > .tr-izq/.tr-der` con **`display:contents` por defecto** (invisibles para el layout, el móvil queda idéntico) que pasan a `grid`/`block` solo en escritorio. No quitarles el `display:contents`.

**Bug latente que salió a la luz:** `.panel` no tenía `position:relative`, así que `.panel::after` (las llamas del modo bestia) se posicionaba contra `.app` — se salía 72 px por lado provocando scroll horizontal, y en modo bestia el fuego nunca se dibujó donde debía. Corregido con `position:relative` en `.panel`.

Verificado: 375 y 820 px → móvil intacto; 960 y 1280 px → escritorio; sin scroll horizontal en ninguno. Ojo al medir tras redimensionar: la emulación deja residuos de unos 4 px, hay que recargar limpio.

### Barra de cuenta (28-jul-2026) — MARCADORES, no funcionan todavía
`#authBar` en la fila superior del menú: logo a la izquierda, barra a la derecha, encima de las cabezas. **Solo escritorio** (`display:none` por defecto, `flex` dentro del bloque ≥900px) porque el usuario la pidió para "la versión web".

Cinco botones: **Mi progreso · Ranking · Tienda · Ingresar · Regístrate** (este último con clase `.primaria`, relleno en `--stage`). Con `flex-wrap` porque a 960px no caben en una fila y pasan a dos.

Ninguno hace nada aún: al pulsarlos muestran un aviso temporal (`.auth-aviso`, 3,8 s) explicando que las cuentas todavía no existen. Un botón muerto es peor que no tenerlo.

**Contexto:** el usuario planea implementar registro e ingreso de usuarios más adelante; esto es la preparación visual. Cuando llegue el backend, aquí se enganchan (ver el pendiente de leaderboard e historial).

### Modo Principiante (28-jul-2026)
Tercer modo, excluyente con Bestia (activar uno apaga el otro; se comparte `pintarBestia()`/`guardarModo()` con banderas `bestia`/`novato`). Botón `#novatoBtn` con cara de bebé en SVG de trazo (cabeza redonda, rulo, mofletes, chupete), junto al del tigre en `.modos` (grid 1fr en móvil, 1fr 1fr en escritorio).

**Regla que ya se usó en Bestia y aquí se repite en espejo:** más fácil no es simplemente "más tiempo". En `SEGS` cada técnica tiene `n/b/p`; en Sin Repetir y Sin Muletillas lo difícil es aguantar, así que ahí **bestia sube el reloj y principiante lo baja** (45→30s), mientras que en las demás principiante sube el tiempo (30→45, 40→55...). Palabras pide -1 palabra (`palN()`, con piso de 2). Doble Tempo pide la mitad del doble tempo real (`sixteenth*0.5` = 3,0 síl/seg a 90 BPM, contra 4,2 normal y 6,0 bestia).

**Paleta pastel** vía `body.novato-on`, mismo mecanismo de variables CSS que el infierno, pero **invirtiendo el tema** (fondo claro `#F4F8FE`, texto oscuro `#33415A` en vez de solo recolorear sobre fondo oscuro). Rosa/celeste/violeta pastel. El degradado del titular tuvo que redeclararse (`.hero-title,.word,.sp-brand`) porque en fondo claro un degradado hacia blanco desaparece.

**Burbujas en vez de fuego:** reutiliza los mismos `::after` de `.tcard/.panel/.verdict` (llamas del infierno) cambiando el `background` a `radial-gradient`s de puntos con brillo, y las 20 partículas de `#brasas` cambian de imagen y de animación (`subir-burbuja`, más lenta, sin encogerse). La llama entre las dos cabezas tiene ahora DOS SVG superpuestos (`.fuego` y `.burbujas`); `body.novato-on` oculta uno y muestra el otro.

Verificado: las 10 duraciones en los 3 modos, el objetivo de Doble Tempo (3,0/4,2/6,0 síl/seg), la exclusión mutua en ambos sentidos, y que las burbujas floten con `flotar`/`subir-burbuja`.

### Clips de motion graphics con HyperFrames (30-jul-2026)
Serie de 3 clips promo acordada (logo sting, cabezas cantando, transformación Modo Bestia), en `C:\Users\asfura\Desktop\freestyle-lab-html\videos\`. **Solo se completó el primero.**

**Clip 1 — logo sting: TERMINADO.** `videos/logo-sting/renders/video.mp4` — 1080×1920, 4s, H.264, 634 KB. Reproduce el ciclo de 9 tipografías de la portada rematando en el wordmark real. Se hizo con el pipeline completo de `motion-graphics` (Director parte 1+2, Builder, reparación — 4 sub-agentes, ~350k tokens). Encontró y arregló un bug real que el sitio original no tenía: `background-clip:text` no se hereda a los hijos, así que el `<span class="st">` pintaba transparente durante el ciclo (se le redeclaró su propio degradado). También se agregó un centinela de fuentes oculto para que el compilador de HyperFrames embeba determinísticamente las 8 fuentes que solo se referenciaban desde JS.

**Clips 2 y 3 — hechos el 6-ago-2026, por fin.** El usuario marcó explícitamente que el gasto del clip 1 fue excesivo para un resultado parecido a lo que el sitio ya hace solo (ver [[feedback-hyperframes-recreation-cost]] — memoria de feedback dedicada, léase antes de tocar HyperFrames en este proyecto otra vez). El primer intento de grabar el sitio real con captura de pantalla de Windows vía PowerShell/gdigrab resultó frágil y se abandonó. **La segunda vuelta sí funcionó**, con `chrome-devtools-mcp` (protocolo CDP) usando `performance_start_trace`/`stop_trace` para extraer el filmstrip de fotogramas embebido en el trace, en vez de `take_screenshot` en loop (demasiado lento, ~15s por llamada). Resultado: `videos/cabezas-cantando/video.mp4` (4,8s) y `videos/modo-bestia/video.mp4` (4,9s, muestra el toggle antes/después con las llamas y brasas), ambos a 996×420 (resolución baja del filmstrip de Chrome, no configurable). Detalle técnico completo en [[feedback-hyperframes-recreation-cost]].

**Entorno instalado en esta máquina** (una sola vez, reutilizable): FFmpeg (vía winget, `Gyan.FFmpeg`, en `%LOCALAPPDATA%\Microsoft\WinGet\Packages\Gyan.FFmpeg_...\ffmpeg-8.1.2-full_build\bin`) y Chrome Headless Shell (vía `hyperframes browser ensure`, en `%USERPROFILE%\.cache\hyperframes\chrome\`). El PATH del sistema se actualizó pero el shell de esta sesión no lo relee — hay que anteponer `export PATH=".../ffmpeg-8.1.2-full_build/bin:$PATH"` en cada comando Bash que use `ffmpeg`/`ffprobe`/`npx hyperframes`.

### Técnica 11 — Calentamiento de Mandíbula (2-ago-2026): PRIMERA técnica con cámara
Primera vez que el sitio usa la cámara y visión artificial — todas las demás son 100% de voz. Tarjeta `#cardMandibula` (`--tc:#4F7CFF` normal, `#FF8A00` bestia, `#A8B8F5` principiante), técnica clave `"mandibula"`, `SEGS.mandibula:{n:40,b:28,p:55}`.

**Cómo funciona:** usa **MediaPipe Face Landmarker** (Google), cargado por `import()` dinámico SOLO la primera vez que se entra a esta técnica (no pesa la carga inicial del sitio para nadie más). Sigue el blendshape `jawOpen` (0 a 1, viene ya calculado por MediaPipe) cuadro a cuadro sobre el `<video>` de la cámara, y cuenta una repetición cada vez que `jawOpen` cruza 0.35 (abre) y después baja de 0.15 (cierra) — la histéresis entre esos dos umbrales evita contar temblores como repeticiones. Recomendado ajustar esos umbrales si en la práctica queda muy sensible o muy exigente; están en `CAM_UMBRAL_ABRE`/`CAM_UMBRAL_CIERRA`.

**URLs externas de las que depende** (verificadas en vivo el 2-ago-2026, pueden cambiar con el tiempo):
- Librería: `https://cdn.jsdelivr.net/npm/@mediapipe/tasks-vision/vision_bundle.mjs`
- WASM: `https://cdn.jsdelivr.net/npm/@mediapipe/tasks-vision@latest/wasm`
- Modelo (~3,6 MB): `https://storage.googleapis.com/mediapipe-models/face_landmarker/face_landmarker/float16/latest/face_landmarker.task`

**Arquitectura — por qué es distinta a las otras 10:** todas las demás técnicas comparten `startRec()`/`stopRec()`/`onPrimary()` con lógica de micrófono (`SpeechRecognition`+`MediaRecorder`) y análisis de texto. Mandíbula NO usa nada de eso — tiene su propia rama al inicio de cada una de esas tres funciones (`if(activeTech==="mandibula"){...; return;}`) que llama a `startCam()`/`stopCam()`/`analyzeMandibula()` en su lugar, pero SIGUE reutilizando el reloj/anillo/botón de grabar compartido, así que visualmente encaja con el resto. `stopEverything()` llama a `stopCam()` sin condición, para que la cámara se libere siempre al cambiar de técnica o volver al menú — importante para no dejar la cámara del usuario encendida de fondo.

**El panel cambia de contenido:** en vez de `#live`/`#edit` (transcripción), esta técnica muestra `#camHost` (video espejado con `transform:scaleX(-1)`, más un indicador vertical del `jawOpen` en vivo) y después `#camSummary` (resumen de texto). `#playBtn` se oculta (no hay audio que reproducir). Todo esto se togglea en `newItem()` con la bandera `esMandibula`.

**Manejo de errores, verificado de verdad:** sin cámara disponible (probado en el navegador de pruebas, que la bloquea), la app muestra el mensaje correcto según el tipo de error (`NotAllowedError`/`NotFoundError`/otro), el reloj de la ronda sigue corriendo igual, y al terminar entrega un veredicto en cero sin romperse. **Lo que NO se pudo verificar en esta sesión:** la detección facial real con una cámara de verdad (el entorno de pruebas no tiene cámara). Los umbrales 0.35/0.15 son una primera estimación razonable, pero conviene que el usuario los pruebe con su cara real y ajuste si hace falta.

**Trampa que apareció durante la edición:** dos líneas de CSS quedaron duplicadas solas (una con el mismo valor, otra con un valor distinto al que se había escrito) — no fue intencional, posiblemente un artefacto de guardado concurrente con el panel de vista previa. Se detectó porque el color de modo principiante no coincidía con lo esperado al verificar, y se corrigió. **Lección: después de una tanda larga de ediciones, conviene grepear los identificadores nuevos (`grep -n cardMandibula archivo`) para confirmar que cada uno aparece exactamente donde debería, no asumir que el editor aplicó cada Edit una sola vez.**

### ⚠️ ADVERTENCIA CRÍTICA: hay más de una sesión activa en este proyecto (9-ago-2026)
El usuario confirmó que **hay otra sesión/copia de trabajo activa en este mismo proyecto** que esta memoria no ve. Se descubrió porque el sitio publicado en Netlify (`freestyle-lab-app.netlify.app`) tenía **10 despliegues** cuando esta sesión solo había hecho 1 — es decir, ~9 despliegues de otro origen, el último el mismo 9-ago a las 16:31 UTC.

**Antes de dar por buena "la última versión" (local o publicada), hay que asumir que puede haber diverdido más.** Esta vez las dos ramas compartían el mismo origen (bestia/novato/authBar/cabezas/cascada) pero divergieron: la rama local de esta sesión tenía la Técnica 14 "Calentamiento de Mandíbula" (cámara); la rama publicada tenía 3 técnicas nuevas (**Métricas**, **Resistencia de Exhalación** con análisis de audio crudo del micrófono, **Doble Sentido**) y una reorganización completa del menú en **familias con encabezado de color** (`.fam-head`, `--fc`): Rima / Voz / Ingenio / Disciplina / (ahora) Cuerpo.

**Antes de deployar o de asumir que el archivo local es "la verdad", chequear `netlify api listSiteDeploys --data '{"site_id":"...", "per_page":10}'` y comparar la fecha del último deploy contra la última edición conocida en esta memoria.** Si no coinciden, parar y preguntarle al usuario por la otra sesión antes de tocar nada — no asumir cuál rama es la correcta, se fusiona a mano leyendo ambas.

**Se fusionaron las dos ramas el 9-ago-2026:** se adoptó la versión publicada (la de la otra sesión) como base, y se le porteó encima Mandíbula. Resultado: 14 técnicas, 5 familias. Respaldos de las tres versiones en `versiones/`: `index-2026-08-09-solo-mandibula-antes-de-fusion.html` (rama de esta sesión), `index-2026-08-09-desde-netlify-antes-de-fusion.html` (rama de la otra sesión, descargada de Netlify), `index-2026-08-09-fusionado.html` (resultado).

### Técnica 16 — Rutina Pre-Audiencia (9-ago-2026): tercera técnica de cámara, SIN puntaje competitivo
`#cardRutina`, familia "Cuerpo" (tercera ahí, junto a Mandíbula y Vocales). `SEGS.rutina:{n:60,b:40,p:80}` — pero aquí bestia/principiante NO significan "más difícil/más fácil": significan **"tengo prisa" (40s) vs "tengo tiempo" (80s)**, porque es un ritual de calentamiento antes de hablar en público (audiencias, presentaciones), no una prueba.

**Diferencia de diseño clave frente a Mandíbula/Vocales — no revertir esto sin pensarlo:** esta técnica **nunca usa lenguaje de fracaso**. Son 4 pasos fijos (Mandíbula → Labios → Lengua → Respiración) que avanzan solos con `scheduleRutina()` (mismo mecanismo de `revealTimers` que Palabras/Vocales). Los tres primeros solo miden **presencia** de movimiento con un umbral bajo (`RUTINA_UMBRAL_PRESENCIA=0.15`) — no exigen una forma correcta como Vocales, solo que hiciste "algo". El paso de **Respiración no usa cámara en absoluto** (no hay blendshape que tenga sentido medir ahí) y **siempre cuenta como logrado** en el resultado. Aunque la detección falle por completo (`camSamples===0`), el consejo final sigue siendo alentador, nunca "te fue mal" — el resultado se llama "Rutina completada", no "puntaje".

**Refactor de nombres que valió la pena hacer antes:** los ids `#vocalWord`/`#vocalTip` (creados para Vocales) se renombraron a `#camStepWord`/`#camStepTip` ANTES de construir Rutina, porque ahora los reusan las 3 técnicas de cámara para mostrar la palabra/paso rotante — dejarlos con nombre "vocal" mientras muestran "RESPIRACIÓN" hubiera sido confuso. Si se agrega una 4ª técnica de cámara (Simetría Facial), sigue este mismo patrón: reusar `#camStepWord`/`#camStepTip`/`#camGaugeFill`/`startCamTracking()`, no crear ids nuevos.

Verificado con datos simulados: secuencia de 4 pasos avanza con sus tips, Respiración marca ✓ siempre, los otros según su presencia simulada, puntaje "3 de 4 pasos" con el chip de "Labios" en gris neutro (`dim`) no en rosa/error. El "scroll horizontal" que apareció una vez al verificar era el mismo artefacto de residuo de 4px tras un `resize_window` — desapareció al recargar limpio, no era real.

### Técnica 15 — Espejo de Vocales (9-ago-2026): segunda técnica de cámara
Marca las 5 vocales (A E I O U) exageradas frente a la cámara; cada una se muestra por turnos durante la ronda. `#cardVocales` en la familia "Cuerpo", junto a Mandíbula. `SEGS.vocales:{n:25,b:15,p:35}` (25s normal → 5s por vocal; bestia 15s → 3s/vocal, más difícil; principiante 35s → 7s/vocal).

**Refactor clave que hizo esto barato de construir:** el motor de cámara se generalizó de `startCam()` (solo Mandíbula) a `startCamTracking(onFrame)`, que hace todo lo difícil (cargar el modelo, pedir permiso, correr el loop, armar un `{nombreBlendshape: valor}` por cuadro) y le pasa ese objeto a un callback. `startCamMandibula()` y `startCamVocales()` son ahora wrappers finos sobre esa base compartida. Las próximas técnicas de cámara (Rutina Pre-Audiencia, Articulación Extrema, Simetría Facial) deberían seguir el mismo patrón: NO reescribir el `getUserMedia`/carga del modelo, solo escribir su propio `onFrame`.

**Cómo se puntúa cada vocal — importante entender el criterio real:** MediaPipe no fue pensado para clasificar vocales fonéticamente, así que **no se intenta reconocer qué vocal dijiste** — se mide "qué tanto exageraste la forma esperada" para la vocal que está en pantalla en ese momento, vía UN blendshape representativo por vocal:
- A → `jawOpen` (boca abierta), umbral 0.45
- E → promedio de `mouthStretchLeft/Right` (sonrisa ancha), umbral 0.28
- I → promedio de `mouthSmileLeft/Right`, umbral 0.35
- O → `mouthFunnel` (labios redondeados hacia afuera), umbral 0.25
- U → `mouthPucker` (beso), umbral 0.30

Estos umbrales son una primera estimación, igual que los de Mandíbula — **no probados con cámara real**, ajustar si en la práctica quedan mal calibrados. El indicador visual en pantalla (`#camGaugeFill`, reusado de Mandíbula) muestra el avance hacia el umbral de la vocal ACTUAL (`valor/umbral`, tope en 100%), no el valor crudo del blendshape — si no, vocales con umbrales bajos (O, U) se verían siempre casi llenas y las de umbral alto (A) siempre vacías.

El avance automático entre las 5 vocales reusa `revealTimers`/`clearReveals()` (el mismo mecanismo de Palabras), no un sistema de temporizadores nuevo — `stopRec()` ya los limpia al inicio, así que no hizo falta lógica de limpieza extra.

Verificado con datos simulados (no cámara real): al forzar picos que superan 3 de 5 umbrales, el veredicto da exactamente 3, con las chips mostrando el % de avance de cada vocal y el color correcto (ok/gold/pink). El número animado del puntaje (`countUp`) se ve pegado en "0" con el panel de pruebas oculto — es el mismo artefacto de `requestAnimationFrame` congelado que afecta a las 15 técnicas por igual con el panel sin foco, no un bug de esta técnica.

### Técnica 14 — Calentamiento de Mandíbula: reubicada en la familia "Cuerpo"
Sigue funcionando igual que como se construyó originalmente (ver la sección de abajo para el detalle técnico de MediaPipe), pero ahora vive en su propia familia nueva `Cuerpo · calentamiento físico y facial` (`--fc:#4F7CFF`), en vez de estar numerada "Técnica 11" suelta. Es la única familia sin más técnicas todavía — las otras 4 ideas de "yoga facial" (Espejo de Vocales, Rutina Pre-Audiencia, Articulación Extrema, Simetría Facial) irían aquí.

**Ojo:** `SEGS` y `BADGE` en la rama publicada NO tienen entradas para `metricas`/`aire`/`doble` (no escalan con Modo Bestia/Principiante) — parece intencional de la otra sesión, no tocar sin preguntar. `mandibula` sí tiene su entrada en ambos, igual que las 10 técnicas originales.

### Técnica 11 — Calentamiento de Mandíbula (2-ago-2026): PRIMERA técnica con cámara
Rimas internas, multimetría, asonancia pura, batalla/duelo, composición. Backend con leaderboard e historial nunca se empezó. Clips 2 y 3 de la serie de motion graphics (cabezas cantando, modo bestia) — decidir grabación manual del usuario vs. reintentar con `chrome-devtools-mcp` antes de tocar el pipeline pesado de HyperFrames otra vez. Otras técnicas de "yoga facial" propuestas y no construidas: Espejo de Vocales, Rutina Pre-Audiencia, Articulación Extrema, Simetría Facial — todas pueden reusar `ensureFaceLandmarker()`/el patrón de `startCam()` ya construido.

### Nota de despliegue (actualizada 1-ago-2026)
**Sitio oficial y persistente: https://freestyle-lab-app.netlify.app** — cuenta autenticada (Jorge Asfura, jorgeasfura@gmail.com, `netlify login` ya hecho en esta máquina), sin contraseña, sin expiración. La carpeta `freestyle-lab-html/.netlify/state.json` está vinculada a este sitio (`siteId: 9adee6d4-f285-489e-b553-3123e4b37568`). Para republicar: copiar solo `index.html` a una carpeta limpia (no la carpeta del proyecto entera, que arrastraría `marca/` y `videos/`) y `netlify deploy --prod --dir <esa-carpeta>` desde `freestyle-lab-html/`.

**Sitios viejos a ignorar/no usar:** `freestyleworldlab.netlify.app` y `freestylelaboratory.netlify.app` — existían en la cuenta desde el 26-jul, quedaron desactualizados y el usuario decidió no reutilizarlos (creó `freestyle-lab-app` limpio en su lugar). Los despliegues anónimos (`--allow-anonymous`) de sesiones previas expiraron sin reclamarse — no son accesibles.

Histórico: antes de tener sesión iniciada se usó `netlify deploy --allow-anonymous`, con límite diario y expiración a los 60 min si no se reclamaba. Ya no hace falta — la CLI tiene sesión persistente en esta máquina.

**Bug de permisos del equipo OPCODE (6-ago-2026):** `netlify deploy --prod` falló con `JSONHTTPError: Forbidden` (el deploy normal/draft sin `--prod` sí funcionaba). `netlify status` mostraba sesión y sitio bien vinculados, sin más detalle en el log. El usuario dijo "tengo el equipo OPCODE deshabilitado" y pidió esperar; al reactivarlo, `--prod` volvió a funcionar al toque. **Si vuelve a pasar Forbidden solo en `--prod`:** preguntar primero si el equipo/cuenta de Netlify está deshabilitado, antes de asumir que es un problema de la carpeta o del token.

### Sección de pistas gratis para entrenar (10-ago-2026)
Lead magnet en la portada (tras logo, antes de auth-bar): banner golpeado comprimido a mitad de altura + modal con 7 beats descargables en MP3. **7 archivos reales** en `pistas/` (nombres genéricos: Lluvia Urbana, Vinilo Nocturno, etc.; sin referencia al origen). Implementación: array `PISTAS` en JS (editable sin tocar código) + `showPistas()`/`hidePistas()` + modal que reutiliza el pattern `.info-overlay`/`.info-card` existente. Banner responsive: subtítulo se oculta en `@media (max-width:430px)`. Deploy vivo el 10-ago a las 18:13 UTC (deploy id `6a78fc7edd545d4d98ad75b2`). Para reemplazar o agregar pistas: copiar MP3s a `pistas/pista-NN.mp3` y editar nombres/estilos en el array `PISTAS` — nada más. Ver `modules/pistas-gratis.md` para detalles de código e índice de archivo.
