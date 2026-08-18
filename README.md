# Freestyle Lab

Entrenador de freestyle/improvisación para raperos: 17 técnicas prácticas (rimas, métrica, tempo, respiración, calentamiento de mandíbula, espejo de vocales, etc.), analizadas en tiempo real a partir de lo que el usuario dice por micrófono, más 3 técnicas basadas en cámara (MediaPipe Face Landmarker).

**En vivo:** https://freestyle-lab-app.netlify.app

## Stack

- HTML/CSS/JS **vanilla**, un solo archivo (`index.html`), sin build ni framework.
- [GSAP](https://gsap.com/) para las animaciones (hover de tarjetas, transiciones de vista, pulsos).
- [MediaPipe Face Landmarker](https://developers.google.com/mediapipe) para las 3 técnicas con cámara (blendshapes: apertura de mandíbula, estiramiento de boca, etc.), cargado en runtime desde CDN.
- Web Speech API del navegador para transcribir lo que el usuario dice y analizarlo.
- Deploy en [Netlify](https://www.netlify.com/).

Se intentó una migración a React una vez; rompió el diseño y se descartó. El proyecto se mantiene deliberadamente en HTML vanilla.

## Estructura

```
index.html              → la app completa (markup + CSS + JS)
marca/                   → logo oficial (PNG y SVG vectorizado) y otros assets visuales
pistas/                  → beats MP3 gratuitos usados como fondo al grabar
videos/                  → assets de video (HyperFrames)
versiones/               → checkpoints manuales de index.html antes de cambios grandes
.claude/                 → sistema de continuidad del proyecto (mapa, estado, decisiones)
_archivo-versiones-anteriores/  → prototipos descartados (fuera de git, ver .gitignore)
```

## Cómo correrlo local

No hay build. Basta con servir la carpeta:

```bash
python3 -m http.server 8123
```

y abrir `http://localhost:8123`. El micrófono y la cámara requieren `localhost` o HTTPS.

## Deploy

```bash
npx --yes netlify-cli@latest deploy --prod --dir .
```

(`netlify` no está en el PATH en todas las máquinas, por eso se invoca vía `npx`.)

## Técnicas incluidas

**Básicas:** Rimas por Minuto, Sin Repetir, Sin Muletillas
**Profesionales:** Multisílabas & Palabras, Métricas, Palabra Camaleón, Doble Tempo, Aliteración, Doble Sentido
**Modalidades:** Temática Obligada
**Entrenamiento educativo:** Trabalenguas, Resistencia de Exhalación, Cadena de Rimas, Encadenado Silábico
**Calentamiento previo:** Calentamiento de Mandíbula (cámara), Espejo de Vocales (cámara), Rutina Pre-Audiencia

## Modo Circuito

Encadena 2 a 5 técnicas seguidas con descanso entre cada una: se arma la cola desde un selector, cada ronda pasa por el análisis normal de su técnica y al terminar aparece un resumen con el puntaje de cada una.

## Continuidad del proyecto

Este proyecto usa un sistema de memoria propio en `.claude/` (mapa de módulos, estado activo, decisiones, historial) pensado para retomar trabajo entre sesiones. Ver [`.claude/INDEX.md`](.claude/INDEX.md).
