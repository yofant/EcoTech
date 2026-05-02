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
$panelesPermitidos = ['resumen', 'usuarios', 'acciones', 'estado'];
$activePanel = $_GET['panel'] ?? 'resumen';

if (!in_array($activePanel, $panelesPermitidos, true)) {
    $activePanel = 'resumen';
}

include("../php/admin_usuarios.php");
include("../php/admin_estados.php");
include("../php/admin_acciones.php");
include("../php/admin_dashboard_data.php");

$metricas = [
    'total' => 0,
    'admins' => 0,
    'clientes' => 0,
    'operadores' => 0
];

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
                <a href="#resumen" class="admin-nav-link <?php echo $activePanel === 'resumen' ? 'active' : ''; ?>" data-panel-target="resumen">
                    <i class="fas fa-chart-line"></i>
                    <span>Resumen</span>
                </a>
                <a href="#usuarios" class="admin-nav-link <?php echo $activePanel === 'usuarios' ? 'active' : ''; ?>" data-panel-target="usuarios">
                    <i class="fas fa-users"></i>
                    <span>Usuarios</span>
                </a>
                <a href="#acciones" class="admin-nav-link <?php echo $activePanel === 'acciones' ? 'active' : ''; ?>" data-panel-target="acciones">
                    <i class="fas fa-bolt"></i>
                    <span>Acciones</span>
                </a>
                <a href="#estado" class="admin-nav-link <?php echo $activePanel === 'estado' ? 'active' : ''; ?>" data-panel-target="estado">
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
                    <article class="panel-card wide-card dashboard-panel <?php echo $activePanel === 'resumen' ? 'is-active' : ''; ?>" id="resumen">
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

                    <article class="panel-card wide-card dashboard-panel <?php echo $activePanel === 'usuarios' ? 'is-active' : ''; ?>" id="usuarios">
                        <div class="panel-heading">
                            <div>
                                <p class="panel-kicker">Gestion de usuarios</p>
                                <h2>Crear, editar y eliminar usuarios</h2>
                            </div>
                            <span class="panel-tag">Base de datos</span>
                        </div>

                        <?php if ($crudMessage) { ?>
                            <div class="admin-alert admin-alert-<?php echo htmlspecialchars($crudMessageType ?? 'success'); ?>">
                                <?php echo htmlspecialchars($crudMessage); ?>
                            </div>
                        <?php } ?>

                        <div class="users-admin-grid">
                            <div class="users-form-card">
                                <div class="users-form-head">
                                    <h3><?php echo $modoFormulario === 'editar' ? 'Editar usuario' : 'Nuevo usuario'; ?></h3>
                                    <p>
                                        <?php echo $modoFormulario === 'editar'
                                            ? 'Actualiza los datos del usuario seleccionado.'
                                            : 'Registra una nueva cuenta administrativa u operativa.'; ?>
                                    </p>
                                </div>

                                <form action="admin_panel.php?panel=usuarios" method="POST" class="admin-user-form">
                                    <input type="hidden" name="crud_action" value="save_user" />
                                    <input type="hidden" name="id" value="<?php echo htmlspecialchars((string) ($usuarioForm['id'] ?? '')); ?>" />

                                    <div class="form-field">
                                        <label for="nombre">Nombre</label>
                                        <input id="nombre" name="nombre" type="text" class="admin-input"
                                            value="<?php echo htmlspecialchars($usuarioForm['nombre'] ?? ''); ?>" required />
                                    </div>

                                    <div class="form-field">
                                        <label for="primer_apellido">Primer apellido</label>
                                        <input id="primer_apellido" name="primer_apellido" type="text" class="admin-input"
                                            value="<?php echo htmlspecialchars($usuarioForm['primer_apellido'] ?? ''); ?>" required />
                                    </div>

                                    <div class="form-field">
                                        <label for="segundo_apellido">Segundo apellido</label>
                                        <input id="segundo_apellido" name="segundo_apellido" type="text" class="admin-input"
                                            value="<?php echo htmlspecialchars($usuarioForm['segundo_apellido'] ?? ''); ?>" required />
                                    </div>

                                    <div class="form-field">
                                        <label for="correo">Correo electronico</label>
                                        <input id="correo" name="correo" type="email" class="admin-input"
                                            value="<?php echo htmlspecialchars($usuarioForm['correo'] ?? ''); ?>" required />
                                    </div>

                                    <div class="form-field">
                                        <label for="rol">Rol</label>
                                        <select id="rol" name="rol" class="admin-input admin-select" required>
                                            <option value="admin" <?php echo ($usuarioForm['rol'] ?? '') === 'admin' ? 'selected' : ''; ?>>Administrador</option>
                                            <option value="cliente" <?php echo ($usuarioForm['rol'] ?? '') === 'cliente' ? 'selected' : ''; ?>>Cliente</option>
                                            <option value="operador" <?php echo ($usuarioForm['rol'] ?? '') === 'operador' ? 'selected' : ''; ?>>Operador</option>
                                            <option value="tecnico" <?php echo ($usuarioForm['rol'] ?? '') === 'tecnico' ? 'selected' : ''; ?>>Tecnico</option>
                                        </select>
                                    </div>

                                    <div class="form-field">
                                        <label for="contrasena">
                                            <?php echo $modoFormulario === 'editar' ? 'Nueva contrasena (opcional)' : 'Contrasena'; ?>
                                        </label>
                                        <input id="contrasena" name="contrasena" type="password" class="admin-input"
                                            <?php echo $modoFormulario === 'editar' ? '' : 'required'; ?> />
                                    </div>

                                    <div class="admin-form-actions">
                                        <button type="submit" class="btn-admin btn-admin-primary">
                                            <?php echo $modoFormulario === 'editar' ? 'Guardar cambios' : 'Crear usuario'; ?>
                                        </button>
                                        <?php if ($modoFormulario === 'editar') { ?>
                                            <a href="admin_panel.php?panel=usuarios" class="btn-admin btn-admin-secondary">Cancelar</a>
                                        <?php } ?>
                                    </div>
                                </form>
                            </div>

                            <div class="users-table-card">
                                <div class="users-table-head">
                                    <h3>Listado completo</h3>
                                    <p><?php echo count($usuarios); ?> usuarios registrados</p>
                                </div>

                                <div class="table-responsive admin-table-wrap">
                                    <table class="table admin-table admin-table-users">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nombre completo</th>
                                                <th>Correo</th>
                                                <th>Rol</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if (count($usuarios) > 0) { ?>
                                                <?php foreach ($usuarios as $usuario) { ?>
                                                    <tr>
                                                        <td>#<?php echo (int) ($usuario['id'] ?? 0); ?></td>
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
                                                        <td>
                                                            <div class="table-actions">
                                                                <a href="admin_panel.php?panel=usuarios&user_action=edit&id=<?php echo (int) ($usuario['id'] ?? 0); ?>"
                                                                    class="btn-table-action btn-table-edit">
                                                                    Editar
                                                                </a>
                                                                <a href="admin_panel.php?panel=usuarios&user_action=delete&id=<?php echo (int) ($usuario['id'] ?? 0); ?>"
                                                                    class="btn-table-action btn-table-delete"
                                                                    data-confirm-delete>
                                                                    Eliminar
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <?php } ?>
                                            <?php } else { ?>
                                                <tr>
                                                    <td colspan="5">No hay usuarios disponibles para mostrar.</td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="panel-card wide-card dashboard-panel <?php echo $activePanel === 'acciones' ? 'is-active' : ''; ?>" id="acciones">
                        <div class="panel-heading">
                            <div>
                                <p class="panel-kicker">Panel de acciones</p>
                                <h2>Acciones administrativas</h2>
                            </div>
                            <span class="panel-tag">Administrador</span>
                        </div>

                        <?php if ($crudAccionMessage) { ?>
                            <div class="admin-alert admin-alert-<?php echo htmlspecialchars($crudAccionMessageType ?? 'success'); ?>">
                                <?php echo htmlspecialchars($crudAccionMessage); ?>
                            </div>
                        <?php } ?>

                        <div class="actions-overview-grid">
                            <article class="metric-card compact-metric-card">
                                <div class="metric-icon"><i class="fas fa-boxes-stacked"></i></div>
                                <div>
                                    <p class="metric-label">Activos</p>
                                    <h2><?php echo $accionesMetricas['activos']; ?></h2>
                                </div>
                            </article>

                            <article class="metric-card compact-metric-card">
                                <div class="metric-icon"><i class="fas fa-file-circle-plus"></i></div>
                                <div>
                                    <p class="metric-label">Reportes</p>
                                    <h2><?php echo $accionesMetricas['reportes']; ?></h2>
                                </div>
                            </article>

                            <article class="metric-card compact-metric-card">
                                <div class="metric-icon"><i class="fas fa-route"></i></div>
                                <div>
                                    <p class="metric-label">Movimientos</p>
                                    <h2><?php echo $accionesMetricas['movimientos']; ?></h2>
                                </div>
                            </article>
                        </div>

                        <div class="actions-admin-grid">
                            <div class="users-form-card">
                                <div class="users-form-head">
                                    <h3>Generar reporte</h3>
                                    <p>Crea un reporte administrativo y guardalo en la base de datos.</p>
                                </div>

                                <form action="admin_panel.php?panel=acciones" method="POST" class="admin-user-form">
                                    <input type="hidden" name="accion_crud_action" value="save_reporte" />

                                    <div class="form-field">
                                        <label for="titulo_reporte">Titulo del reporte</label>
                                        <input
                                            id="titulo_reporte"
                                            name="titulo"
                                            type="text"
                                            class="admin-input"
                                            value="<?php echo htmlspecialchars($reporteForm['titulo'] ?? ''); ?>"
                                            required />
                                    </div>

                                    <div class="form-field">
                                        <label for="descripcion_reporte">Descripcion</label>
                                        <textarea
                                            id="descripcion_reporte"
                                            name="descripcion"
                                            class="admin-input admin-textarea"
                                            rows="6"><?php echo htmlspecialchars($reporteForm['descripcion'] ?? ''); ?></textarea>
                                    </div>

                                    <div class="admin-form-actions">
                                        <button type="submit" class="btn-admin btn-admin-primary">Guardar reporte</button>
                                    </div>
                                </form>
                            </div>

                            <div class="users-table-card">
                                <div class="users-table-head">
                                    <h3>Accesos de administrador</h3>
                                    <p>Funciones clave del rol admin dentro del panel.</p>
                                </div>

                                <div class="quick-links">
                                    <a href="admin_panel.php?panel=usuarios" class="quick-link-card">
                                        <i class="fas fa-users-cog"></i>
                                        <span>Gestionar usuarios</span>
                                    </a>
                                    <a href="admin_panel.php?panel=estado" class="quick-link-card">
                                        <i class="fas fa-list-check"></i>
                                        <span>Controlar estados</span>
                                    </a>
                                    <a href="#acciones-activos" class="quick-link-card">
                                        <i class="fas fa-warehouse"></i>
                                        <span>Supervisar inventario</span>
                                    </a>
                                    <a href="#acciones-historial" class="quick-link-card">
                                        <i class="fas fa-arrow-right-arrow-left"></i>
                                        <span>Revisar trazabilidad</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="action-section-card" id="acciones-activos">
                            <div class="panel-heading">
                                <div>
                                    <p class="panel-kicker">Supervisar inventario</p>
                                    <h2>Activos registrados</h2>
                                </div>
                                <span class="panel-tag">Inventario</span>
                            </div>

                            <div class="table-responsive admin-table-wrap">
                                <table class="table admin-table admin-table-users">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>QR</th>
                                            <th>Activo</th>
                                            <th>Categoria</th>
                                            <th>Estado</th>
                                            <th>Ubicacion</th>
                                            <th>Empresa</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if (count($activosAdmin) > 0) { ?>
                                            <?php foreach ($activosAdmin as $activo) { ?>
                                                <tr>
                                                    <td>#<?php echo (int) ($activo['id_activo'] ?? 0); ?></td>
                                                    <td><?php echo htmlspecialchars($activo['codigo_qr'] ?? ''); ?></td>
                                                    <td><?php echo htmlspecialchars($activo['nombre_activo'] ?? ''); ?></td>
                                                    <td><?php echo htmlspecialchars($activo['categoria'] ?? ''); ?></td>
                                                    <td><?php echo htmlspecialchars($activo['estado'] ?? ''); ?></td>
                                                    <td><?php echo htmlspecialchars($activo['ubicacion'] ?? ''); ?></td>
                                                    <td><?php echo htmlspecialchars($activo['empresa'] ?? ''); ?></td>
                                                </tr>
                                            <?php } ?>
                                        <?php } else { ?>
                                            <tr>
                                                <td colspan="7">Todavia no hay activos registrados en la base de datos.</td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="action-section-card">
                            <div class="panel-heading">
                                <div>
                                    <p class="panel-kicker">Generar reportes</p>
                                    <h2>Reportes recientes</h2>
                                </div>
                                <span class="panel-tag">Reportes</span>
                            </div>

                            <div class="table-responsive admin-table-wrap">
                                <table class="table admin-table admin-table-users">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Titulo</th>
                                            <th>Descripcion</th>
                                            <th>Fecha</th>
                                            <th>Generado por</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if (count($reportesAdmin) > 0) { ?>
                                            <?php foreach ($reportesAdmin as $reporte) { ?>
                                                <tr>
                                                    <td>#<?php echo (int) ($reporte['id_reporte'] ?? 0); ?></td>
                                                    <td><?php echo htmlspecialchars($reporte['titulo'] ?? ''); ?></td>
                                                    <td class="admin-description-cell"><?php echo htmlspecialchars($reporte['descripcion'] ?? 'Sin descripcion'); ?></td>
                                                    <td><?php echo htmlspecialchars($reporte['fecha_generacion'] ?? ''); ?></td>
                                                    <td><?php echo htmlspecialchars($reporte['generado_por_nombre'] ?? 'Sin usuario'); ?></td>
                                                </tr>
                                            <?php } ?>
                                        <?php } else { ?>
                                            <tr>
                                                <td colspan="5">Todavia no hay reportes registrados en el sistema.</td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="action-section-card" id="acciones-historial">
                            <div class="panel-heading">
                                <div>
                                    <p class="panel-kicker">Revisar trazabilidad</p>
                                    <h2>Historial de movimientos</h2>
                                </div>
                                <span class="panel-tag">Trazabilidad</span>
                            </div>

                            <div class="table-responsive admin-table-wrap">
                                <table class="table admin-table admin-table-users">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Activo</th>
                                            <th>Estado anterior</th>
                                            <th>Nuevo estado</th>
                                            <th>Fecha</th>
                                            <th>Observaciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if (count($historialAdmin) > 0) { ?>
                                            <?php foreach ($historialAdmin as $historial) { ?>
                                                <tr>
                                                    <td>#<?php echo (int) ($historial['id_historial'] ?? 0); ?></td>
                                                    <td><?php echo htmlspecialchars($historial['nombre_activo'] ?? 'Sin activo'); ?></td>
                                                    <td><?php echo htmlspecialchars($historial['estado_anterior_nombre'] ?? ''); ?></td>
                                                    <td><?php echo htmlspecialchars($historial['nuevo_estado_nombre'] ?? ''); ?></td>
                                                    <td><?php echo htmlspecialchars($historial['fecha_movimiento'] ?? ''); ?></td>
                                                    <td class="admin-description-cell"><?php echo htmlspecialchars($historial['observaciones'] ?? 'Sin observaciones'); ?></td>
                                                </tr>
                                            <?php } ?>
                                        <?php } else { ?>
                                            <tr>
                                                <td colspan="6">Todavia no hay movimientos de trazabilidad registrados.</td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </article>

                    <article class="panel-card wide-card dashboard-panel <?php echo $activePanel === 'estado' ? 'is-active' : ''; ?>" id="estado">
                        <div class="panel-heading">
                            <div>
                                <p class="panel-kicker">Gestion de estados</p>
                                <h2>Crear, editar y eliminar estados de equipos</h2>
                            </div>
                            <span class="panel-tag">Estados</span>
                        </div>

                        <?php if ($crudEstadoMessage) { ?>
                            <div class="admin-alert admin-alert-<?php echo htmlspecialchars($crudEstadoMessageType ?? 'success'); ?>">
                                <?php echo htmlspecialchars($crudEstadoMessage); ?>
                            </div>
                        <?php } ?>

                        <div class="users-admin-grid">
                            <div class="users-form-card">
                                <div class="users-form-head">
                                    <h3><?php echo $modoEstadoFormulario === 'editar' ? 'Editar estado' : 'Nuevo estado'; ?></h3>
                                    <p>
                                        <?php echo $modoEstadoFormulario === 'editar'
                                            ? 'Actualiza el estado seleccionado para los equipos de la empresa.'
                                            : 'Registra un nuevo estado para clasificar equipos e inventario.'; ?>
                                    </p>
                                </div>

                                <form action="admin_panel.php?panel=estado" method="POST" class="admin-user-form">
                                    <input type="hidden" name="estado_crud_action" value="save_estado" />
                                    <input type="hidden" name="id_estado" value="<?php echo htmlspecialchars((string) ($estadoForm['id_estado'] ?? '')); ?>" />

                                    <div class="form-field">
                                        <label for="nombre_estado">Nombre del estado</label>
                                        <input id="nombre_estado" name="nombre_estado" type="text" class="admin-input"
                                            value="<?php echo htmlspecialchars($estadoForm['nombre_estado'] ?? ''); ?>" required />
                                    </div>

                                    <div class="form-field">
                                        <label for="descripcion_estado">Descripcion</label>
                                        <textarea id="descripcion_estado" name="descripcion" class="admin-input admin-textarea"
                                            rows="6"><?php echo htmlspecialchars($estadoForm['descripcion'] ?? ''); ?></textarea>
                                    </div>

                                    <div class="admin-form-actions">
                                        <button type="submit" class="btn-admin btn-admin-primary">
                                            <?php echo $modoEstadoFormulario === 'editar' ? 'Guardar cambios' : 'Crear estado'; ?>
                                        </button>
                                        <?php if ($modoEstadoFormulario === 'editar') { ?>
                                            <a href="admin_panel.php?panel=estado" class="btn-admin btn-admin-secondary">Cancelar</a>
                                        <?php } ?>
                                    </div>
                                </form>
                            </div>

                            <div class="users-table-card">
                                <div class="users-table-head">
                                    <h3>Listado de estados</h3>
                                    <p><?php echo count($estados); ?> estados registrados</p>
                                </div>

                                <div class="table-responsive admin-table-wrap">
                                    <table class="table admin-table admin-table-users">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nombre del estado</th>
                                                <th>Descripcion</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if (count($estados) > 0) { ?>
                                                <?php foreach ($estados as $estado) { ?>
                                                    <tr>
                                                        <td>#<?php echo (int) ($estado['id_estado'] ?? 0); ?></td>
                                                        <td><?php echo htmlspecialchars($estado['nombre_estado'] ?? ''); ?></td>
                                                        <td class="admin-description-cell"><?php echo htmlspecialchars($estado['descripcion'] ?? 'Sin descripcion'); ?></td>
                                                        <td>
                                                            <div class="table-actions">
                                                                <a href="admin_panel.php?panel=estado&estado_action=edit&id_estado=<?php echo (int) ($estado['id_estado'] ?? 0); ?>"
                                                                    class="btn-table-action btn-table-edit">
                                                                    Editar
                                                                </a>
                                                                <a href="admin_panel.php?panel=estado&estado_action=delete&id_estado=<?php echo (int) ($estado['id_estado'] ?? 0); ?>"
                                                                    class="btn-table-action btn-table-delete"
                                                                    data-confirm-delete>
                                                                    Eliminar
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <?php } ?>
                                            <?php } else { ?>
                                                <tr>
                                                    <td colspan="4">No hay estados disponibles para mostrar.</td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
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

    <?php

if (!isset($adminChartData['usuarios'])) {
    $adminChartData['usuarios'] = [
        'labels' => ['Sin datos'],
        'values' => [0]
    ];
}
?>

<script>
    window.ADMIN_CHART_DATA = <?php echo json_encode($adminChartData, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES); ?>;
</script>

<!-- Librerías -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.min.js"></script>

<!-- Tus scripts -->
<script src="../Js/admin_panel_cantidad_equipos.js"></script>
<script src="../Js/admin_panel_cantidad_ubicaciones.js"></script>
<script src="../Js/admin_panel_cantidad_estados.js"></script>
<script src="../Js/admin_panel_cantidad_usuarios.js"></script>
<script src="../Js/admin_panel.js"></script>
</body>

</html>
