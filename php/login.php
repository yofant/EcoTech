<?php
include("conexion.php");

$usuario  = $_POST['usuario'];
$password = $_POST['contrasena'];

// Consulta preparada para evitar inyecciones SQL
$stmt = $conn->prepare("SELECT password FROM usuarios WHERE usuario = ?");
$stmt->bind_param("s", $usuario);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    $stmt->bind_result($hash);
    $stmt->fetch();

    // Verificar contraseña
    if (password_verify($password, $hash)) {
        echo "Login exitoso. Bienvenido, " . $usuario;
    } else {
        echo "Contraseña incorrecta.";
    }
} else {
    echo "Usuario no encontrado.";
}

$stmt->close();
$conn->close();
?>
