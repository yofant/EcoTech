# EcoTech - Documentación del Proyecto

## Descripción
EcoTech es una empresa dedicada a la venta de productos tecnológicos con soluciones innovadoras en reciclaje y trazabilidad de equipos.

## Estructura del Proyecto

```
Ecotech/
├── html/
│   └── index.html          # Página principal
├── css/
│   └── styles.css          # Estilos personalizados
└── images/                 # Imágenes del proyecto
```

## Secciones del Sitio Web

### 1. **Navegación**

- [x] Barra de navegación fija con logo "EcoTech"
- [x] Menú responsivo en dispositivos móviles
- [x] Enlazar menú a secciones reales (Inicio, Registrate, Servicios, Contacto, Nosotros)

### 2. **Carrusel de Imágenes**

- [x] 3 slides con imágenes de EcoTech
- [x] Controles para avanzar/retroceder

### 3. **Sección Acerca de Nosotros**

- [x] Descripción de la empresa
- [x] Imagen destacada

### 4. **Servicios**

- [x] 3 tarjetas de servicios
- [x] Cambiar títulos duplicados "Registro" por nombres reales (Recoleccion, Reacondicionamiento, Trazabilidad)
- [ ] Agregar íconos específicos según el servicio
- [x] Descripción única para cada servicio

### 5. **Portafolio**

- [x] 3 proyectos: Recolección, Reacondicionamiento, Trazabilidad
- [x] Imágenes y descripciones
- [ ] **PENDIENTE**: Agregar botones funcionales para ver detalles

### 6. **Equipo**

- [x] 3 tarjetas de miembros del equipo
- [x] Iconos de redes sociales (Facebook, Twitter, LinkedIn, Instagram)
- [x] Reemplazar nombres placeholder por nombres reales
- [x] Cambiar imagen "Persona1.png" por fotos individuales
- [ ] Agregar funcionalidad a iconos de redes sociales

### 7. **Footer / Contacto**

- [x] Sección de contacto agregada con encabezado y texto
- [x] Formulario de contacto básico implementado y centrado
- [ ] **PENDIENTE**: Agregar funcionalidad al formulario (envío real, validación de servidor)
- [ ] **PENDIENTE**: Agregar información de contacto (teléfono, email, dirección)
- [x] Footer básico con derechos de autor añadido
- [ ] **PENDIENTE**: Mejorar footer con enlaces útiles y redes sociales

## Imágenes Requeridas

Verificar que existan todas las imágenes en la carpeta `images/`:

- [x] Imagen1.png, Imagen2.png, Imagen3.png (Carrusel)
- [x] Imagen4.png (Acerca de nosotros)
- [x] Recoleccion.png, Reacondicionamiento.png, Trazabilidad.png (Portafolio)
- [x] Persona1.png (Miembros del equipo - se usa 3 veces)
- [x] **RECOMENDACIÓN**: Cambiar Persona1.png por tres imágenes diferentes (Persona2.png, Persona3.png)

## Estilos CSS

Archivo: `css/styles.css`

- [x] Colores de tema (verde para Eco, tema oscuro general)
- [x] Espaciado de secciones (section-padding)
- [x] Estilos de tarjetas (card)
- [x] Responsividad completa (media queries móviles)
- [x] Animaciones y transiciones (hover y animaciones de logo)
- [x] Hover effects en botones

## Funcionalidad JavaScript

- [ ] Crear archivo `js/script.js` para:
  - Validación de formulario de contacto
  - Envío de emails
  - Animaciones al scroll
  - Efectos interactivos en botones
  - Manejo de enlaces del menú

## Enlaces Internos a Configurar

Todos los enlaces actualmente son `href="#"`:

| Elemento | Ubicación | Estado |
|----------|-----------|--------|
| Logo/Inicio | Navegación | [ ] PENDIENTE |
| Registrate | Navegación | [x] Hecho (en login y registro)
| Servicios | Navegación | [x] Hecho
| Contacto | Navegación | [x] Hecho
| Nosotros | Navegación | [x] Hecho
| Botones "Más información" | Carrusel | [ ] PENDIENTE |
| Botones "Más información" | Servicios | [ ] PENDIENTE |
| Botones "Más información" | Portafolio | [ ] PENDIENTE |
| Iconos sociales | Equipo | [ ] PENDIENTE |

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

- [ ] **PENDIENTE**: Mejorar meta description
- [ ] **PENDIENTE**: Agregar meta keywords relevantes
- [ ] **PENDIENTE**: Agregar Open Graph tags (para redes sociales)
- [ ] **PENDIENTE**: Agregar canonical URL
- [ ] **PENDIENTE**: Crear sitemap.xml
- [ ] **PENDIENTE**: Crear robots.txt

## Seguridad

- [ ] **PENDIENTE**: Implementar HTTPS
- [ ] **PENDIENTE**: Validación de formularios (lado servidor)
- [ ] **PENDIENTE**: Protección CSRF en formularios
- [ ] **PENDIENTE**: Rate limiting en endpoint de contacto

## Próximas Fases

1. **Fase 1**: Completar contenido placeholder (nombres, descripciones)
2. **Fase 2**: Implementar funcionalidad de contacto
3. **Fase 3**: Crear página de registro
4. **Fase 4**: Agregar CMS o panel administrativo
5. **Fase 5**: Implementar carrito de compras (si se vende productos)
6. **Fase 6**: SEO y optimización
7. **Fase 7**: Deploy a servidor en vivo

## Notas Importantes

- El sitio usa **Bootstrap 5.3.8** como framework CSS
- Se utilizan **Bootstrap Icons** para íconos
- El diseño es **fully responsive**
- Color principal: Verde (#28a745 - success)
- Tema general: Oscuro (dark)
- Navegación: Fixed (fija en la parte superior)

---

**Última actualización**: 22 de marzo de 2026
**Estado**: En desarrollo

## Cambios recientes
- Corrección ortográfica: “docuemntacion” → “documentación”
- Fecha actualizada a 22 de marzo de 2026
- Mantener checklist actualizado para fase de revisión
- Nota: realizar deploy solo luego de completar formularios y enlaces internos

