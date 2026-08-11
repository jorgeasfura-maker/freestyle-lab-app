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

## Estado del repo

| Campo | Valor |
|---|---|
| Último commit en master | `b09b19f` (10-ago) — sincroniza técnicas nuevas, duelo animado, pistas gratis y rediseño |
| Feature actual | ✅ Rediseño de orden visual (tokens espaciado/radio, fam-head) — portada/menú/tarjetas hecho, falta trainer/modales/auth-bar |
| Sitio en vivo | https://freestyle-lab-app.netlify.app (deploy `6a78fc7edd545d4d98ad75b2`, 10-ago) — el commit `b09b19f` aún no está deployado a Netlify |
| Técnicas implementadas | 16 (Aire, Vocales, Palabras, Métricas, Resistencia, Doble Sentido, Rima, Voz, Ingenio, Disciplina, Mandíbula, Vocales II, Rutina Pre-Audiencia, + 3 antecesoras) |
| Git | ✅ todo commiteado al día (`b09b19f`) |

## Reglas de oro

1. **Sitio vanilla HTML/CSS/JS**: sin build, sin frameworks. Edita `index.html` y recarga.
2. **Actualizaciones `.claude/`**: al terminar cada sesión, edita `progress/current.md` (fecha, feature, próximo paso).
3. **Cambio del asistente** o cierre por un rato: corre `.claude/scripts/checkpoint.sh "descripción"` (necesita Git Bash).
4. **Deploy a Netlify**: `netlify deploy --prod --dir .` desde la carpeta. Antes de todo deploy, `netlify api listSiteDeploys` para detectar cambios de otra sesión.
5. **MediaPipe + cámara**: no toca git, solo el navegador. Modelo `.wasm` se carga en runtime desde CDN. Todo en blendshapes (jawOpen, mouthStretch, etc.).

## Enlaces rápidos

[HOT.md](HOT.md) · [progress/current.md](progress/current.md) · [progress/decisions.md](progress/decisions.md)
