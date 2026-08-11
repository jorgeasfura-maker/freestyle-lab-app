# App Principal — index.html

Sitio HTML vanilla monolítico (~245 KB). Toda la lógica en un archivo.

## Estructura lógica

| Sección | LOC | Descripción |
|---|---|---|
| CSS Custom Props | ~20 | `--paper`, `--mist`, `--stage`, `--gold` (tema) |
| **UI Sections** | | |
| Portada (splash) | ~60 | Logo, "ENTRAR", animación de fondo |
| Auth bar | ~80 | "Regístrate", logo, modos (Bestia/Principiante) |
| Menu home | ~200 | 16 tarjetas de técnicas, cada una con color de familia |
| Tech detail page | ~300 | Timer, score, gauge, botones (rec/play, volver) |
| Info modal | ~100 | "Cómo funciona" de cada técnica |
| **Pistas modal** | ~60 | Lista de 7 MP3s con botones descargar (NEW) |
| Responsive media | ~50 | `@media (max-width:430px)` adjusts |
| **JavaScript** | | |
| Tab/page logic | ~500 | `openTech()`, `goHome()`, multi-page state |
| Camera engine | ~300 | `startCamTracking(onFrame)`, `getUserMedia`, RAF loop, MediaPipe setup |
| Técnicas individuales | ~800 | 16 × `analyze*()` + timers + renderizado |
| Modo Bestia/Principiante | ~80 | Toggle, badge updates, modo lógica |
| Audio rec/play | ~150 | `getUserMedia` (mic), `AudioContext`, waveform viz |
| Modal handlers | ~100 | Open/close, Escape key, click-outside logic |

## Técnicas implementadas

**Cuerpo (4)**: Aire, Resistencia Exhalación, Calentamiento Mandíbula, Espejo de Vocales  
**Rima (2)**: Palabras/Sonidos, Sin Repetir/Muletillas  
**Voz (4)**: Pitch, Velocidad, Volumen, Prosodia  
**Ingenio (3)**: Conceptos, Multimetría, Doble Sentido  
**Disciplina (3)**: Métrica, Antónimos, Rutina Pre-Audiencia  

**Cámara (3)**: Mandíbula (jawOpen), Vocales (blendshapes), Rutina (movement threshold)

## Atajos de búsqueda

- `SEGS` — duraciones por técnica (normal/bestia/principiante)
- `TECH_INFO` — descripciones modales
- `PISTAS` — array de 7 beats (nuevo)
- `BADGE` — mapeo card-id → nombre técnica (para actualizar badges en modos)
- `BADGE_COLORS` — `{--tc}` CSS vars por card+modo
- MediaPipe: `Face Landmarker`, `.wasm` + `.tflite` desde CDN, `blendshapes`
