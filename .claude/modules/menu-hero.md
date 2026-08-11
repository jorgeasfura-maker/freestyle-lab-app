# Módulo: Menú / Hero

| Aspecto | Detalle |
|---|---|
| Ubicación | `index.html` L291-309 (barra de cuenta), L439-514 (cabeza cantando), L761-924 (HTML) |
| Tech | CSS + SVG inline + JS vanilla |
| Status | 🟡 Barra de cuenta es solo maqueta (no hay backend) |
| Dependencias | Ninguna externa |
| Files | `index.html` (único archivo) |

## Qué hace
Grilla de 10 tarjetas de técnicas (2 columnas en móvil, 5 en escritorio ≥1280px).
Arriba, dos cabezas cantando enfrentadas (`.singer.in-hero`) con una llama entre
ambas — animación SVG de trazo, corre siempre. En escritorio aparece una barra
de cuenta (Mi progreso · Ranking · Tienda · Ingresar · Regístrate) que solo
muestra avisos ("todavía no hay cuentas"), no hace nada real.

## Funciones/piezas clave
- `openTech(tech)` (L1830) — abre una técnica
- `goHome()` (L1829) — vuelve al menú
- Clonado de cabeza L1868-1876 (`syncSinger`, `restartSinger`)
- Barra de cuenta: botones `#authProgreso/#authRanking/#authTienda/#authLogin/#authSignup`

## Comandos útiles
Ninguno — HTML plano.

## Tarea actual
Backend de cuentas (registro/login/ranking) — no empezado. Requiere decidir
qué guarda una cuenta antes de construir el backend (ver `progress/decisions.md`).
