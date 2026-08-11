# Módulo: Modos (Bestia / Principiante)

| Aspecto | Detalle |
|---|---|
| Ubicación | `index.html` L142-176 (CSS bestia), L177-231 (CSS principiante), L232-290 (infierno), L1774+ (JS) |
| Tech | CSS custom properties (variables), reescritas por clase en `<body>` |
| Status | 🟢 Estable |
| Dependencias | Ninguna — mismo mecanismo para ambos modos |
| Files | `index.html` (único archivo) |

## Qué hace
Dos modos excluyentes entre sí y con el normal, guardados en `localStorage`
(`flBestia`/`flNovato`). Reescriben las variables CSS raíz (`--stage`, `--ink`,
`--surface`...) sobre `body.bestia-on` / `body.novato-on`, así que TODO cambia
de color sin tocar ninguna otra regla. Bestia = tema infierno (llamas, brasas,
tigre). Principiante = tema pastel (burbujas, bebé). Ambos ajustan la dificultad
de las 10 técnicas vía tabla `SEGS` (n=normal, b=bestia, p=principiante) — ojo:
"más fácil" no siempre es más tiempo (Sin Repetir/Sin Muletillas se invierten).

## Funciones/piezas clave
- `pintarBestia()`, `guardarModo()` (L1774+) — pintan y persisten el modo activo
- `seg(k)`, `palN(l)` — devuelven el valor correcto según modo activo
- Tabla `SEGS` — duración por técnica y modo

## Comandos útiles
Ninguno — HTML plano. Probar: activar el switch correspondiente en el menú.

## Tarea actual
Ninguna pendiente.
