# EcoTech - Documentacion del proyecto

## Resumen

EcoTech es un proyecto web orientado a la gestion responsable de residuos electronicos (RAEE), el reacondicionamiento de equipos y la promocion de una economia circular. El proyecto combina una capa visual construida con HTML, CSS, Bootstrap y JavaScript, con un backend basico en PHP conectado a MySQL.

La aplicacion hoy funciona como un sitio corporativo con:

- Landing page con presentacion del proyecto, servicios, equipo y formulario visual de comentarios.
- Paginas informativas para servicios, nosotros, herramientas, contacto, terminos y productos.
- Flujo de registro y login conectado a base de datos.

## Tecnologias usadas

- PHP
- MySQL / phpMyAdmin
- HTML5
- CSS3
- Bootstrap 5
- JavaScript
- SweetAlert2
- Bootstrap Icons
- Font Awesome

## Estructura actual del proyecto

```text
Ecotech/
|-- css/
|   |-- Contacto.css
|   |-- herramientas.css
|   |-- Login.css
|   |-- nosotros.css
|   |-- Registro.css
|   |-- servicios.css
|   |-- style.css
|   `-- terminos_condiciones.css
|-- docs/
|   |-- BASE_DE_DATOS.md
|   |-- PAGINAS_Y_FLUJO.md
|   `-- VALIDACION.md
|-- html/
|   |-- contacto.html
|   |-- herramientas.html
|   |-- index.php
|   |-- login_user.php
|   |-- nosotros.html
|   |-- productos.html
|   |-- registro_user.php
|   |-- servicios.html
|   `-- terminos_condiciones.html
|-- images/
|   |-- Imagen1.png
|   |-- Imagen2.png
|   |-- Imagen3.png
|   |-- Imagen4.png
|   |-- Recoleccion.png
|   |-- Reacondicionamiento.png
|   |-- Trazabilidad.png
|   |-- propuesta.png
|   |-- Impacto.png
|   |-- AWS.png
|   |-- Backend.png
|   |-- Fronted.png
|   |-- GitHub.png
|   |-- IA.png
|   |-- Despliegue.png
|   |-- Karoline.jpeg
|   |-- Daniel.jpeg
|   |-- Yofan.jpeg
|   `-- Reci.mp4
|-- Js/
|   |-- alertas.js
|   `-- Valid_checkbox.js
|-- php/
|   |-- conexion.php
|   |-- login.php
|   `-- registro.php
`-- README.md
```

## Paginas principales

| Ruta | Rol |
|---|---|
| `html/index.php` | Landing principal del proyecto |
| `html/servicios.html` | Descripcion extendida de servicios |
| `html/nosotros.html` | Presentacion, impacto, proceso y CTA |
| `html/herramientas.html` | Stack tecnico y herramientas del equipo |
| `html/contacto.html` | Formulario de contacto con validacion de terminos |
| `html/terminos_condiciones.html` | Contenido legal para el formulario |
| `html/login_user.php` | Inicio de sesion |
| `html/registro_user.php` | Registro de usuarios |
| `html/productos.html` | Pagina creada pero aun incompleta |

## Backend disponible

| Archivo | Funcion actual |
|---|---|
| `php/conexion.php` | Conexion `mysqli` a la base de datos `ecotech` |
| `php/registro.php` | Registra usuarios en la tabla `usuarios` usando `password_hash` |
| `php/login.php` | Valida credenciales con `password_verify` y redirige con estados en query string |

## JavaScript disponible

| Archivo | Funcion actual |
|---|---|
| `Js/alertas.js` | Muestra alertas visuales de login y registro con SweetAlert2 |
| `Js/Valid_checkbox.js` | Obliga a aceptar terminos antes de enviar el formulario de contacto |

## Como ejecutar el proyecto en local

1. Coloca el proyecto dentro de `htdocs` de XAMPP.
2. Inicia Apache y MySQL desde el panel de XAMPP.
3. Crea una base de datos llamada `ecotech`.
4. Crea la tabla `usuarios` con las columnas esperadas por el backend.
5. Abre en el navegador la ruta `http://localhost/Ecotech/html/index.php`.

La conexion actual esta definida en `php/conexion.php` con estos valores:

- Servidor: `localhost`
- Usuario: `root`
- Contrasena: vacia
- Base de datos: `ecotech`

La estructura minima esperada para la autenticacion esta documentada en [docs/BASE_DE_DATOS.md](/D:/Xampp/Xampp/htdocs/Ecotech/docs/BASE_DE_DATOS.md).

## Estado actual del proyecto

Lo que ya esta funcionando:

- Landing page y paginas informativas maquetadas.
- Estilos visuales coherentes con identidad EcoTech.
- Registro de usuarios con hash seguro.
- Login con validacion de password hasheado.
- Alertas visuales para flujos de autenticacion.
- Validacion del checkbox de terminos en contacto.

Pendientes importantes detectados en el codigo actual:

- Varias paginas siguen enlazando a `index.html`, pero la entrada real del proyecto es `index.php`.
- `contacto.html` envia el formulario a `php/registro.php`, lo que no corresponde con un flujo de contacto.
- `productos.html` referencia `login.html`, que no existe.
- `productos.html` apunta a `.. /css/productos.css`, pero ese archivo no existe y la ruta tiene un espacio.
- Algunas paginas tienen `lang="en"` aunque el contenido esta en espanol.
- Se mezclan versiones de Bootstrap `5.3.2` y `5.3.8`.

## Documentacion adicional

- [Paginas y flujo](/D:/Xampp/Xampp/htdocs/Ecotech/docs/PAGINAS_Y_FLUJO.md)
- [Validacion y estado tecnico](/D:/Xampp/Xampp/htdocs/Ecotech/docs/VALIDACION.md)
- [Base de datos](/D:/Xampp/Xampp/htdocs/Ecotech/docs/BASE_DE_DATOS.md)

## Ultima revision

- Fecha: 12 de abril de 2026
- Estado: documentacion actualizada segun la estructura real del repositorio
