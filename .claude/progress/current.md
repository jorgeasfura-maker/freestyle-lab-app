# 📍 progress/current.md

| Campo | Valor |
|---|---|
| Fecha | 10-08-2026 |
| Feature en desarrollo | Rediseño visual: orden más profesional + personalización por familia (tipografía + ícono/motivo por familia en las 16 tarjetas, aprobado). Tarjetas más compactas + entrada escalonada al cerrar el splash (`body.cards-in`). El duelo del menú pasó por 3 iteraciones: (1) orbes de mic+anillos — rechazado, "se ve amateur"; (2) bocas SVG dibujadas a mano con fuego/rayo — rechazado, "muy básico"; (3) **actual**: `marca/bocas.svg` (ilustración real de 2 bocas que trajo el usuario, ~4MB/7000 paths) como `<img>`, sin fuego ni rayo — ahora son palabras del vocabulario (`flow`, `eco`, `rima`...) que salen de cada lado y se cruzan al centro (`.choque-palabras`, keyframes `cp-va-der`/`cp-va-izq`). **Pendiente**: confirmar visualmente con el usuario (no se pudo verificar por captura en esta sesión — el panel del navegador no estaba visible del lado de Claude) y evaluar si conviene convertir el SVG a PNG por tiempo de carga (tarda 1-4s en decodificar por su complejidad). Se probó y descartó un prototipo de "tarjeta compacta con hover" |
| Último commit | `b09b19f` (10-ago) — commiteado, sitio en vivo aún en el deploy anterior (falta `netlify deploy --prod`) |
| Sitio en vivo | https://freestyle-lab-app.netlify.app (deploy `6a7a862c297927379c00c091`, 10-ago) — incluye rediseño, duelo de bocas y pista de fondo al azar |
| Checkpoint de seguridad | `versiones/index-2026-08-10-antes-de-rediseno.html` guardado antes de tocar nada |
| Próximo paso | Continuar rediseño: páginas de detalle de técnica (trainer), modales (info/pistas), auth-bar — solo se hizo portada/menú/tarjetas hasta ahora. Nueva feature: pista de fondo al azar al grabar (`startPistaFondo`/`stopPistaFondo`, indicador `#pistaNow`) — reutiliza el array `PISTAS`, se salta en "tempo" (ya tiene su propio metrónomo) |
| Archivos modificados esta sesión | `index.html` (tokens --sp-*/--radius-* en :root, ritmo vertical de hero/modos/bestia-btn, `.fam-head` rediseñado con línea degradada, radios unificados en tcard/bestia-btn/pistas-banner/pista-row, clases `.fam-rima/.fam-voz/.fam-ingenio/.fam-disciplina/.fam-cuerpo` con tipografía propia + `.tcard-motif` ícono SVG por familia en las 16 tarjetas), `.claude/` (INDEX.md, HOT.md, este archivo, launch.json en esquirlafinal apunta a este proyecto) |
| Bloqueos | Ninguno |

## Checkpoints

<!-- checkpoint.sh añade líneas nuevas debajo -->
