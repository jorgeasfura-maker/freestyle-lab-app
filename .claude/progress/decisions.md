# Decisiones arquitectónicas

| Fecha | Decisión | Alternativas descartadas | Razón | Impacto |
|---|---|---|---|---|
| 10-08-2026 | Pistas gratis: banner reducido 50%, 7 beats reales en `./pistas/`, nombres genéricos | Mantener 10 beats placeholder; crear tabla de metadatos JSON | Usuario trajo 7 MP3s reales de una sola vez; reducir banner evita cansar el eye (ya hay auth-bar) | Array PISTAS permite editar nombres/estilos sin tocar código. Modal reutiliza pattern `.info-overlay` existente |
| 02-08-2026 | git init + sistema `.claude/` para continuidad | Seguir con copias manuales en `versiones/` | El usuario pidió continuidad entre sesiones sin depender de memoria externa al proyecto | `checkpoint.sh` ahora hace commits reales con tag |
| 01-08-2026 | Sitio Netlify: crear `freestyle-lab-app` nuevo | Reusar `freestyleworldlab` o `freestylelaboratory` (existentes, desactualizados desde 26-jul) | Ambos ambiguos, no se sabía cuál era "el oficial" | Los dos sitios viejos quedan sin usar, no borrados |
| 30-07-2026 | Grabar clips 2/3 en vez de recrearlos con HyperFrames | Pipeline completo Director+Builder (como el clip 1) | El clip 1 costó ~350k tokens de sub-agente para reproducir algo que el sitio ya animaba solo — el usuario lo marcó como gasto innecesario | Clips 2/3 quedaron pendientes; automatizar grabación de pantalla por PowerShell resultó frágil, se abandonó también |
| 28-07-2026 | `position:relative` explícito en `.panel` | — | Las llamas del modo bestia (`::after`) se posicionaban contra `.app` y se salían 72px por lado en escritorio | Bug de scroll horizontal resuelto |
| 27-07-2026 | Reemplazar logo Aqua Grotesque por wordmark Helvetica (lámina de marca) | Mantener Aqua Grotesque | El usuario trajo una lámina de marca nueva y pidió reemplazar | Se quitó la fuente incrustada en base64 (archivo bajó ~48KB) |
| 26-07-2026 | HTML vanilla de un solo archivo, no React | Migración a React (se había intentado) | La migración rompió el diseño existente | Todo el proyecto vive en un único `index.html` |
