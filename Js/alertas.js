function mostrarAlerta(status) {

    if (status === "success") {
        Swal.fire({
            title: "Bienvenido",
            text: "Ingreso a EcoTech de manera correcta",
            icon: "success"
          });
    }

    if (status === "error_pass") {
        Swal.fire({
            title: "Error de contraseña",
            icon: "warning"
        });
    }

    if (status === "error_user") {
        Swal.fire({
            title: "Usuario no existe",
            icon: "question"
        });
    }

    if (status === "error_data") {
        Swal.fire({
            title: "ERROR EN LA BASE DE DATOS",
            icon: "info"
        });
    }

    if (status === "user_create") {
        Swal.fire({
            title: "USUARIO CREADO",
            html: `
                <video controls style="width:100%; border-radius:10px;">
                    <source src="../images/Reci.mp4" type="video/mp4">
                </video>
            `,
            background: "#161816",
            color: "#39BC15",
            confirmButtonColor: "#39BC15"
        });
    }

    if (status === "failed") {
        Swal.fire({
            title: "ERROR EN LA BASE DE DATOS",
            icon: "info"
        });
    }

    if (status === "incomplete") {
        Swal.fire({
            title: "Formulario incompleto",
            icon: "warning"
        });
    }

    if (status === "admin_only") {
        Swal.fire({
            title: "Acceso restringido",
            text: "Solo los administradores pueden entrar al panel.",
            icon: "warning"
        });
    }

    if (status === "session_expired") {
        Swal.fire({
            title: "Inicia sesion",
            text: "Tu sesion no esta activa o ya expiro.",
            icon: "info"
        });
    }

    if (status === "logout") {
        Swal.fire({
            title: "Sesion cerrada",
            text: "Has salido del panel correctamente.",
            icon: "success"
        });
    }
}
