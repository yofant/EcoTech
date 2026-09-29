<!doctype html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description"
        content="Contacta a EcoTech para solicitar la recolección de tus equipos o resolver tus dudas sobre nuestros servicios." />
    <title>Contacto | EcoTech</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous" />

    <!-- Tipografía del tema -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Space+Grotesk:wght@500;600;700&display=swap"
        rel="stylesheet" />

    <!-- Sistema de diseño + layout de formularios -->
    <link rel="stylesheet" href="../css/theme.css?v=2" />
    <link rel="stylesheet" href="../css/form-pages.css?v=2" />

    <!-- Iconos -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" />

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body class="form-page">

    <!-- ===================== Navegación ===================== -->
    <nav class="navbar navbar-expand-lg eco-navbar" data-navbar>
        <div class="container">
            <a href="index.php" class="navbar-brand">
                <span class="eco-brand__mark"><i class="bi bi-recycle"></i></span>
                <span class="eco-brand__text"><em>Eco</em>Tech</span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarPrincipal"
                aria-controls="navbarPrincipal" aria-expanded="false" aria-label="Abrir menú de navegación">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarPrincipal">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.php">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="nosotros.html">Nosotros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="servicios.html">Servicios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="productos.html">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="herramientas.html">Tecnología</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link is-active" href="contacto.php" aria-current="page">Contacto</a>
                    </li>
                    <li class="nav-item">
                        <a class="eco-navbar__cta" href="login_user.php">
                            <i class="bi bi-box-arrow-in-right"></i> Ingresar
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <main class="form-shell">
        <div class="container">
            <div class="form-card" data-reveal>
                <div class="form-card__head">
                    <span class="eco-eyebrow">Escríbenos</span>
                    <h1 class="form-card__title">Contáctanos</h1>
                    <p class="form-card__sub">
                        ¿Tienes equipos para donar o necesitas nuestros servicios? Cuéntanos y te respondemos
                        pronto.
                    </p>
                </div>

                <form method="POST" action="../php/smtp_contacto.php" class="eco-form" id="formulario" novalidate>
                    <div class="mb-3">
                        <label class="form-label" for="nombre">Nombre completo</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person"></i></span>
                            <input name="nombre" id="nombre" type="text" class="form-control" placeholder="Nombre"
                                required />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="primer_apellido">Apellido</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person"></i></span>
                            <input name="primer_apellido" id="primer_apellido" type="text" class="form-control"
                                placeholder="Primer apellido" required />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="email">Correo electrónico</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                            <input name="email" id="email" type="email" class="form-control"
                                placeholder="tu@correo.com" required />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="mensaje">Mensaje</label>
                        <textarea name="mensaje" id="mensaje-consulta" class="form-control" rows="4"
                            placeholder="Escribe aquí tu consulta" required></textarea>
                    </div>

                    <div class="mb-4">
                        <label class="eco-check" for="terminos">
                            <input type="checkbox" name="terminos" id="terminos" required />
                            <span>He leído y acepto los <a href="terminos_condiciones.html">términos y
                                    condiciones</a>.</span>
                        </label>
                    </div>

                    <button type="submit" class="eco-btn eco-btn--primary eco-btn--block eco-btn--lg">
                        Enviar información <i class="bi bi-send"></i>
                    </button>
                </form>

                <p class="form-card__foot">
                    Tus datos se tratan conforme a la Ley 1581 de 2012 de protección de datos personales.
                </p>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>

    <script src="../Js/theme.js?v=2"></script>
    <script src="../Js/Valid_checkbox.js?v=2"></script>
    <script src="../Js/alertas.js?v=2"></script>

    <script>
        // Muestra la alerta correspondiente al parámetro ?status= de la URL
        const parametrosUrl = new URLSearchParams(window.location.search);
        const estado = parametrosUrl.get('status');

        if (estado && typeof mostrarAlerta === 'function') {
            mostrarAlerta(estado);
        }
    </script>

</body>

</html>
