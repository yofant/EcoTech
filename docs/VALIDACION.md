## Validación de la web (estado actual)

### Inventario real de páginas (carpeta `html/`)

- **`index.html`**: Landing principal con navbar, carrusel, “¿Quiénes somos?”, servicios (cards), equipo, formulario básico (solo UI) y footer.
- **`login.html`**: Formulario de inicio de sesión (POST a `php/login.php`).
- **`Registro.html`**: Formulario de registro (POST a `php/registro.php`).
- **`contacto.html`**: Formulario de “Contactanos” (POST a `php/registro.php` actualmente).
- **`terminos_condiciones.html`**: Vista de términos y condiciones.

### Lo que ya está resuelto (OK)

- **UI base con Bootstrap**: navbar fija, secciones, cards, responsive básico.
- **Estructura del proyecto**: separación por `html/`, `css/`, `images/`, `php/`.
- **Registro (backend parcial)**: `php/registro.php` usa `prepare()` y `password_hash()` (aunque necesita correcciones).
- **Términos y condiciones**: existe página y estilo dedicado.

### Lo que falta / pendientes (por prioridad)

#### Críticos (rompen navegación o funcionalidad)

- **Páginas faltantes**: existen enlaces a `html/servicios.html` y `html/nosotros.html`, pero **no están creadas**.
- **Logo sin enlace**: en varias páginas el logo tiene `href="#"` (debería llevar a `index.html`).
- **Contacto enviando a registro**: `contacto.html` hace POST a `php/registro.php` (no corresponde). Falta un handler propio (por ejemplo `php/contacto.php`) o ajustar el action.
- **Login vs contraseñas**:
  - En `php/registro.php` se intenta hashear contraseña.
  - En `php/login.php` se consulta `WHERE correo = ? AND contrasena = ?` (comparación en claro), lo que no funciona correctamente con hash. Debe usarse `password_verify()`.

#### Importantes (calidad y coherencia)

- **Idioma de las páginas**: varias están con `<html lang="en">` aunque el contenido es español (debería ser `es`).
- **Mezcla de CDNs/versiones**: `index.html` usa Bootstrap 5.3.8 + Bootstrap Icons, mientras otras páginas usan Bootstrap 5.3.2 + Font Awesome.
- **Checkbox de términos**: en `contacto.html` existe checkbox pero no se valida/obliga (ni del lado cliente ni servidor).
- **Accesibilidad mínima**: revisar `alt`, contraste, foco de teclado, labels correctos.

#### Opcionales (mejoras)

- **SEO**: `meta description`, OpenGraph, favicon, títulos más descriptivos.
- **Footer**: añadir datos de contacto y enlaces útiles.

### Checklist rápido para “cierre” de entrega

- [ ] Crear `html/servicios.html` y `html/nosotros.html` (o quitar enlaces hasta que existan).
- [ ] Unificar navegación en todas las páginas (mismo menú y enlaces).
- [ ] Implementar backend correcto de login (hash + `password_verify`).
- [ ] Crear endpoint real de contacto (o definir alcance: contacto solo UI).
- [ ] Validar HTML (W3C) y responsive básico (mobile/tablet/desktop).

