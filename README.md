# EcoTech - Documentación del Proyecto

## Descripción
EcoTech es una empresa dedicada a la venta de productos tecnológicos con soluciones innovadoras en reciclaje y trazabilidad de equipos.

## Estructura del Proyecto

```
Ecotech/
├── html/
│   ├── index.html                 # Landing (home) + secciones
│   ├── login.html                 # Inicio de sesión (form)
│   ├── Registro.html              # Registro de usuario (form)
│   ├── contacto.html              # Página de contacto (form)
│   └── terminos_condiciones.html  # Términos y condiciones (vista)
├── css/
│   ├── style.css                  # Estilos de `index.html`
│   ├── Login.css                  # Estilos de `login.html`
│   ├── Registro.css               # Estilos de `Registro.html`
│   ├── Contacto.css               # Estilos de `contacto.html`
│   └── terminos_condiciones.css   # Estilos de `terminos_condiciones.html`
└── images/                 # Imágenes del proyecto
└── php/
    ├── conexion.php               # Conexión MySQL
    ├── registro.php               # Handler POST registro
    └── login.php                  # Handler POST login
```

## Secciones del Sitio Web

### 1. **Navegación**

- [x] Barra de navegación fija con logo "EcoTech"
- [x] Menú responsivo en dispositivos móviles
- [~] Enlaces del menú configurados parcialmente
  - `index.html` enlaza a `login.html`, `contacto.html` y (pendiente) `nosotros.html`
  - `login.html` y `Registro.html` enlazan a `servicios.html`/`nosotros.html` pero esas páginas **no existen aún**
  - `contacto.html` tiene enlace a Inicio/Servicios pero “Nosotros” apunta a `servicios.html` (pendiente corregir)

### 2. **Carrusel de Imágenes**

- [x] 3 slides con imágenes de EcoTech
- [x] Controles para avanzar/retroceder

### 3. **Sección Acerca de Nosotros**

- [x] Descripción de la empresa
- [x] Imagen destacada

### 4. **Servicios**

- [x] 3 tarjetas de servicios
- [x] Cambiar títulos duplicados "Registro" por nombres reales (Recoleccion, Reacondicionamiento, Trazabilidad)
- [ ] Agregar íconos específicos según el servicio (opcional)
- [x] Descripción única para cada servicio

### 6. **Equipo**

- [x] 3 tarjetas de miembros del equipo
- [x] Íconos de redes sociales (Facebook, Twitter, LinkedIn, Instagram) visibles (sin enlaces)
- [x] Reemplazar nombres placeholder por nombres reales
- [x] Fotos individuales configuradas (3 imágenes `.jpeg`)
- [ ] Agregar enlaces reales a iconos de redes sociales

### 7. **Footer / Contacto**

- [x] Formulario de contacto existe (`contacto.html`)
- [~] Envío del formulario (pendiente)
  - Actualmente `contacto.html` envía a `php/registro.php` (no corresponde a contacto)
  - Falta endpoint/handler específico de contacto (o cambiar acción a un endpoint correcto)
- [x] Footer básico con derechos de autor añadido
- [ ] Mejorar footer con enlaces útiles y redes sociales (opcional)

## Imágenes Requeridas

Verificar que existan todas las imágenes en la carpeta `images/`:

- [x] Imagen1.png, Imagen2.png, Imagen3.png (Carrusel)
- [x] Imagen4.png (Acerca de nosotros)
- [x] Recoleccion.png, Reacondicionamiento.png, Trazabilidad.png (Servicios)
- [x] Fotos del equipo en `.jpeg` (3 imágenes)

## Estilos CSS
- **`css/style.css`**: estilos del landing (`index.html`), tema oscuro + verde, navbar, carrusel, cards, responsive.
- **`css/Login.css`, `css/Registro.css`, `css/Contacto.css`**: estilos de formularios (vistas separadas).
- **`css/terminos_condiciones.css`**: estilos de términos.

## Funcionalidad JavaScript

- [ ] No hay JS propio actualmente (solo Bootstrap bundle por CDN).
- [ ] (Opcional) Crear `js/script.js` para validaciones UI y/o mejorar UX.

## Enlaces Internos a Configurar
- **Pendientes críticos**
  - [ ] Crear `html/servicios.html` (está linkeado desde varias páginas)
  - [ ] Crear `html/nosotros.html` (está linkeado desde varias páginas)
  - [ ] Cambiar `href="#"` del logo en varias páginas a `index.html`
  - [ ] Conectar botones “Más información” del landing a secciones o páginas reales
  - [ ] Convertir íconos sociales en enlaces reales (`<a href="...">`)

## Validación y Testing

- [ ] Validar HTML con W3C Validator
- [ ] Probar responsividad en:
  - [ ] Dispositivos móviles (320px+)
  - [ ] Tablets (768px+)
  - [ ] Desktop (1024px+)
- [ ] Probar compatibilidad de navegadores:
  - [ ] Chrome
  - [ ] Firefox
  - [ ] Safari
  - [ ] Edge
- [ ] Prueba de rendimiento y velocidad
- [ ] Verificar accesibilidad (WCAG)

## SEO y Meta Información

- [ ] Mejorar `<title>` y agregar `meta description` en todas las páginas
- [ ] (Opcional) Open Graph tags y favicon
- [ ] (Opcional) `sitemap.xml` y `robots.txt`

## Seguridad

- [ ] Validación lado servidor (ya hay handlers PHP, pero requieren ajustes)
- [ ] CSRF en formularios (cuando se publique)
- [ ] Evitar credenciales hardcodeadas en `php/conexion.php` al hacer deploy

## Próximas Fases

1. **Fase 1**: Completar contenido placeholder (nombres, descripciones)
2. **Fase 2**: Completar páginas faltantes (`servicios.html`, `nosotros.html`) y enlaces
3. **Fase 3**: Ajustar backend PHP (registro/login/contacto) y base de datos
4. **Fase 4**: SEO y optimización
5. **Fase 5**: Deploy a servidor en vivo

## Notas Importantes

- `index.html` usa **Bootstrap 5.3.8** + **Bootstrap Icons**.
- `login.html`, `Registro.html`, `contacto.html`, `terminos_condiciones.html` usan **Bootstrap 5.3.2** + **Font Awesome** (hay mezcla de versiones/CDNs).
- Color principal: Verde (#28a745 - success)
- Tema general: Oscuro (dark)
- Navegación: Fixed (fija en la parte superior)

---

**Última actualización**: 29 de marzo de 2026
**Estado**: En desarrollo

## Cambios recientes
- README alineado a archivos reales (`html/`, `css/`, `php/`) y pendientes reales.

