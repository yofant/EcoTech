function mostrarAlerta(status) {
    console.log('mostrarAlerta llamado con status:', status);

    if (typeof Swal === 'undefined') {
        console.warn('SweetAlert no esta cargado, usando alert() como fallback');
        alert('Status: ' + status);
        return;
    }

    
    if (status === "contact_sent") {
        Swal.fire({
            title: "Mensaje enviado",
            text: "Tu mensaje se envio correctamente.",
            icon: "success"
        });
        return;
    }

    if (status === "success") {
        Swal.fire({
            title: "Bienvenido",
            text: "Ingreso a EcoTech de manera correcta",
            icon: "success"
        });
        return;
    }

    if (status === "error_pass") {
        Swal.fire({
            title: "Error de contrasena",
            icon: "warning"
        });
        return;
    }

    if (status === "error_user") {
        Swal.fire({
            title: "Usuario no existe",
            icon: "question"
        });
        return;
    }

    if (status === "error_data") {
        Swal.fire({
            title: "ERROR EN LA BASE DE DATOS",
            icon: "info"
        });
        return;
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
        return;
    }

    if (status === "contact_error") {
        Swal.fire({
            title: "No se pudo enviar el mensaje",
            text: "Intenta nuevamente en unos minutos.",
            icon: "error"
        });
        return;
    }

    if (status === "invalid_email") {
        Swal.fire({
            title: "Correo invalido",
            text: "Revisa el email e intenta nuevamente.",
            icon: "warning"
        });
        return;
    }

    if (status === "failed") {
        Swal.fire({
            title: "ERROR EN LA BASE DE DATOS",
            icon: "info"
        });
        return;
    }

    if (status === "incomplete") {
        Swal.fire({
            title: "Formulario incompleto",
            icon: "warning"
        });
        return;
    }

    if (status === "admin_only") {
        Swal.fire({
            title: "Acceso restringido",
            text: "Solo los administradores pueden entrar al panel.",
            icon: "warning"
        });
        return;
    }

    if (status === "session_expired") {
        Swal.fire({
            title: "Inicia sesion",
            text: "Tu sesion no esta activa o ya expiro.",
            icon: "info"
        });
        return;
    }

    if (status === "logout") {
        Swal.fire({
            title: "Sesion cerrada",
            text: "Has salido del panel correctamente.",
            icon: "success"
        });
        return;
    }

    Swal.fire({
        title: "Estado no reconocido",
        text: "No se encontro una alerta para: " + status,
        icon: "info"
    });
}
