# Template de prompt eficiente

Usa esto como primer mensaje de una nueva sesión. Llena cada sección con datos concretos de INDEX.md / modules/*.md.

```markdown
## Contexto
- Módulo: [nombre desde INDEX.md]
- Archivo: [ruta exacta relativa a raíz]
- Estado: [qué funciona hoy, qué no]
- Objetivo: [qué quiero lograr con claridad]

## Pregunta
[pregunta específica — una sola cosa a la vez]

## Restricciones
- Archivos a tocar: [lista]
- No tocar: [lista, e.g. "PISTAS array", "media queries"]
```

## Ejemplo real

```markdown
## Contexto
- Módulo: pistas-gratis
- Archivo: index.html (líneas 1633-1660)
- Estado: 🟢 7 beats en vivo, modal abierto/cierre OK
- Objetivo: Cambiar "Lluvia Urbana" por "Ritmo Callejero" sin tocar el MP3

## Pregunta
Edita el nombre visible de pista-02 en el array PISTAS.

## Restricciones
- Archivos a tocar: index.html (solo la línea del nombre, nada más)
- No tocar: renderPistas(), event listeners, archivos MP3
```
