---
name: freestyle-lab-html-vanilla
description: "Freestyle Lab se trabaja en HTML vanilla de un solo archivo, NO en React — la migración destruyó el diseño"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: f2ad7aca-112e-4514-818a-a7452d53c30e
  modified: 2026-08-04T16:38:06.835Z
---

Freestyle Lab se desarrolla sobre el **HTML vanilla de un solo archivo**, partiendo siempre del archivo del usuario (`C:\Users\asfura\Downloads\freestyle-lab-app_2.html`). El proyecto React en `Desktop\freestyle-lab-react` quedó abandonado.

**Copia de trabajo activa (desde 4-ago-2026): `C:\Users\asfura\PROYECTO FREESTYLE\index.html`.** Es copia exacta (incluye `.git` con historial) de `C:\Users\asfura\Desktop\freestyle-lab-html`, que el usuario mandó a crear como "nuevo proyecto" tras confundirse con `freestyle-lab-react` en esa misma sesión. La carpeta vieja en Desktop quedó intacta, sin usarse — no editar ahí, todo el trabajo nuevo va en `PROYECTO FREESTYLE`. Ver [[freestyle-lab-checkpoint]] para rutas de subcarpetas (marca/, videos/, versiones/) actualizadas.

**Why:** La migración a React (jul 2026) reescribió el CSS y rompió el diseño que el usuario había creado — quedó "descuadrado, feo", con pantallas en blanco. El usuario rechazó explícitamente esa versión y pidió volver a su HTML. Además el build de React no abre desde `file://` (módulos ES), mientras que el HTML vanilla sí abre con doble clic.

**How to apply:** Para agregar una técnica o cambio, hacer ediciones quirúrgicas sobre el HTML existente: tarjeta en `.cards-home`, función `analyzeXxx()`, rama en `openTech()` y `newItem()`, rama en `onPrimary()`, y un `addEventListener` en la sección de eventos. Nunca reescribir el CSS ni el motor fonético. Verificar en navegador con servidor local antes de entregar (`python -m http.server --directory`), probando que las técnicas previas siguen intactas. Ver [[freestyle-lab-checkpoint]].
