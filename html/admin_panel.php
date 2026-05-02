<?php
session_start();

if (!isset($_SESSION['usuario'])) {
    header("Location: login_user.php?status=session_expired");
    exit();
}

if (($_SESSION['usuario']['rol'] ?? '') !== 'admin') {
    header("Location: login_user.php?status=admin_only");
    exit();
}

include("../php/conexion.php");

$adminNombre = $_SESSION['usuario']['nombre'] ?: 'Administrador';

$metricas = [
    'total' => 0,
    'admins' => 0,
    'clientes' => 0,
    'operadores' => 0
];

$usuarios = [];

$consultaMetricas = "
    SELECT
        COUNT(*) AS total,
        SUM(CASE WHEN rol = 'admin' THEN 1 ELSE 0 END) AS admins,
        SUM(CASE WHEN rol = 'cliente' THEN 1 ELSE 0 END) AS clientes,
        SUM(CASE WHEN rol = 'operador' THEN 1 ELSE 0 END) AS operadores
    FROM usuarios
";

$resultadoMetricas = $conn->query($consultaMetricas);

if ($resultadoMetricas && $resultadoMetricas->num_rows > 0) {
    $filaMetricas = $resultadoMetricas->fetch_assoc();
    $metricas['total'] = (int) ($filaMetricas['total'] ?? 0);
    $metricas['admins'] = (int) ($filaMetricas['admins'] ?? 0);
    $metricas['clientes'] = (int) ($filaMetricas['clientes'] ?? 0);
    $metricas['operadores'] = (int) ($filaMetricas['operadores'] ?? 0);
}

$consultaUsuarios = "
    SELECT nombre, primer_apellido, segundo_apellido, correo, rol
    FROM usuarios
    LIMIT 6
";

$resultadoUsuarios = $conn->query($consultaUsuarios);

if ($resultadoUsuarios) {
    while ($fila = $resultadoUsuarios->fetch_assoc()) {
        $usuarios[] = $fila;
    }
}

$conn->close();
?>
<!doctype html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Panel de Administracion</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/admin.css" />
</head>

<body class="admin-body">
    <div class="admin-shell">
        <aside class="admin-sidebar">
            <div>
                <a href="index.php" class="admin-brand">
                    <span class="brand-eco">Eco</span>Tech
                </a>
                <p class="admin-caption">Panel de administracion</p>
            </div>

            <nav class="admin-nav">
                <a href="#resumen" class="admin-nav-link active" data-panel-target="resumen">
                    <i class="fas fa-chart-line"></i>
                    <span>Resumen</span>
                </a>
                <a href="#usuarios" class="admin-nav-link" data-panel-target="usuarios">
                    <i class="fas fa-users"></i>
                    <span>Usuarios</span>
                </a>
                <a href="#acciones" class="admin-nav-link" data-panel-target="acciones">
                    <i class="fas fa-bolt"></i>
                    <span>Acciones</span>
                </a>
                <a href="#estado" class="admin-nav-link" data-panel-target="estado">
                    <i class="fas fa-shield-halved"></i>
                    <span>Estado</span>
                </a>
            </nav>

            <div class="sidebar-card">
                <h3>Sesion activa</h3>
                <p><?php echo htmlspecialchars($adminNombre); ?></p>
                <span class="role-badge">Administrador</span>
            </div>
        </aside>

        <main class="admin-main">
            <section class="hero-panel">
                <div>
                    <p class="eyebrow">Centro de control EcoTech</p>
                    <h1>Bienvenido, <?php echo htmlspecialchars($adminNombre); ?></h1>
                    <p class="hero-copy">
                        Supervision del acceso de usuarios, revisar el estado general de la plataforma
                        y organizar las tareas operativas del proyecto.
                    </p>
                </div>

                <div class="hero-actions">
                    <a href="index.php" class="btn-admin btn-admin-secondary">Ver sitio</a>
                    <a href="../php/logout.php" class="btn-admin btn-admin-primary">Cerrar sesion</a>
                </div>
            </section>

            <section class="metrics-grid" id="metricas-resumen">
                <article class="metric-card">
                    <div class="metric-icon"><i class="fas fa-users"></i></div>
                    <div>
                        <p class="metric-label">Usuarios registrados</p>
                        <h2><?php echo $metricas['total']; ?></h2>
                    </div>
                </article>

                <article class="metric-card">
                    <div class="metric-icon"><i class="fas fa-user-shield"></i></div>
                    <div>
                        <p class="metric-label">Administradores</p>
                        <h2><?php echo $metricas['admins']; ?></h2>
                    </div>
                </article>

                <article class="metric-card">
                    <div class="metric-icon"><i class="fas fa-user"></i></div>
                    <div>
                        <p class="metric-label">Clientes</p>
                        <h2><?php echo $metricas['clientes']; ?></h2>
                    </div>
                </article>

                <article class="metric-card">
                    <div class="metric-icon"><i class="fas fa-user-gear"></i></div>
                    <div>
                        <p class="metric-label">Operadores</p>
                        <h2><?php echo $metricas['operadores']; ?></h2>
                    </div>
                </article>
            </section>

            <section class="content-grid">
                <div class="panel-stack">
                    <article class="panel-card wide-card dashboard-panel is-active" id="resumen">
                        <div class="panel-heading panel-heading-chart">
                            <div class="panel-heading-text">
                                <p class="panel-kicker">Resumen Dashboard</p>
                                <h2>Dashboard de la plataforma</h2>
                            </div>
    
                            <span class="panel-tag">Administrador</span>
                        </div>

                        <div class="action-board">
                            <div class="action-board-item action-board-item--chart">
                                <div class="action-board-chart-head">
                                    <div class="action-board-icon" aria-hidden="true"><i class="fas fa-gauge-high"></i></div>
                                    <h3>Equipos</h3>
                                </div>
                                <div class="action-board-chart-stage">
                                    <div class="panel-chart-wrap">
                                        <canvas class="panel-chart-canvas" data-admin-chart="equipos" aria-label="Grafico equipos"></canvas>
                                    </div>
                                </div>
                            </div>

                            <div class="action-board-item action-board-item--chart">
                                <div class="action-board-chart-head">
                                    <div class="action-board-icon" aria-hidden="true"><i class="fas fa-gauge-high"></i></div>
                                    <h3>Ubicaciones</h3>
                                </div>
                                <div class="action-board-chart-stage">
                                    <div class="panel-chart-wrap">
                                        <canvas class="panel-chart-canvas" data-admin-chart="ubicaciones" aria-label="Grafico ubicaciones"></canvas>
                                    </div>
                                </div>
                            </div>

                            <div class="action-board-item action-board-item--chart">
                                <div class="action-board-chart-head">
                                    <div class="action-board-icon" aria-hidden="true"><i class="fas fa-gauge-high"></i></div>
                                    <h3>Estados</h3>
                                </div>
                                <div class="action-board-chart-stage">
                                    <div class="panel-chart-wrap">
                                        <canvas class="panel-chart-canvas" data-admin-chart="estados" aria-label="Grafico estados"></canvas>
                                    </div>
                                </div>
                            </div>

                            <div class="action-board-item action-board-item--chart">
                                <div class="action-board-chart-head">
                                    <div class="action-board-icon" aria-hidden="true"><i class="fas fa-gauge-high"></i></div>
                                    <h3>Usuarios</h3>
                                </div>
                                <div class="action-board-chart-stage">
                                    <div class="panel-chart-wrap">
                                        <canvas class="panel-chart-canvas" data-admin-chart="usuarios" aria-label="Grafico usuarios"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="panel-card wide-card dashboard-panel" id="usuarios">
                        <div class="panel-heading">
                            <div>
                                <p class="panel-kicker">Vista rapida</p>
                                <h2>Usuarios disponibles</h2>
                            </div>
                            <span class="panel-tag">Base de datos</span>
                        </div>

                        <div class="table-responsive">
                            <table class="table admin-table">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Correo</th>
                                        <th>Rol</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (count($usuarios) > 0) { ?>
                                        <?php foreach ($usuarios as $usuario) { ?>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $nombreCompleto = trim(
                                                        ($usuario['nombre'] ?? '') . ' ' .
                                                        ($usuario['primer_apellido'] ?? '') . ' ' .
                                                        ($usuario['segundo_apellido'] ?? '')
                                                    );
                                                    echo htmlspecialchars($nombreCompleto);
                                                    ?>
                                                </td>
                                                <td><?php echo htmlspecialchars($usuario['correo'] ?? ''); ?></td>
                                                <td>
                                                    <span class="role-pill role-<?php echo htmlspecialchars($usuario['rol'] ?? ''); ?>">
                                                        <?php echo htmlspecialchars(ucfirst($usuario['rol'] ?? 'Sin rol')); ?>
                                                    </span>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                    <?php } else { ?>
                                        <tr>
                                            <td colspan="3">No hay usuarios disponibles para mostrar.</td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </article>

                    <article class="panel-card wide-card dashboard-panel" id="acciones">
                        <div class="panel-heading">
                            <div>
                                <p class="panel-kicker">Panel de acciones</p>
                                <h2>Acciones operativas</h2>
                            </div>
                            <span class="panel-tag">Administrador</span>
                        </div>

                        <div class="action-board">
                            <div class="action-board-item">
                                <div class="action-board-icon"><i class="fas fa-user-plus"></i></div>
                                <div>
                                    <h3>Gestionar accesos</h3>
                                    <p>Valida usuarios, revisa permisos y organiza que cuentas deben mantenerse activas.</p>
                                </div>
                            </div>

                            <div class="action-board-item">
                                <div class="action-board-icon"><i class="fas fa-recycle"></i></div>
                                <div>
                                    <h3>Coordinar procesos</h3>
                                    <p>Usa este bloque para conectar futuros modulos de recoleccion, clasificacion y reacondicionamiento.</p>
                                </div>
                            </div>

                            <div class="action-board-item">
                                <div class="action-board-icon"><i class="fas fa-chart-column"></i></div>
                                <div>
                                    <h3>Preparar reportes</h3>
                                    <p>Deja listo el espacio para reportes de usuarios, productos, inventario y trazabilidad.</p>
                                </div>
                            </div>

                            <div class="action-board-item">
                                <div class="action-board-icon"><i class="fas fa-screwdriver-wrench"></i></div>
                                <div>
                                    <h3>Configurar modulos</h3>
                                    <p>Agrega aqui accesos directos a CRUD, formularios administrativos y herramientas internas.</p>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="panel-card wide-card dashboard-panel" id="estado">
                        <div class="panel-heading">
                            <div>
                                <p class="panel-kicker">Estado general</p>
                                <h2>Prioridades del panel</h2>
                            </div>
                            <span class="panel-tag">Seguimiento</span>
                        </div>

                        <ul class="status-list">
                            <li>
                                <span class="status-dot"></span>
                                Consolidar una gestion real de solicitudes de contacto.
                            </li>
                            <li>
                                <span class="status-dot"></span>
                                Completar el modulo de productos para mostrar equipos reacondicionados.
                            </li>
                            <li>
                                <span class="status-dot"></span>
                                Unificar navegacion y rutas del sitio para mejorar la experiencia.
                            </li>
                            <li>
                                <span class="status-dot"></span>
                                Extender este panel con CRUD de usuarios y reportes operativos.
                            </li>
                        </ul>
                    </article>
                </div>

                <div class="secondary-column">
                    <article class="panel-card mini-card">
                        <div class="panel-heading">
                            <div>
                                <p class="panel-kicker">Atajos</p>
                                <h2>Accesos rapidos</h2>
                            </div>
                        </div>

                        <div class="quick-links">
                            <a href="index.php" class="quick-link-card">
                                <i class="fas fa-globe"></i>
                                <span>Ver sitio publico</span>
                            </a>
                            <a href="contacto.html" class="quick-link-card">
                                <i class="fas fa-envelope"></i>
                                <span>Ir a contacto</span>
                            </a>
                            <a href="registro_user.php" class="quick-link-card">
                                <i class="fas fa-user-plus"></i>
                                <span>Registrar usuario</span>
                            </a>
                        </div>
                    </article>

                    <article class="panel-card mini-card">
                        <div class="panel-heading">
                            <div>
                                <p class="panel-kicker">Resumen rapido</p>
                                <h2>Estado del sistema</h2>
                            </div>
                        </div>

                        <div class="summary-list">
                            <div class="summary-row">
                                <span>Base de datos</span>
                                <strong>Conectada</strong>
                            </div>
                            <div class="summary-row">
                                <span>Sesion admin</span>
                                <strong>Activa</strong>
                            </div>
                            <div class="summary-row">
                                <span>Panel visible</span>
                                <strong>Dinamico</strong>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
        </main>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="../Js/admin_panel_cantidad_equipos.js"></script>
    <script src="../Js/admin_panel_cantidad_ubicaciones.js"></script>
    <script src="../Js/admin_panel_cantidad_estados.js"></script>
    <script src="../Js/admin_panel_cantidad_usuarios.js"></script>
    <script>
        const navLinks = document.querySelectorAll('.admin-nav-link[data-panel-target]');
        const dashboardPanels = document.querySelectorAll('.dashboard-panel');

        navLinks.forEach((link) => {
            link.addEventListener('click', (event) => {
                event.preventDefault();

                const targetId = link.dataset.panelTarget;

                navLinks.forEach((navLink) => navLink.classList.remove('active'));
                link.classList.add('active');

                dashboardPanels.forEach((panel) => panel.classList.remove('is-active'));

                const targetPanel = document.getElementById(targetId);
                if (targetPanel) {
                    targetPanel.classList.add('is-active');
                    targetPanel.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            });
        });
    </script>
</body>

</html>
