# Módulo: Entrenador + Motor de Análisis

| Aspecto | Detalle |
|---|---|
| Ubicación | `index.html` L310-438 (CSS trainer), L925-1029 (HTML), L1030-1727 (JS motor+analizadores) |
| Tech | Web Speech API (reconocimiento de voz), Web Audio API (beat), JS vanilla |
| Status | 🟢 Estable (10 técnicas funcionando) |
| Dependencias | Micrófono del navegador; `SpeechRecognition`/`webkitSpeechRecognition` |
| Files | `index.html` (único archivo) |

## Qué hace
Pantalla de entrenamiento: consigna + reloj + grabación + resultado. Reparte
en 2 columnas en escritorio (`.tr-cols/.tr-izq/.tr-der`, envoltorios con
`display:contents` en móvil). El reconocimiento de voz reconstruye el texto
completo en cada evento (no acumula) y fusiona tramos duplicados — Android
entrega resultados acumulativos y eso rompía el conteo (arreglado 27/28-jul).

## Funciones/piezas clave (10 analizadores, uno por técnica)
`analyzeMulti` `analyzePalabras` `countCamaleon` `analyzeTempo` `analyzeCadena`
`analyzeAliteracion` `analyzeTrabalenguas` `analyzeEncadenado` `analyzeSinRepetir`
`analyzeTematica` `analyzeMuletillas`
— más el motor fonético compartido: `phon` `sylWord` `rhymeTail` `lev` (Levenshtein)
`tokenize` (filtra conectores vía `STOP`), y `fusionarTramos` (L1804, reconocimiento de voz).

## Comandos útiles
Ninguno — HTML plano. Para probar un analizador: pegar texto en el `<textarea>`
que aparece tras grabar (o sin grabar, escribiendo directo) y pulsar "Analizar".

## Tarea actual
Ninguna pendiente. Ideas sin implementar: rimas internas, multimetría,
asonancia pura, batalla/duelo, composición.
