# Módulo: Diseño Responsive (Móvil + Escritorio)

| Aspecto | Detalle |
|---|---|
| Ubicación | `index.html` L562-620 aprox. (bloque `@media (min-width:900px)`) |
| Tech | CSS Grid, `display:contents` como truco de layout |
| Status | 🟢 Estable |
| Dependencias | Todo lo demás — este bloque solo AÑADE reglas, nunca reemplaza las de móvil |
| Files | `index.html` (único archivo) |

## Qué hace
Dos diseños distintos por ancho de pantalla. Todo lo que NO está dentro de
`@media (min-width:900px)` es el diseño móvil original y no se toca. Desde
900px: menú en 2 columnas (texto izq., cabezas der.), tarjetas en
`repeat(auto-fill,minmax(200px,1fr))` (4 col a 960px, 5 a 1280px), entrenador
partido en 2 columnas vía envoltorios `.tr-cols/.tr-izq/.tr-der` que en móvil
son invisibles para el layout (`display:contents`).

## Funciones/piezas clave
Sin JS propio — es puramente CSS. La única pieza JS relacionada es que
`.panel` necesitó `position:relative` explícito para que las llamas del modo
bestia (`::after`) no se salieran del recuadro en escritorio (bug real
encontrado y arreglado el 28-jul).

## Comandos útiles
Probar: redimensionar la ventana del navegador cruzando los 900px y 1240px.

## Tarea actual
Ninguna pendiente.
