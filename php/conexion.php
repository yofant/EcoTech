<?php
$servername = "localhost";
$username   = "root";       // Usuario MySQL
$password   = "";           // Contraseña MySQL
$database   = "prueba";    // Nombre de la base

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>