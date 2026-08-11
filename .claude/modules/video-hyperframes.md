# Módulo: Videos Promo (HyperFrames)

| Aspecto | Detalle |
|---|---|
| Ubicación | `videos/logo-sting/` |
| Tech | HyperFrames CLI, GSAP, FFmpeg, Chrome Headless Shell |
| Status | 🟡 1 de 3 clips terminado |
| Dependencias | FFmpeg + Chrome Headless Shell instalados en esta máquina (winget + `hyperframes browser ensure`) |
| Files | `videos/logo-sting/index.html` (composición), `renders/video.mp4` (resultado) |

## Qué hace
Serie de 3 clips cortos de motion graphics para redes (9:16). Solo el primero
(logo sting, 4s) está hecho — reproduce el ciclo de tipografías de la portada
rematando en el wordmark real. Costó ~350k tokens de sub-agente por ser una
recreación completa vía el pipeline `motion-graphics` (Director+Builder).

## Funciones/piezas clave
- `BRIEF.md` / `shot-plan.json` — spec del clip
- `index.html` — composición GSAP (timeline pausada, seek-safe)
- Comando de referencia para el PATH de FFmpeg (necesario en cada sesión nueva,
  el shell no relee el PATH del sistema tras instalar):
  `export PATH="/c/Users/asfura/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-8.1.2-full_build/bin:$PATH"`

## Comandos útiles
| Acción | Comando |
|---|---|
| Verificar | `npx hyperframes check .` (desde `videos/logo-sting/`) |
| Capturas de prueba | `npx hyperframes snapshot --at 0,0.9,1.8,2,3.5` |
| Render final | `npx hyperframes render . --skill=motion-graphics -q high -o ./renders/video.mp4` |

## Tarea actual
Clips 2 y 3 (cabezas cantando, transformación Modo Bestia) — **NO recrear con
el pipeline de sub-agentes**. Grabar el sitio real (el usuario lo hace con
Win+G, o reintentar con `chrome-devtools-mcp` si aparece disponible). Ver razón
completa en memoria del asistente: "No recrear con HyperFrames, grabar".
