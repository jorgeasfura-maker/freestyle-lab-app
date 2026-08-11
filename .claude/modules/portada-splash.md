# Módulo: Portada / Splash

| Aspecto | Detalle |
|---|---|
| Ubicación | `index.html` L88-141 (CSS portada), L515-689 (CSS splash), L761+ (HTML) |
| Tech | CSS puro, sin JS de terceros |
| Status | 🟢 Estable |
| Dependencias | `marca/freestyle-lab-logos.png` (referencia visual, no se usa en runtime) |
| Files | `index.html` (único archivo) |

## Qué hace
Pantalla de bienvenida (`#splash`) que espera el botón "Entrar" — no se autocierra.
El logo cicla 9 tipografías cada 0.2s y aterriza en el wordmark oficial (Helvetica
Bold, "STYLE" en `--stage`) con golpe de escala + glow.

## Funciones/piezas clave
- `.sp-brand`, `.sp-enter` (CSS, sin JS propio — el ciclo lo maneja un bloque
  inline cerca de L1774+ compartido con `syncSinger`/`restartSinger`)
- Cascada de palabras de fondo: array `CASCADE` (L1148)

## Comandos útiles
- Abrir: doble clic en `index.html`, o `python -m http.server 8123` + navegar
- No hay build/test — HTML plano

## Tarea actual
Ninguna pendiente.
