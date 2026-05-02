# Base de datos

## Resumen

El proyecto no incluye un archivo `.sql` en el repositorio, pero el backend actual permite inferir la estructura minima necesaria para que funcionen el registro y el login.

Este documento describe esa estructura inferida a partir de:

- `php/conexion.php`
- `php/registro.php`
- `php/login.php`

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

- Fecha: 12 de abril de 2026
- Estado: documentacion inferida desde el codigo actual
