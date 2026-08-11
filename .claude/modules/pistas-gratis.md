# Pistas gratis para entrenar

Lead magnet: banner + modal con 7 beats MP3 descargables (10-ago-2026).

## Estado

| Aspecto | Detalle |
|---|---|
| **Implementación** | 🟢 Completa y en vivo |
| **Archivo de archivos** | `./pistas/pista-{01..07}.mp3` |
| **Total** | 7 beats reales (~5.2 MB total) |
| **Nombrado genérico** | Lluvia Urbana, Vinilo Nocturno, etc. (sin referencia a origen) |

## UI

**Banner** (~8px padding, reducido a mitad de altura original)
- Posición: justo debajo del `.home-brand`, antes del `.auth-bar`
- Visible en móvil y desktop
- Headphone emoji + "Descarga 7 beats gratis para entrenar" + botón dorado "Ver pistas →"
- Responsive: subtitle `<span>` hide en `@media (max-width:430px)`

**Modal** (reutiliza `.info-overlay`/`.info-card`)
- ID `#pistasOverlay`, `#pistasList` (7 rows renderizadas desde `PISTAS` array)
- Cierre: botón X, click-outside, Escape key (a la par con modal `#infoOverlay`)
- Cada row: nombre + estilo (e.g. "Boom bap") + botón `↓ MP3`

## Array PISTAS en index.html

```javascript
const PISTAS=[
  {nombre:"Calentamiento Suave", estilo:"Boom bap", archivo:"pistas/pista-01.mp3"},
  {nombre:"Lluvia Urbana", estilo:"Boom bap", archivo:"pistas/pista-02.mp3"},
  // ... 7 total
];
```

**Para editar**: cambiar `.nombre` / `.estilo` en el array. Renderizado automático, zero código extra.  
**Para agregar MP3s nuevos**: copiar a `pistas/pista-NN.mp3` + agregar fila al array.

## Archivos

| Archivo | Tamaño | Origen |
|---|---|---|
| pista-01.mp3 | ~5.2 MB | Concrete Jungle Groove |
| pista-02.mp3 | ~4.7 MB | Concrete Rain (1) |
| pista-03.mp3 | ~3.5 MB | Concrete Rain |
| pista-04.mp3 | ~4.9 MB | Midnight Vinyl (1) |
| pista-05.mp3 | ~5.8 MB | Midnight Vinyl (2) |
| pista-06.mp3 | ~3.8 MB | Midnight Vinyl (3) |
| pista-07.mp3 | ~5.4 MB | Midnight Vinyl |

**LEEME.txt**: instrucciones de reemplazo de archivos (sin tocar código).

## Notas de código

- `escPista()`: sanitizer de HTML entities para nombres/estilos en innerHTML
- `renderPistas()`: genera `<div class="pista-row">` por cada objeto en `PISTAS`
- Event listeners: `#pistasBtn`, `#pistasClose`, click-outside en `#pistasOverlay`, Escape key
