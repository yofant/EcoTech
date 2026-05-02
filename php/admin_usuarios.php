<?php
if (!defined('ECOTECH_ADMIN_USUARIOS')) {
    define('ECOTECH_ADMIN_USUARIOS', true);

    $rolesPermitidosUsuarios = ['admin', 'cliente', 'operador', 'tecnico'];
    $crudMessage = null;
    $crudMessageType = null;
    $modoFormulario = 'crear';
    $usuarioForm = [
        'id' => '',
        'nombre' => '',
        'primer_apellido' => '',
        'segundo_apellido' => '',
        'correo' => '',
        'rol' => 'cliente',
        'contrasena' => ''
    ];
    $usuarios = [];

    if (!function_exists('adminUsuariosRedirect')) {
        function adminUsuariosRedirect($params = [])
        {
            $query = http_build_query(array_merge(['panel' => 'usuarios'], $params));
            header("Location: ../html/admin_panel.php?$query");
            exit();
        }
    }

    $estadoCrud = $_GET['crud_status'] ?? '';

    if ($estadoCrud === 'created') {
        $crudMessage = 'Usuario creado correctamente.';
        $crudMessageType = 'success';
    } elseif ($estadoCrud === 'updated') {
        $crudMessage = 'Usuario actualizado correctamente.';
        $crudMessageType = 'success';
    } elseif ($estadoCrud === 'deleted') {
        $crudMessage = 'Usuario eliminado correctamente.';
        $crudMessageType = 'success';
    } elseif ($estadoCrud === 'duplicate') {
        $crudMessage = 'El correo ingresado ya existe en la base de datos.';
        $crudMessageType = 'error';
    } elseif ($estadoCrud === 'invalid') {
        $crudMessage = 'No fue posible completar la operacion. Revisa los datos enviados.';
        $crudMessageType = 'error';
    } elseif ($estadoCrud === 'self_delete') {
        $crudMessage = 'No puedes eliminar tu propia cuenta mientras la sesion este activa.';
        $crudMessageType = 'warning';
    } elseif ($estadoCrud === 'not_found') {
        $crudMessage = 'El usuario solicitado no existe o ya fue eliminado.';
        $crudMessageType = 'warning';
    } elseif ($estadoCrud === 'db_error') {
        $crudMessage = 'Ocurrio un error con la base de datos al procesar la solicitud.';
        $crudMessageType = 'error';
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && (($_POST['crud_action'] ?? '') === 'save_user')) {
        $id = isset($_POST['id']) ? (int) $_POST['id'] : 0;
        $nombre = trim($_POST['nombre'] ?? '');
        $primerApellido = trim($_POST['primer_apellido'] ?? '');
        $segundoApellido = trim($_POST['segundo_apellido'] ?? '');
        $correo = trim($_POST['correo'] ?? '');
        $rol = trim($_POST['rol'] ?? '');
        $contrasena = trim($_POST['contrasena'] ?? '');
        $modoFormulario = $id > 0 ? 'editar' : 'crear';

        $usuarioForm = [
            'id' => $id,
            'nombre' => $nombre,
            'primer_apellido' => $primerApellido,
            'segundo_apellido' => $segundoApellido,
            'correo' => $correo,
            'rol' => $rol,
            'contrasena' => ''
        ];

        if (
            $nombre === '' ||
            $primerApellido === '' ||
            $segundoApellido === '' ||
            !filter_var($correo, FILTER_VALIDATE_EMAIL) ||
            !in_array($rol, $rolesPermitidosUsuarios, true) ||
            ($id === 0 && $contrasena === '')
        ) {
            $crudMessage = 'Completa todos los campos obligatorios antes de guardar.';
            $crudMessageType = 'error';
        } else {
            if ($id > 0) {
                $consultaActual = $conn->prepare("SELECT correo FROM usuarios WHERE id_usuario = ?");
                $consultaActual->bind_param("i", $id);
                $consultaActual->execute();
                $resultadoActual = $consultaActual->get_result();
                $usuarioActual = $resultadoActual->fetch_assoc();
                $consultaActual->close();

                if (!$usuarioActual) {
                    adminUsuariosRedirect(['crud_status' => 'not_found']);
                }

                if ($contrasena !== '') {
                    $hash = password_hash($contrasena, PASSWORD_DEFAULT);
                    $stmt = $conn->prepare("
                        UPDATE usuarios
                        SET nombre = ?, primer_apellido = ?, segundo_apellido = ?, correo = ?, contrasena = ?, rol = ?
                        WHERE id_usuario = ?
                    ");
                    $stmt->bind_param(
                        "ssssssi",
                        $nombre,
                        $primerApellido,
                        $segundoApellido,
                        $correo,
                        $hash,
                        $rol,
                        $id
                    );
                } else {
                    $stmt = $conn->prepare("
                        UPDATE usuarios
                        SET nombre = ?, primer_apellido = ?, segundo_apellido = ?, correo = ?, rol = ?
                        WHERE id_usuario = ?
                    ");
                    $stmt->bind_param(
                        "sssssi",
                        $nombre,
                        $primerApellido,
                        $segundoApellido,
                        $correo,
                        $rol,
                        $id
                    );
                }

                if ($stmt->execute()) {
                    if (($usuarioActual['correo'] ?? '') === ($_SESSION['usuario']['correo'] ?? '')) {
                        $_SESSION['usuario']['nombre'] = $nombre;
                        $_SESSION['usuario']['correo'] = $correo;
                        $_SESSION['usuario']['rol'] = $rol;
                    }

                    $stmt->close();
                    adminUsuariosRedirect(['crud_status' => 'updated']);
                }

                $codigoError = $stmt->errno;
                $stmt->close();

                if ($codigoError === 1062) {
                    $crudMessage = 'El correo ingresado ya existe en otro usuario.';
                    $crudMessageType = 'error';
                } else {
                    $crudMessage = 'No fue posible actualizar el usuario.';
                    $crudMessageType = 'error';
                }
            } else {
                $hash = password_hash($contrasena, PASSWORD_DEFAULT);
                $stmt = $conn->prepare("
                    INSERT INTO usuarios (nombre, primer_apellido, segundo_apellido, correo, contrasena, rol)
                    VALUES (?, ?, ?, ?, ?, ?)
                ");
                $stmt->bind_param(
                    "ssssss",
                    $nombre,
                    $primerApellido,
                    $segundoApellido,
                    $correo,
                    $hash,
                    $rol
                );

                if ($stmt->execute()) {
                    $stmt->close();
                    adminUsuariosRedirect(['crud_status' => 'created']);
                }

                $codigoError = $stmt->errno;
                $stmt->close();

                if ($codigoError === 1062) {
                    $crudMessage = 'El correo ingresado ya existe en la base de datos.';
                    $crudMessageType = 'error';
                } else {
                    $crudMessage = 'No fue posible crear el usuario.';
                    $crudMessageType = 'error';
                }
            }
        }
    }

    if (($_GET['user_action'] ?? '') === 'delete' && isset($_GET['id'])) {
        $idEliminar = (int) $_GET['id'];

        $consultaEliminar = $conn->prepare("SELECT correo FROM usuarios WHERE id_usuario = ?");
        $consultaEliminar->bind_param("i", $idEliminar);
        $consultaEliminar->execute();
        $resultadoEliminar = $consultaEliminar->get_result();
        $usuarioEliminar = $resultadoEliminar->fetch_assoc();
        $consultaEliminar->close();

        if (!$usuarioEliminar) {
            adminUsuariosRedirect(['crud_status' => 'not_found']);
        }

        if (($usuarioEliminar['correo'] ?? '') === ($_SESSION['usuario']['correo'] ?? '')) {
            adminUsuariosRedirect(['crud_status' => 'self_delete']);
        }

        $stmtEliminar = $conn->prepare("DELETE FROM usuarios WHERE id_usuario = ?");
        $stmtEliminar->bind_param("i", $idEliminar);

        if ($stmtEliminar->execute()) {
            $stmtEliminar->close();
            adminUsuariosRedirect(['crud_status' => 'deleted']);
        }

        $stmtEliminar->close();
        adminUsuariosRedirect(['crud_status' => 'db_error']);
    }

    if (($_GET['user_action'] ?? '') === 'edit' && isset($_GET['id'])) {
        $idEditar = (int) $_GET['id'];
        $consultaEditar = $conn->prepare("
            SELECT id_usuario AS id, nombre, primer_apellido, segundo_apellido, correo, rol
            FROM usuarios
            WHERE id_usuario = ?
        ");
        $consultaEditar->bind_param("i", $idEditar);
        $consultaEditar->execute();
        $resultadoEditar = $consultaEditar->get_result();
        $usuarioEditar = $resultadoEditar->fetch_assoc();
        $consultaEditar->close();

        if ($usuarioEditar) {
            $modoFormulario = 'editar';
            $usuarioForm = [
                'id' => $usuarioEditar['id'] ?? '',
                'nombre' => $usuarioEditar['nombre'] ?? '',
                'primer_apellido' => $usuarioEditar['primer_apellido'] ?? '',
                'segundo_apellido' => $usuarioEditar['segundo_apellido'] ?? '',
                'correo' => $usuarioEditar['correo'] ?? '',
                'rol' => $usuarioEditar['rol'] ?? 'cliente',
                'contrasena' => ''
            ];
        } else {
            adminUsuariosRedirect(['crud_status' => 'not_found']);
        }
    }

    $consultaUsuarios = "
        SELECT id_usuario AS id, nombre, primer_apellido, segundo_apellido, correo, rol
        FROM usuarios
        ORDER BY id_usuario DESC
    ";

    $resultadoUsuarios = $conn->query($consultaUsuarios);

    if ($resultadoUsuarios) {
        while ($fila = $resultadoUsuarios->fetch_assoc()) {
            $usuarios[] = $fila;
        }
    }
}
?>
