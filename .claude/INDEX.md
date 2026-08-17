# 🗺️ INDEX — Freestyle Lab

Sitio HTML vanilla + MediaPipe Face Landmarker. 16 técnicas de improvisación para raperos.  
En vivo: https://freestyle-lab-app.netlify.app

## Módulos

| Módulo | Ruta | Estado | Deps | Doc |
|---|---|---|---|---|
| index.html (app monolítica) | `./index.html` | 🟢 | ninguna | [modules/app-principal.md](modules/app-principal.md) |
| Pistas gratis (MP3s) | `./pistas/` | 🟢 | 7 beats reales | [modules/pistas-gratis.md](modules/pistas-gratis.md) |
| Versiones/Backups | `./versiones/` | 🟢 | archivo histórico | — |
| Media (logos, videos) | `./marca/`, `./videos/` | 🟢 | assets estáticos | — |
| Memoria heredada (checkpoints viejos) | `./.claude/memoria-heredada/` | 📦 | archivo, no se lee en sesiones normales | — |
| Prototipos descartados (HTML suelto, intento React, copia intermedia) | `./_archivo-versiones-anteriores/` | 📦 | fuera de git y de Netlify (`.gitignore`/`.netlifyignore`) | — |

## Estado del repo

| Campo | Valor |
|---|---|
| Último commit en master | `9de9713` (15-ago) — modo Circuito + rediseño trainer/modales |
| Feature actual | ✅ Modo Circuito (encadena 2-5 técnicas con descanso). Rediseño "sólido y elegante" ya cubre portada/menú/tarjetas/trainer/modales |
| Sitio en vivo | https://freestyle-lab-app.netlify.app (deploy `6a80ee512db1afaae9fa3d7f`, 15-ago) |
| Técnicas implementadas | 17 — ver detalle completo en [progress/current.md](progress/current.md) |
| Git | ✅ todo commiteado al día (`9de9713`) |
| Memoria | Separada del resto de proyectos: vive toda acá en `.claude/` (15-ago) — antes algunas notas estaban en el pool compartido de esquirlafinal |

## Reglas de oro

1. **Sitio vanilla HTML/CSS/JS**: sin build, sin frameworks. Edita `index.html` y recarga.
2. **Actualizaciones `.claude/`**: al terminar cada sesión, edita `progress/current.md` (fecha, feature, próximo paso).
3. **Cambio del asistente** o cierre por un rato: corre `.claude/scripts/checkpoint.sh "descripción"` (necesita Git Bash).
4. **Deploy a Netlify**: `netlify deploy --prod --dir .` desde la carpeta. Antes de todo deploy, `netlify api listSiteDeploys` para detectar cambios de otra sesión.
5. **MediaPipe + cámara**: no toca git, solo el navegador. Modelo `.wasm` se carga en runtime desde CDN. Todo en blendshapes (jawOpen, mouthStretch, etc.).

## Enlaces rápidos

[HOT.md](HOT.md) · [progress/current.md](progress/current.md) · [progress/decisions.md](progress/decisions.md)
