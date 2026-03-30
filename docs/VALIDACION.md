# Validación y estado técnico — EcoTech

## Inventario de páginas (`html/`)

| Archivo | Contenido resumido |
|---------|-------------------|
| `index.html` | Landing: navbar, carrusel, secciones, equipo, formulario UI, footer |
| `servicios.html` | Servicios extendidos + imágenes |
| `nosotros.html` | Historia, misión, impacto, proceso, métricas, CTA |
| `herramientas.html` | Stack tecnológico (Frontend / Backend / Nube) |
| `login.html` | Login → `php/login.php` |
| `Registro.html` | Registro → `php/registro.php` |
| `contacto.html` | Formulario contacto; script términos |
| `terminos_condiciones.html` | Texto legal |

**Nota:** Las páginas `servicios.html`, `nosotros.html` y `herramientas.html` **existen** y están enlazadas desde distintas partes del sitio; el menú entre páginas puede no ser idéntico (ver `PAGINAS_Y_FLUJO.md`).

---

## Lo que está en buen estado (UI)

- Maquetación responsive con Bootstrap.
- Tema oscuro + acentos verdes y efectos neón reutilizados en varias hojas (`servicios`, `nosotros`, `herramientas`, etc.).
- **Contacto — cliente:** `Js/Valid_checkbox.js` valida el checkbox de términos antes de enviar y muestra mensaje si falta marcar.

---

## Pendientes importantes (backend y coherencia)

### Críticos para datos y seguridad

1. **Contacto → PHP**  
   `contacto.html` sigue enviando a `php/registro.php`. Lo correcto es un handler dedicado (p. ej. `php/contacto.php`) que guarde o envíe mensajes sin mezclar con registro de usuarios.

2. **Login y contraseñas**  
   Si el registro usa `password_hash`, el login debe usar `password_verify()`. Evitar comparar la contraseña en claro con el hash en base de datos.

3. **Credenciales**  
   No subir credenciales reales en `conexion.php` en repositorios públicos; usar variables de entorno en despliegne.

### Calidad y mantenimiento

4. **`lang` del documento**  
   Varias páginas tienen `lang="en"` con texto en español; conviene `lang="es"`.

5. **Versiones CDN**  
   Mezcla Bootstrap 5.3.8 (index) y 5.3.2 (algunos formularios). Unificar o documentar la decisión.

6. **Accesibilidad**  
   Revisar `alt` en todas las imágenes, orden de encabezados, contraste y foco en teclado.

7. **SEO**  
   `meta description`, favicon, títulos descriptivos por página.

---

## Checklist rápido antes de entregar

- [ ] Formulario de contacto con `action` y PHP acordes al alcance del trabajo.
- [ ] Login alineado con hash del registro.
- [ ] Menú coherente en todas las páginas (mismos enlaces donde aplique).
- [ ] `lang="es"` donde el contenido es español.
- [ ] Prueba en móvil / tablet / escritorio.
- [ ] Validador W3C HTML (muestras por página principal).

---

**Última revisión:** 29 de marzo de 2026
