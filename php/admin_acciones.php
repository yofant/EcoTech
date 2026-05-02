<?php
if (!defined('ECOTECH_ADMIN_ACCIONES')) {
    define('ECOTECH_ADMIN_ACCIONES', true);

    $crudAccionMessage = null;
    $crudAccionMessageType = null;
    $reporteForm = [
        'titulo' => '',
        'descripcion' => ''
    ];
    $accionesMetricas = [
        'activos' => 0,
        'reportes' => 0,
        'movimientos' => 0
    ];
    $activosAdmin = [];
    $reportesAdmin = [];
    $historialAdmin = [];

    if (!function_exists('adminAccionesRedirect')) {
        function adminAccionesRedirect($params = [])
        {
            $query = http_build_query(array_merge(['panel' => 'acciones'], $params));
            header("Location: ../html/admin_panel.php?$query");
            exit();
        }
    }

    $accionCrudStatus = $_GET['accion_crud_status'] ?? '';

    if ($accionCrudStatus === 'report_created') {
        $crudAccionMessage = 'Reporte generado correctamente.';
        $crudAccionMessageType = 'success';
    } elseif ($accionCrudStatus === 'report_invalid') {
        $crudAccionMessage = 'Debes completar al menos el titulo del reporte.';
        $crudAccionMessageType = 'error';
    } elseif ($accionCrudStatus === 'report_user_error') {
        $crudAccionMessage = 'No fue posible identificar al administrador que genera el reporte.';
        $crudAccionMessageType = 'error';
    } elseif ($accionCrudStatus === 'report_db_error') {
        $crudAccionMessage = 'Ocurrio un error al guardar el reporte en la base de datos.';
        $crudAccionMessageType = 'error';
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && (($_POST['accion_crud_action'] ?? '') === 'save_reporte')) {
        $tituloReporte = trim($_POST['titulo'] ?? '');
        $descripcionReporte = trim($_POST['descripcion'] ?? '');

        $reporteForm = [
            'titulo' => $tituloReporte,
            'descripcion' => $descripcionReporte
        ];

        if ($tituloReporte === '') {
            adminAccionesRedirect(['accion_crud_status' => 'report_invalid']);
        }

        $correoAdmin = $_SESSION['usuario']['correo'] ?? '';
        $consultaAdmin = $conn->prepare("SELECT id_usuario FROM usuarios WHERE correo = ? LIMIT 1");
        $consultaAdmin->bind_param("s", $correoAdmin);
        $consultaAdmin->execute();
        $resultadoAdmin = $consultaAdmin->get_result();
        $adminActual = $resultadoAdmin->fetch_assoc();
        $consultaAdmin->close();

        if (!$adminActual || !isset($adminActual['id_usuario'])) {
            adminAccionesRedirect(['accion_crud_status' => 'report_user_error']);
        }

        $idAdmin = (int) $adminActual['id_usuario'];
        $stmtReporte = $conn->prepare("
            INSERT INTO reportes (titulo, descripcion, generado_por)
            VALUES (?, ?, ?)
        ");
        $stmtReporte->bind_param("ssi", $tituloReporte, $descripcionReporte, $idAdmin);

        if ($stmtReporte->execute()) {
            $stmtReporte->close();
            adminAccionesRedirect(['accion_crud_status' => 'report_created']);
        }

        $stmtReporte->close();
        adminAccionesRedirect(['accion_crud_status' => 'report_db_error']);
    }

    $consultaAccionesMetricas = "
        SELECT
            (SELECT COUNT(*) FROM activos) AS total_activos,
            (SELECT COUNT(*) FROM reportes) AS total_reportes,
            (SELECT COUNT(*) FROM historial_activos) AS total_movimientos
    ";
    $resultadoAccionesMetricas = $conn->query($consultaAccionesMetricas);

    if ($resultadoAccionesMetricas && $resultadoAccionesMetricas->num_rows > 0) {
        $filaAccionesMetricas = $resultadoAccionesMetricas->fetch_assoc();
        $accionesMetricas['activos'] = (int) ($filaAccionesMetricas['total_activos'] ?? 0);
        $accionesMetricas['reportes'] = (int) ($filaAccionesMetricas['total_reportes'] ?? 0);
        $accionesMetricas['movimientos'] = (int) ($filaAccionesMetricas['total_movimientos'] ?? 0);
    }

    $consultaActivosAdmin = "
        SELECT
            a.id_activo,
            a.codigo_qr,
            a.nombre_activo,
            COALESCE(c.nombre_categoria, 'Sin categoria') AS categoria,
            COALESCE(e.nombre_estado, 'Sin estado') AS estado,
            COALESCE(u.nombre_ubicacion, 'Sin ubicacion') AS ubicacion,
            COALESCE(em.nombre, 'Sin empresa') AS empresa
        FROM activos a
        LEFT JOIN categorias c ON c.id_categoria = a.id_categoria
        LEFT JOIN estados e ON e.id_estado = a.id_estado
        LEFT JOIN ubicaciones u ON u.id_ubicacion = a.id_ubicacion
        LEFT JOIN empresas em ON em.id_empresa = a.id_empresa
        ORDER BY a.id_activo DESC
        LIMIT 8
    ";
    $resultadoActivosAdmin = $conn->query($consultaActivosAdmin);

    if ($resultadoActivosAdmin) {
        while ($filaActivo = $resultadoActivosAdmin->fetch_assoc()) {
            $activosAdmin[] = $filaActivo;
        }
    }

    $consultaReportesAdmin = "
        SELECT
            r.id_reporte,
            r.titulo,
            r.descripcion,
            r.fecha_generacion,
            CONCAT(u.nombre, ' ', u.primer_apellido) AS generado_por_nombre
        FROM reportes r
        LEFT JOIN usuarios u ON u.id_usuario = r.generado_por
        ORDER BY r.id_reporte DESC
        LIMIT 8
    ";
    $resultadoReportesAdmin = $conn->query($consultaReportesAdmin);

    if ($resultadoReportesAdmin) {
        while ($filaReporte = $resultadoReportesAdmin->fetch_assoc()) {
            $reportesAdmin[] = $filaReporte;
        }
    }

    $consultaHistorialAdmin = "
        SELECT
            h.id_historial,
            a.nombre_activo,
            COALESCE(e1.nombre_estado, 'Sin estado') AS estado_anterior_nombre,
            COALESCE(e2.nombre_estado, 'Sin estado') AS nuevo_estado_nombre,
            h.fecha_movimiento,
            h.observaciones
        FROM historial_activos h
        LEFT JOIN activos a ON a.id_activo = h.id_activo
        LEFT JOIN estados e1 ON e1.id_estado = h.estado_anterior
        LEFT JOIN estados e2 ON e2.id_estado = h.nuevo_estado
        ORDER BY h.id_historial DESC
        LIMIT 8
    ";
    $resultadoHistorialAdmin = $conn->query($consultaHistorialAdmin);

    if ($resultadoHistorialAdmin) {
        while ($filaHistorial = $resultadoHistorialAdmin->fetch_assoc()) {
            $historialAdmin[] = $filaHistorial;
        }
    }
}
?>
