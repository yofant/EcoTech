<?php
if (!defined('ECOTECH_ADMIN_EMPRESAS')) {
    define('ECOTECH_ADMIN_EMPRESAS', true);

    $crudEmpresaMessage = null;
    $crudEmpresaMessageType = null;
    $modoEmpresaFormulario = 'crear';
    $empresaForm = [
        'id_empresa' => '',
        'nombre' => '',
        'nit' => '',
        'direccion' => '',
        'telefono' => '',
        'correo_contacto' => '',
        'fecha_registro' => ''
    ];
    $empresas = [];

    if (!function_exists('adminEmpresasRedirect')) {
        function adminEmpresasRedirect(array $params = []): void
        {
            $query = http_build_query(array_merge(['panel' => 'empresas'], $params));
            header("Location: ../html/admin_panel.php?$query");
            exit();
        }
    }

    $empresaCrudStatus = $_GET['empresa_crud_status'] ?? '';

    if ($empresaCrudStatus === 'created') {
        $crudEmpresaMessage = 'Empresa registrada correctamente.';
        $crudEmpresaMessageType = 'success';
    } elseif ($empresaCrudStatus === 'updated') {
        $crudEmpresaMessage = 'Empresa actualizada correctamente.';
        $crudEmpresaMessageType = 'success';
    } elseif ($empresaCrudStatus === 'deleted') {
        $crudEmpresaMessage = 'Empresa eliminada correctamente.';
        $crudEmpresaMessageType = 'success';
    } elseif ($empresaCrudStatus === 'invalid') {
        $crudEmpresaMessage = 'Completa los datos obligatorios antes de guardar.';
        $crudEmpresaMessageType = 'error';
    } elseif ($empresaCrudStatus === 'not_found') {
        $crudEmpresaMessage = 'La empresa solicitada no existe o ya fue eliminada.';
        $crudEmpresaMessageType = 'warning';
    } elseif ($empresaCrudStatus === 'db_error') {
        $crudEmpresaMessage = 'Ocurrio un error con la base de datos al procesar la solicitud.';
        $crudEmpresaMessageType = 'error';
    } elseif ($empresaCrudStatus === 'duplicate') {
        $crudEmpresaMessage = 'El NIT ingresado ya esta registrado en otra empresa.';
        $crudEmpresaMessageType = 'error';
    } elseif ($empresaCrudStatus === 'in_use') {
        $crudEmpresaMessage = 'No se puede eliminar: hay equipos vinculados a esta empresa.';
        $crudEmpresaMessageType = 'warning';
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && (($_POST['empresa_crud_action'] ?? '') === 'save_empresa')) {
        $idEmpresa = isset($_POST['id_empresa']) ? (int) $_POST['id_empresa'] : 0;
        $nombre = trim($_POST['nombre'] ?? '');
        $nit = trim($_POST['nit'] ?? '');
        $direccion = trim($_POST['direccion'] ?? '');
        $telefono = trim($_POST['telefono'] ?? '');
        $correoContacto = trim($_POST['correo_contacto'] ?? '');
        $fechaRegistroInput = trim($_POST['fecha_registro'] ?? '');
        $modoEmpresaFormulario = $idEmpresa > 0 ? 'editar' : 'crear';

        $empresaForm = [
            'id_empresa' => $idEmpresa > 0 ? (string) $idEmpresa : '',
            'nombre' => $nombre,
            'nit' => $nit,
            'direccion' => $direccion,
            'telefono' => $telefono,
            'correo_contacto' => $correoContacto,
            'fecha_registro' => $fechaRegistroInput
        ];

        if ($nombre === '' || $nit === '' || !filter_var($correoContacto, FILTER_VALIDATE_EMAIL)) {
            $crudEmpresaMessage = 'Nombre, NIT y correo de contacto valido son obligatorios.';
            $crudEmpresaMessageType = 'error';
        } else {
            if ($idEmpresa > 0) {
                $stmtExiste = $conn->prepare('SELECT id_empresa FROM empresas WHERE id_empresa = ?');
                $stmtExiste->bind_param('i', $idEmpresa);
                $stmtExiste->execute();
                $resExiste = $stmtExiste->get_result();
                $existe = $resExiste->fetch_assoc();
                $stmtExiste->close();

                if (!$existe) {
                    adminEmpresasRedirect(['empresa_crud_status' => 'not_found']);
                }

                $stmt = $conn->prepare('
                    UPDATE empresas
                    SET nombre = ?, nit = ?, direccion = ?, telefono = ?, correo_contacto = ?
                    WHERE id_empresa = ?
                ');
                $stmt->bind_param('sssssi', $nombre, $nit, $direccion, $telefono, $correoContacto, $idEmpresa);

                if ($stmt->execute()) {
                    $stmt->close();
                    adminEmpresasRedirect(['empresa_crud_status' => 'updated']);
                }

                $errno = $stmt->errno;
                $stmt->close();

                if ($errno === 1062) {
                    $crudEmpresaMessage = 'El NIT ingresado ya esta en uso.';
                    $crudEmpresaMessageType = 'error';
                } else {
                    $crudEmpresaMessage = 'No fue posible actualizar la empresa.';
                    $crudEmpresaMessageType = 'error';
                }
            } else {
                $fechaRegistroSql = date('Y-m-d H:i:s');
                if ($fechaRegistroInput !== '') {
                    $dt = DateTime::createFromFormat('Y-m-d\TH:i', $fechaRegistroInput);
                    if ($dt instanceof DateTime) {
                        $fechaRegistroSql = $dt->format('Y-m-d H:i:s');
                    }
                }

                $stmt = $conn->prepare('
                    INSERT INTO empresas (nombre, nit, direccion, telefono, correo_contacto, fecha_registro)
                    VALUES (?, ?, ?, ?, ?, ?)
                ');
                $stmt->bind_param('ssssss', $nombre, $nit, $direccion, $telefono, $correoContacto, $fechaRegistroSql);

                if ($stmt->execute()) {
                    $stmt->close();
                    adminEmpresasRedirect(['empresa_crud_status' => 'created']);
                }

                $errno = $stmt->errno;
                $stmt->close();

                if ($errno === 1062) {
                    $crudEmpresaMessage = 'El NIT ingresado ya existe en la base de datos.';
                    $crudEmpresaMessageType = 'error';
                } else {
                    $crudEmpresaMessage = 'No fue posible registrar la empresa. Verifica que la tabla tenga las columnas esperadas.';
                    $crudEmpresaMessageType = 'error';
                }
            }
        }
    }

    if (($_GET['empresa_action'] ?? '') === 'delete' && isset($_GET['id_empresa'])) {
        $idEliminar = (int) $_GET['id_empresa'];

        $stmtCheck = $conn->prepare('SELECT id_empresa FROM empresas WHERE id_empresa = ?');
        $stmtCheck->bind_param('i', $idEliminar);
        $stmtCheck->execute();
        $resCheck = $stmtCheck->get_result();
        $filaEmp = $resCheck->fetch_assoc();
        $stmtCheck->close();

        if (!$filaEmp) {
            adminEmpresasRedirect(['empresa_crud_status' => 'not_found']);
        }

        $stmtEliminar = $conn->prepare('DELETE FROM empresas WHERE id_empresa = ?');
        $stmtEliminar->bind_param('i', $idEliminar);

        if ($stmtEliminar->execute()) {
            $stmtEliminar->close();
            adminEmpresasRedirect(['empresa_crud_status' => 'deleted']);
        }

        $errno = $stmtEliminar->errno;
        $stmtEliminar->close();

        if ($errno === 1451) {
            adminEmpresasRedirect(['empresa_crud_status' => 'in_use']);
        }

        adminEmpresasRedirect(['empresa_crud_status' => 'db_error']);
    }

    if (($_GET['empresa_action'] ?? '') === 'edit' && isset($_GET['id_empresa'])) {
        $idEditar = (int) $_GET['id_empresa'];
        $stmtEditar = $conn->prepare('
            SELECT id_empresa, nombre, nit, direccion, telefono, correo_contacto, fecha_registro
            FROM empresas
            WHERE id_empresa = ?
        ');
        $stmtEditar->bind_param('i', $idEditar);
        $stmtEditar->execute();
        $resEditar = $stmtEditar->get_result();
        $empresaEditar = $resEditar->fetch_assoc();
        $stmtEditar->close();

        if ($empresaEditar) {
            $modoEmpresaFormulario = 'editar';
            $fr = $empresaEditar['fecha_registro'] ?? '';
            $fechaForm = '';
            if ($fr !== '' && $fr !== null) {
                $dt = date_create($fr);
                if ($dt) {
                    $fechaForm = $dt->format('Y-m-d\TH:i');
                }
            }
            $empresaForm = [
                'id_empresa' => (string) ($empresaEditar['id_empresa'] ?? ''),
                'nombre' => $empresaEditar['nombre'] ?? '',
                'nit' => $empresaEditar['nit'] ?? '',
                'direccion' => $empresaEditar['direccion'] ?? '',
                'telefono' => $empresaEditar['telefono'] ?? '',
                'correo_contacto' => $empresaEditar['correo_contacto'] ?? '',
                'fecha_registro' => $fechaForm
            ];
        } else {
            adminEmpresasRedirect(['empresa_crud_status' => 'not_found']);
        }
    }

    $consultaEmpresas = '
        SELECT id_empresa, nombre, nit, direccion, telefono, correo_contacto, fecha_registro
        FROM empresas
        ORDER BY id_empresa DESC
    ';

    $resultadoEmpresas = $conn->query($consultaEmpresas);

    if ($resultadoEmpresas) {
        while ($fila = $resultadoEmpresas->fetch_assoc()) {
            $empresas[] = $fila;
        }
    }
}
