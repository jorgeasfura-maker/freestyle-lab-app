# Briefing técnico — Freestyle Lab (para el ingeniero de backend/infra)

## Qué es

App web de entrenamiento de freestyle/improvisación. El usuario elige una de 17 técnicas (rimas, métrica, tempo, respiración, etc.), graba por micrófono, la app analiza el texto/audio en tiempo real y da un puntaje. 3 técnicas usan cámara (MediaPipe Face Landmarker) en vez de voz.

- **En vivo:** https://freestyle-lab-app.netlify.app
- **Repo:** https://github.com/jorgeasfura-maker/freestyle-lab-app
- **README** del repo tiene el detalle de stack/estructura/técnicas — este documento es el complemento orientado a lo que falta por construir.

## Estado actual: 100% frontend, cero backend

Todo el proyecto es **un solo archivo HTML/CSS/JS vanilla** (`index.html`, ~260KB, sin build, sin framework, sin bundler). No hay:

- Servidor propio (solo estático, servido por Netlify).
- Base de datos.
- Autenticación real.
- Persistencia de ningún tipo — **ni siquiera `localStorage`**. Cada sesión de entrenamiento vive solo en memoria del navegador; al recargar la página se pierde todo (puntajes, historial, progreso).
- API alguna. Todo el análisis de texto (detección de rimas, conteo de sílabas, aliteración, etc.) corre client-side en JS puro.

Esto fue una decisión consciente hasta ahora (producto validado como herramienta de entrenamiento individual, sin cuentas), no una limitación técnica no vista.

## Lo que ya existe en el frontend pero es puro placeholder

En la barra superior (`#authBar` en `index.html`, visible solo en escritorio) hay 5 botones ya maquetados y estilados, pero **ninguno hace nada real** — al hacer clic solo muestran un aviso tipo "esto todavía no existe":

```html
<div class="auth-bar" id="authBar">
  <button id="authProgreso">Mi progreso</button>
  <button id="authRanking">Ranking</button>
  <button id="authTienda">Tienda</button>
  <button id="authLogin">Ingresar</button>
  <button id="authSignup" class="primaria">Regístrate</button>
</div>
```

Esto marca la intención de producto: **cuentas de usuario, historial/progreso persistente, ranking entre usuarios, y algún tipo de tienda** (sin especificar qué se vendería — no está definido, es solo el hueco visual).

## Superficie de integración que el backend necesitaría cubrir

1. **Auth** — registro/login. No hay ninguna decisión tomada sobre proveedor (Auth0, Supabase Auth, Firebase Auth, algo propio). El frontend no tiene ningún SDK cargado todavía.
2. **Persistencia de resultados** — cada ronda de entrenamiento ya calcula un objeto de resultado en el cliente (puntaje, técnica, duración) que hoy solo se pinta en pantalla (`renderVerdict()`) y se pierde. Haría falta un endpoint para guardarlo asociado al usuario.
3. **Ranking** — implica agregación entre usuarios, así que sí o sí necesita backend + base de datos (no se puede hacer client-side).
4. **"Mi progreso"** — lectura del historial guardado, probablemente con algo de agregación (rachas, mejor puntaje por técnica, etc.).
5. **Tienda** — sin definir. Antes de tocar esto, confirmar con el usuario qué se vendería (¿nada aún, es aspiracional?).

## Puntos de enganche en el código actual

- Punto único donde termina cada ronda de cualquier técnica (las 17, incluidas las 3 de cámara): función `renderVerdict(cfg)` en `index.html`. Es el lugar natural para disparar un `POST` de guardado de resultado una vez que exista el backend.
- Los 5 botones de `#authBar` ya tienen sus IDs (`authLogin`, `authSignup`, `authProgreso`, `authRanking`, `authTienda`) — hoy cada uno solo dispara un aviso de "aún no existe"; ahí se engancharía la lógica real (abrir modal de login, redirigir, etc.).
- El "modo Circuito" (encadena varias técnicas con descanso entre medio) también converge en `renderVerdict`, así que el guardado de resultados cubriría ambos flujos (técnica suelta y circuito) sin duplicar lógica.

## Restricciones a respetar

- El sitio es y debe seguir siendo **vanilla, sin build step** — no meter React/Vue/bundler para "arreglar" esto; si se necesita un SDK de auth, que sea vía `<script>` tag o import nativo de ES modules, no un paso de compilación nuevo.
- Cualquier backend/API es **aparte** del deploy estático de Netlify actual — no se puede correr un servidor Node persistente ahí. Si se necesita backend con estado, va en otra infraestructura (o funciones serverless que si Netlify soporta, como Netlify Functions).
- Nada del análisis de voz/rimas/métrica se toca — eso queda client-side, funciona bien y no depende de red.

## Contexto de continuidad del proyecto

El repo tiene un sistema de memoria propio en `.claude/` (mapa de módulos, estado activo, historial de decisiones) pensado para que una sesión de Claude Code retome contexto sin reconstruir todo desde cero. Si van a trabajar con Claude Code en este repo, `.claude/INDEX.md` es el punto de entrada.
