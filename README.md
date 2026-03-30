# EcoTech — Documentación del proyecto

## Descripción

EcoTech es un sitio web corporativo enfocado en la **gestión de residuos electrónicos (RAEE)**, **reacondicionamiento**, **trazabilidad** y promoción de una **economía circular**. El front está maquetado con **HTML5**, **CSS3** y **Bootstrap 5**; el backend puntual con **PHP** y **MySQL**.

## Estructura del proyecto

```
Ecotech/
├── html/
│   ├── index.html              # Inicio: carrusel, nosotros, servicios (cards), equipo, formulario UI
│   ├── servicios.html          # Servicios detallados (recolección, reacondicionamiento, trazabilidad)
│   ├── nosotros.html           # Misión, propuesta, impacto, proceso, métricas, CTA
│   ├── herramientas.html       # Stack: Frontend, Backend, nube (imágenes)
│   ├── login.html              # Inicio de sesión → php/login.php
│   ├── Registro.html           # Registro → php/registro.php
│   ├── contacto.html           # Formulario contacto (ver nota backend abajo)
│   └── terminos_condiciones.html
├── css/
│   ├── style.css               # index.html
│   ├── servicios.css           # servicios.html (tema oscuro + neón / dinamismo)
│   ├── nosotros.css            # nosotros.html
│   ├── herramientas.css        # herramientas.html
│   ├── Login.css, Registro.css, Contacto.css, terminos_condiciones.css
├── Js/
│   └── Valid_checkbox.js       # Validación del checkbox de términos en contacto (cliente)
├── images/                     # Carrusel, servicios, equipo, herramientas (Fronted, Backend, AWS, etc.)
├── php/
│   ├── conexion.php
│   ├── registro.php
│   └── login.php
└── docs/
    ├── PAGINAS_Y_FLUJO.md
    └── VALIDACION.md
```

## Identidad visual

- **Fondo principal**: `#161816`
- **Verdes**: `#2ECC71`, `#39FF14`, sombras neón `#00ff99` (efecto retroiluminado en logo y enlaces con clase `.texto-efecto` / `.logo` donde aplica)
- **Iconografía**: Bootstrap Icons (`index.html`, páginas con tema EcoTech unificado) y Font Awesome en login, registro y contacto

## Páginas principales

| Página        | Archivo              | CSS principal        |
|---------------|----------------------|----------------------|
| Inicio        | `html/index.html`    | `css/style.css`      |
| Servicios     | `html/servicios.html`| `css/servicios.css`  |
| Nosotros      | `html/nosotros.html` | `css/nosotros.css`   |
| Herramientas  | `html/herramientas.html` | `css/herramientas.css` |
| Login / Registro | `login.html`, `Registro.html` | `Login.css`, `Registro.css` |
| Contacto      | `html/contacto.html` | `Contacto.css`       |
| Términos      | `html/terminos_condiciones.html` | `terminos_condiciones.css` |

## JavaScript

- **Bootstrap Bundle** (CDN) en las páginas que lo incluyen (navbar colapsable, etc.).
- **`Js/Valid_checkbox.js`**: en `contacto.html` obliga a marcar términos antes de enviar y usa la API de validación HTML5 (`setCustomValidity`).

## Backend PHP

- **`php/conexion.php`**: conexión MySQL.
- **`php/registro.php`**: procesa registro (y hoy también recibe POST de `contacto.html` — **recomendado** separar en `contacto.php` o cambiar `action` del formulario).
- **`php/login.php`**: login; conviene unificar con contraseñas hasheadas (`password_verify`).

Detalle de pendientes técnicos: **`docs/VALIDACION.md`**.

## Imágenes usadas (referencia)

- Carrusel: `Imagen1.png` … (según `index.html`)
- Servicios en landing: `Recoleccion.png`, `Reacondicionamiento.png`, `Trazabilidad.png`
- Herramientas: `Fronted.png`, `Backend.png`, `AWS.png`
- Nosotros: `propuesta.png`, `Impacto.png`, etc. (según `nosotros.html`)

## Navegación y enlaces

- El menú **no es idéntico en todas las páginas**; conviene unificarlo (ver `docs/PAGINAS_Y_FLUJO.md`).
- Algunos botones del landing pueden seguir con `href="#"` (revisar “Más información”).

## Próximos pasos sugeridos

1. Endpoint dedicado para **contacto** y `action` coherente en el formulario.
2. **Login** con `password_verify` alineado a `password_hash` del registro.
3. Unificar **Bootstrap** (versión e íconos) o documentar la mezcla a propósito.
4. `lang="es"` en todas las páginas con contenido en español.
5. SEO: `meta description`, favicon, títulos por página.

---

**Última actualización:** 29 de marzo de 2026  
**Estado:** En desarrollo — documentación alineada al árbol actual de archivos.
