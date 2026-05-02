<?php
if (!defined('ECOTECH_ADMIN_ESTADOS')) {
    define('ECOTECH_ADMIN_ESTADOS', true);

    $crudEstadoMessage = null;
    $crudEstadoMessageType = null;
    $modoEstadoFormulario = 'crear';
    $estadoForm = [
        'id_estado' => '',
        'nombre_estado' => '',
        'descripcion' => ''
    ];
    $estados = [];

    if (!function_exists('adminEstadosRedirect')) {
        function adminEstadosRedirect($params = [])
        {
            $query = http_build_query(array_merge(['panel' => 'estado'], $params));
            header("Location: ../html/admin_panel.php?$query");
            exit();
        }
    }

    $estadoCrudStatus = $_GET['estado_crud_status'] ?? '';

    if ($estadoCrudStatus === 'created') {
        $crudEstadoMessage = 'Estado creado correctamente.';
        $crudEstadoMessageType = 'success';
    } elseif ($estadoCrudStatus === 'updated') {
        $crudEstadoMessage = 'Estado actualizado correctamente.';
        $crudEstadoMessageType = 'success';
    } elseif ($estadoCrudStatus === 'deleted') {
        $crudEstadoMessage = 'Estado eliminado correctamente.';
        $crudEstadoMessageType = 'success';
    } elseif ($estadoCrudStatus === 'invalid') {
        $crudEstadoMessage = 'Completa los campos del estado antes de guardar.';
        $crudEstadoMessageType = 'error';
    } elseif ($estadoCrudStatus === 'not_found') {
        $crudEstadoMessage = 'El estado solicitado no existe o ya fue eliminado.';
        $crudEstadoMessageType = 'warning';
    } elseif ($estadoCrudStatus === 'db_error') {
        $crudEstadoMessage = 'Ocurrio un error con la base de datos al procesar el estado.';
        $crudEstadoMessageType = 'error';
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && (($_POST['estado_crud_action'] ?? '') === 'save_estado')) {
        $idEstado = isset($_POST['id_estado']) ? (int) $_POST['id_estado'] : 0;
        $nombreEstado = trim($_POST['nombre_estado'] ?? '');
        $descripcionEstado = trim($_POST['descripcion'] ?? '');
        $modoEstadoFormulario = $idEstado > 0 ? 'editar' : 'crear';

        $estadoForm = [
            'id_estado' => $idEstado,
            'nombre_estado' => $nombreEstado,
            'descripcion' => $descripcionEstado
        ];

        if ($nombreEstado === '') {
            $crudEstadoMessage = 'El nombre del estado es obligatorio.';
            $crudEstadoMessageType = 'error';
        } else {
            if ($idEstado > 0) {
                $consultaEstadoActual = $conn->prepare("
                    SELECT id_estado
                    FROM estados
                    WHERE id_estado = ?
                ");
                $consultaEstadoActual->bind_param("i", $idEstado);
                $consultaEstadoActual->execute();
                $resultadoEstadoActual = $consultaEstadoActual->get_result();
                $estadoActual = $resultadoEstadoActual->fetch_assoc();
                $consultaEstadoActual->close();

                if (!$estadoActual) {
                    adminEstadosRedirect(['estado_crud_status' => 'not_found']);
                }

                $stmtEstado = $conn->prepare("
                    UPDATE estados
                    SET nombre_estado = ?, descripcion = ?
                    WHERE id_estado = ?
                ");
                $stmtEstado->bind_param("ssi", $nombreEstado, $descripcionEstado, $idEstado);

                if ($stmtEstado->execute()) {
                    $stmtEstado->close();
                    adminEstadosRedirect(['estado_crud_status' => 'updated']);
                }

                $stmtEstado->close();
                $crudEstadoMessage = 'No fue posible actualizar el estado.';
                $crudEstadoMessageType = 'error';
            } else {
                $stmtEstado = $conn->prepare("
                    INSERT INTO estados (nombre_estado, descripcion)
                    VALUES (?, ?)
                ");
                $stmtEstado->bind_param("ss", $nombreEstado, $descripcionEstado);

                if ($stmtEstado->execute()) {
                    $stmtEstado->close();
                    adminEstadosRedirect(['estado_crud_status' => 'created']);
                }

                $stmtEstado->close();
                $crudEstadoMessage = 'No fue posible crear el estado.';
                $crudEstadoMessageType = 'error';
            }
        }
    }

    if (($_GET['estado_action'] ?? '') === 'delete' && isset($_GET['id_estado'])) {
        $idEstadoEliminar = (int) $_GET['id_estado'];

        $consultaEstadoEliminar = $conn->prepare("
            SELECT id_estado
            FROM estados
            WHERE id_estado = ?
        ");
        $consultaEstadoEliminar->bind_param("i", $idEstadoEliminar);
        $consultaEstadoEliminar->execute();
        $resultadoEstadoEliminar = $consultaEstadoEliminar->get_result();
        $estadoEliminar = $resultadoEstadoEliminar->fetch_assoc();
        $consultaEstadoEliminar->close();

        if (!$estadoEliminar) {
            adminEstadosRedirect(['estado_crud_status' => 'not_found']);
        }

        $stmtEstadoEliminar = $conn->prepare("DELETE FROM estados WHERE id_estado = ?");
        $stmtEstadoEliminar->bind_param("i", $idEstadoEliminar);

        if ($stmtEstadoEliminar->execute()) {
            $stmtEstadoEliminar->close();
            adminEstadosRedirect(['estado_crud_status' => 'deleted']);
        }

        $stmtEstadoEliminar->close();
        adminEstadosRedirect(['estado_crud_status' => 'db_error']);
    }

    if (($_GET['estado_action'] ?? '') === 'edit' && isset($_GET['id_estado'])) {
        $idEstadoEditar = (int) $_GET['id_estado'];
        $consultaEstadoEditar = $conn->prepare("
            SELECT id_estado, nombre_estado, descripcion
            FROM estados
            WHERE id_estado = ?
        ");
        $consultaEstadoEditar->bind_param("i", $idEstadoEditar);
        $consultaEstadoEditar->execute();
        $resultadoEstadoEditar = $consultaEstadoEditar->get_result();
        $estadoEditar = $resultadoEstadoEditar->fetch_assoc();
        $consultaEstadoEditar->close();

        if ($estadoEditar) {
            $modoEstadoFormulario = 'editar';
            $estadoForm = [
                'id_estado' => $estadoEditar['id_estado'] ?? '',
                'nombre_estado' => $estadoEditar['nombre_estado'] ?? '',
                'descripcion' => $estadoEditar['descripcion'] ?? ''
            ];
        } else {
            adminEstadosRedirect(['estado_crud_status' => 'not_found']);
        }
    }

    $consultaEstados = "
        SELECT id_estado, nombre_estado, descripcion
        FROM estados
        ORDER BY id_estado DESC
    ";

    $resultadoEstados = $conn->query($consultaEstados);

    if ($resultadoEstados) {
        while ($filaEstado = $resultadoEstados->fetch_assoc()) {
            $estados[] = $filaEstado;
        }
    }
}
?>
