<?php
include("conexion.php");

if (
    isset($_POST['nombre']) &&
    isset($_POST['primer_apellido']) &&
    isset($_POST['segundo_apellido']) &&
    isset($_POST['correo']) &&
    isset($_POST['contrasena']) &&
    isset($_POST['rol'])
) {
    $nombre          = $_POST['nombre'];
    $primer_apellido = $_POST['primer_apellido'];
    $segundo_apellido= $_POST['segundo_apellido'];
    $correo          = $_POST['correo'];
    $contrasena      = $_POST['contrasena'];
    $rol             = $_POST['rol'];

    // Encriptar la contraseña antes de guardarla
    $hash = password_hash($contrasena, PASSWORD_DEFAULT);

    // Consulta para insertar usuario
    $sql = "INSERT INTO usuarios (nombre, primer_apellido, segundo_apellido, correo, contrasena, rol) 
            VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $nombre, $primer_apellido, $segundo_apellido, $correo, $hash, $rol);

    if ($stmt->execute()) {
        header("Location: ../html/registro_user.php?status=user_create");
            exit();
    } else {
        header("Location: ../html/registro_user.php?status=failed");
            exit();
    }

    $stmt->close();
    $conn->close();
} else {
    header("Location: ../html/registro_user?status=incomplete");
            exit();
}
?>