<?php
include("conexion.php");

$status = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['correo']) && isset($_POST['contrasena'])) {

        $correo     = $_POST['correo'];
        $contrasena = $_POST['contrasena'];

        $sql = "SELECT * FROM usuarios WHERE correo = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $correo);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $usuario = $result->fetch_assoc();

            if (password_verify($contrasena, $usuario['contrasena'])) {
            header("Location: ../html/login_user.php?status=success");
            exit();
    
            } else {
                header("Location: ../html/login_user.php?status=error_pass");
                exit();
            }

        } else {
            header("Location: ../html/login_user.php?status=error_user");
            exit();

        }

    } else {
        header("Location: ../html/login_user.php?status=error_data");
        exit();
    }
}

?>