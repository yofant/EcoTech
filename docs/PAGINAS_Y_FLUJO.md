# Páginas y flujo de navegación

## Mapa de páginas (`html/`)

### Inicio — `index.html`

- Navbar: Login, Servicios, Contacto, Nosotros; logo → `index.html`
- Carrusel (3 imágenes)
- ¿Quiénes somos?, Servicios (3 cards), Equipo, bloque de comentarios (UI), footer
- Estilos: `css/style.css`, Bootstrap 5.3.8, Bootstrap Icons

### Servicios — `servicios.html`

- Textos extensos por servicio: Recolección, Reacondicionamiento, Trazabilidad
- Imagen de trazabilidad con tamaño acotado (`img-servicio-trazabilidad`)
- Navbar (referencia actual): Inicio, Nosotros, Herramientas, Contacto
- Estilos: `css/servicios.css` (tema `#161816`, neón, hover en cards)

### Nosotros — `nosotros.html`

- Tarjetas: Sobre nosotros, Misión/visión/valores, Propuesta, Impacto, cómo trabajamos, métricas, CTA, bloque herramientas
- Estilos: `css/nosotros.css`
- Enlace útil: puede apuntar a `herramientas.html` desde el botón según tu implementación

### Herramientas — `herramientas.html`

- Frontend, Backend, Nube (imágenes y listas de tecnologías)
- Estilos: `css/herramientas.css`

### Login — `login.html`

- POST → `php/login.php`
- Enlace a `Registro.html`
- Estilos: `css/Login.css`

### Registro — `Registro.html`

- POST → `php/registro.php`
- Estilos: `css/Registro.css`

### Contacto — `contacto.html`

- Formulario POST (actualmente `../php/registro.php` — **revisar** en producción)
- Checkbox términos + script `../Js/Valid_checkbox.js`
- Enlace a `terminos_condiciones.html`
- Estilos: `css/Contacto.css`

### Términos — `terminos_condiciones.html`

- Vista legal; botón volver a contacto según diseño
- Estilos: `css/terminos_condiciones.css`

---

## Backend (`php/`)

| Archivo        | Rol |
|----------------|-----|
| `conexion.php` | Conexión MySQL (`mysqli`) |
| `registro.php` | Altas de usuario; hoy puede recibir también el POST de contacto |
| `login.php`    | Autenticación (alinear con hash de contraseña) |

---

## Estilos (`css/`) — resumen

| Hoja | Uso principal |
|------|----------------|
| `style.css` | Landing |
| `servicios.css` | Servicios |
| `nosotros.css` | Nosotros |
| `herramientas.css` | Herramientas |
| `Login.css`, `Registro.css`, `Contacto.css`, `terminos_condiciones.css` | Formularios y legales |

---

## Coherencia del menú (recomendación)

Hoy cada HTML puede tener un subconjunto distinto de enlaces. Para entregas académicas o producción conviene **un mismo orden**, por ejemplo:

Inicio · Servicios · Nosotros · Herramientas · Contacto · (Login / Registro si aplica)

---

**Última revisión:** 29 de marzo de 2026
