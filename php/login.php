<?php
include("conexion.php");

if (isset($_POST['correo']) && isset($_POST['contrasena'])) {
    $correo     = $_POST['correo'];
    $contrasena = $_POST['contrasena'];

    $sql = "SELECT * FROM user WHERE correo = ? AND contrasena = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $correo, $contrasena);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "✅ Usuario encontrado. Bienvenido.";
    } else {
        echo "❌ Usuario no encontrado.";
    }
} else {
    echo "⚠️ No se recibieron datos del formulario.";
}
?>