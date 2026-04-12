<?php
include("conexion.php");
if (isset($_POST['correo']) && isset($_POST['contrasena'])) {
    $correo     = $_POST['correo'];
    $contrasena = $_POST['contrasena'];

    // Buscar el usuario por correo
    $sql = "SELECT * FROM usuarios WHERE correo = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $correo);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $usuario = $result->fetch_assoc();

        // Verificar la contraseña encriptada
        if (password_verify($contrasena, $usuario['contrasena'])) {
            echo "Usuario encontrado. Bienvenido.";
        } else {
            echo "Contraseña incorrecta.";
        }
    } else {
        echo "Usuario no encontrado.";
    }
} else {
    echo "No se recibieron datos del formulario.";
}

?>