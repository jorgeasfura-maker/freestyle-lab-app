# 🔥 HOT — Estado activo

> Sin bugs abiertos ni equipo/sprint formal — proyecto de una persona.

## Bugs activos

| ID | Descripción | Prioridad | Estado |
|---|---|---|---|
| — | Ninguno abierto | — | — |

## Pendientes (próximas sesiones)

| Tarea | Módulo | Estado | Nota |
|---|---|---|---|
| Clip 2: cabezas cantando | video-hyperframes | ⚪ Grabar, no recrear | Depende de que usuario tenga pantalla/tiempo |
| Backend de cuentas/ranking | menu-hero | ⚪ Sin diseñar | Simetría Facial es alternativa |
| Simetría Facial (4ª técnica cámara) | entrenador-analizadores | ⚪ Ofrecido, no respondido | MediaPipe está ready |
| Chips `.tcard-tag` desalineados | cards-home | ⚪ Detectado 12-ago | Siguen diciendo la familia vieja (Rima/Voz/...), ya no la sección nueva |
| `marca/bocas.svg` pesado (~4MB) | menu-hero | ⚪ Detectado 13-ago | Tarda 1-4s en decodificar, candidato a optimizar |
| Transcripción por voz | entrenador | ⚪ Pregunta sin responder | Whisper (paga, mejor precisión) vs. bajar volumen de pista de fondo (gratis) |

## Decisiones últimas 48h

| Fecha | Decisión |
|---|---|
| 20-08-2026 | Pasada estética (4 frentes, todos verificados sin captura de pantalla — panel de vista previa no disponible del lado de Claude, se verificó por DOM/computed styles): **(1)** 17 chips de tarjeta con familia vieja → mecánica real de cada técnica ("Volumen", "Camuflaje", "Constancia"...), tamaño 9px→11px acorde al patrón "eyebrow" del resto del sitio. **(2)** logo PNG(240KB)→SVG(6KB) en los 4 lugares; `bocas.svg`(880KB/2.35s) → `bocas.webp`(70KB, re-renderizado a 3x el tope de display). **(3)** encabezados de sección (`.fam-head`) partidos en título(15px/800)+bajada(10.5px) — antes una sola línea de 11px sin jerarquía siendo la nav principal del sitio; secciones abiertas ahora tienen panel tintado con el color de la sección (antes idénticas a cerradas). **(4)** `textarea.edit` alineada a la escala de radios (--radius-sm) con tinte leve del color de la técnica, antes genérica dentro de un `.panel` ya tintado |
| 18-08-2026 | **Cuenta regresiva con metrónomo** (4·3·2·1) entre pulsar "Grabar" y el inicio real de la ronda, en las 17 técnicas; y **parpadeo de aviso** en los últimos 5s. El reloj de ronda, antes duplicado (camino voz / camino cámara), se unificó en `arrancarReloj()` |
| 17-08-2026 | Repo publicado en GitHub (`jorgeasfura-maker/freestyle-lab-app`) con README + BRIEFING.md para el ingeniero de backend. Logo vectorizado a SVG (`marca/logo-oficial.svg`, 6KB) |
| 15-08-2026 | Memoria del proyecto separada del resto de proyectos de Claude Code: todo vive en este `.claude/`, prototipos descartados archivados en `_archivo-versiones-anteriores/` (fuera de git y Netlify) |
| 15-08-2026 | Modo **Circuito**: encadena 2-5 técnicas con descanso entre medio. Rediseño "sólido y elegante" extendido a trainer/modales (quedaba pendiente desde el 10-ago) |
| 04-08-2026 | Freestyle Lab se trabaja en **HTML vanilla de un solo archivo, no en React** — la migración a React (`freestyle-lab-react/`, ahora archivada) rompió el diseño y se descartó |
| 10-08-2026 | Rediseño "orden profesional + vanguardia" sin cambiar paleta/animaciones: tokens de espaciado/radio en :root, `.fam-head` con línea degradada por familia |
| 10-08-2026 | Agregar 7 beats MP3 reales a `/pistas/`; banner reducido, nombres genéricos (Lluvia Urbana, Vinilo Nocturno) |
| 09-08-2026 | Deploy Rutina Pre-Audiencia (16 técnicas totales, 3 con cámara) |
| 02-08-2026 | git init + sistema `.claude/` de continuidad |
