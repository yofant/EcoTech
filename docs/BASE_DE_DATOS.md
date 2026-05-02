# Base de datos

## Resumen

El proyecto no incluye un archivo `.sql` en el repositorio, pero el backend actual permite inferir la estructura minima necesaria para que funcionen el registro y el login.

Este documento describe esa estructura inferida a partir de:

- `php/conexion.php`
- `php/registro.php`
- `php/login.php`
- Modulos del panel admin (`php/admin_*.php`) y listados en `php/admin_acciones.php`

## Configuracion esperada

`php/conexion.php` usa actualmente:

- Host: `localhost`
- Usuario: `root`
- Contrasena: vacia
- Base de datos: `ecotech`

## Tabla requerida: `usuarios`

Segun `php/registro.php`, la tabla `usuarios` debe aceptar estos campos:

| Columna | Tipo sugerido | Uso |
|---|---|---|
| `id` | `INT` autoincremental | Identificador del usuario |
| `nombre` | `VARCHAR(100)` | Nombre del usuario |
| `primer_apellido` | `VARCHAR(100)` | Primer apellido |
| `segundo_apellido` | `VARCHAR(100)` | Segundo apellido |
| `correo` | `VARCHAR(150)` | Correo unico para login |
| `contrasena` | `VARCHAR(255)` | Hash generado por `password_hash` |
| `rol` | `VARCHAR(50)` | Rol como `admin`, `cliente` u `operador` |

En el panel de administracion del repositorio actual las consultas usan `id_usuario` como clave primaria de `usuarios` (alias `id` en listados). Si tu tabla aun usa `id`, alineala con el codigo o adapta los `SELECT`/`WHERE` en `php/admin_usuarios.php` y `php/login.php`.

## Tabla usada en el admin: `empresas`

Gestionada desde `php/admin_empresas.php`. Columnas esperadas:

| Columna | Tipo sugerido | Uso |
|---|---|---|
| `id_empresa` | `INT` autoincremental | Identificador |
| `nombre` | `VARCHAR(200)` | Nombre comercial (tambien usado en joins como `em.nombre` en activos) |
| `nit` | `VARCHAR(32)` | Identificacion fiscal; conviene `UNIQUE` si la regla de negocio lo exige |
| `direccion` | `VARCHAR(255)` | Direccion |
| `telefono` | `VARCHAR(40)` | Telefono de contacto |
| `correo_contacto` | `VARCHAR(120)` | Correo de contacto |
| `fecha_registro` | `DATETIME` | Fecha de alta; el alta desde el panel puede fijar `NOW()` si el campo se deja vacio |

La eliminacion puede fallar por integridad referencial si existen filas en `activos` con `id_empresa` apuntando a la empresa.

## SQL sugerido

```sql
CREATE DATABASE IF NOT EXISTS ecotech;
USE ecotech;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    primer_apellido VARCHAR(100) NOT NULL,
    segundo_apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Ejemplo de creacion de `empresas` alineado con `php/admin_empresas.php`:

```sql
CREATE TABLE IF NOT EXISTS empresas (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    nit VARCHAR(32) NOT NULL,
    direccion VARCHAR(255) NULL,
    telefono VARCHAR(40) NULL,
    correo_contacto VARCHAR(120) NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_empresas_nit (nit)
);
```

## Relacion con el backend

### Registro

`php/registro.php` ejecuta un `INSERT` con:

- `nombre`
- `primer_apellido`
- `segundo_apellido`
- `correo`
- `contrasena`
- `rol`

La contrasena no se guarda en texto plano. Primero se transforma con `password_hash`.

### Login

`php/login.php` consulta:

```sql
SELECT * FROM usuarios WHERE correo = ?
```

Despues compara la contrasena enviada con el hash almacenado usando `password_verify`.

## Observaciones

- Si el correo no es unico, el login puede devolver resultados ambiguos.
- Si la columna `contrasena` es muy corta, el hash podria truncarse. Por eso se recomienda `VARCHAR(255)`.
- Si se va a desplegar fuera de local, no conviene dejar credenciales directas en `php/conexion.php`.

## Ultima revision

- Fecha: 1 de mayo de 2026
- Estado: documentada la tabla `empresas`, ejemplo SQL y nota sobre `id_usuario` en el admin.
