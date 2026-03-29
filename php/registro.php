<?php
include("conexion.php");

if (
    isset($_POST['nombre']) &&
    isset($_POST['primer_apellido']) &&
    isset($_POST['segundo_apellido']) &&
    isset($_POST['correo']) &&
    isset($_POST['contrasena']) &&
    isset($_POST['confir_contrasena'])
) {
    $nombre          = $_POST['nombre'];
    $primer_apellido = $_POST['primer_apellido'];
    $segundo_apellido= $_POST['segundo_apellido'];
    $correo          = $_POST['correo'];
    $contrasena      = $_POST['contrasena'];
    $confirmar       = $_POST['confir_contrasena'];

    // Validar que las contraseñas coincidan
    if ($contrasena !== $confirmar) {
        echo "❌ Las contraseñas no coinciden.";
        exit;
    }

    // Encriptar la contraseña antes de guardarla
    $hash = password_hash($contrasena, PASSWORD_DEFAULT);
    $hash = password_hash($confir_contrasena, PASSWORD_DEFAULT);

    // Consulta para insertar usuario
    $sql = "INSERT INTO user (nombre, primer_apellido, segundo_apellido, correo, contrasena, confir_contrasena) 
            VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $nombre, $primer_apellido, $segundo_apellido, $correo, $hash, $confirmar);

    if ($stmt->execute()) {
        echo "✅ Usuario registrado correctamente.";
    } else {
        echo "❌ Error al registrar usuario: " . $conn->error;
    }

    $stmt->close();
    $conn->close();
} else {
    echo "⚠️ No se recibieron todos los datos del formulario.";
}
?>