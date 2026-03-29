## Páginas y flujo de navegación

### Mapa de páginas

- **Home**: `html/index.html`
  - Navbar (links a login/servicios/contacto/nosotros)
  - Carrusel (3 imágenes)
  - Sección “¿Quiénes somos?”
  - Sección “Servicios” (3 cards)
  - Sección “Equipo” (3 cards)
  - Sección “Comentarios y sugerencias” (form UI)
  - Footer

- **Login**: `html/login.html`
  - Form POST a `php/login.php`
  - Link a registro: `Registro.html`

- **Registro**: `html/Registro.html`
  - Form POST a `php/registro.php`

- **Contacto**: `html/contacto.html`
  - Form POST (actualmente) a `php/registro.php` (pendiente corregir)
  - Link a `terminos_condiciones.html`

- **Términos**: `html/terminos_condiciones.html`
  - Botón “Volver” a `contacto.html`

### Backend (carpeta `php/`)

- **`conexion.php`**
  - Conexión MySQL por `mysqli` a DB llamada `prueba` (local).

- **`registro.php`**
  - Recibe POST del registro.
  - Inserta en tabla `user`.
  - Nota: requiere correcciones para hash/confirmación (ver `docs/VALIDACION.md`).

- **`login.php`**
  - Recibe POST de login.
  - Nota: requiere implementación con `password_verify()` (ver `docs/VALIDACION.md`).

### Estilos (carpeta `css/`)

- **Landing**: `css/style.css` (usado por `index.html`)
- **Login**: `css/Login.css`
- **Registro**: `css/Registro.css`
- **Contacto**: `css/Contacto.css`
- **Términos**: `css/terminos_condiciones.css`

