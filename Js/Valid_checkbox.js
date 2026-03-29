document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("formulario") ?? document.querySelector("form");
    const checkbox = document.getElementById("terminos");

    if (!form || !checkbox) return;

    let mensaje = document.getElementById("mensaje");
    if (!mensaje) {
        mensaje = document.createElement("div");
        mensaje.id = "mensaje";
        mensaje.style.display = "none";
        mensaje.style.color = "#dc3545";
        mensaje.style.fontSize = "0.9rem";
        mensaje.style.marginTop = "0.35rem";
        checkbox.insertAdjacentElement("afterend", mensaje);
    }

    const sync = () => {
        const ok = checkbox.checked;
        checkbox.setCustomValidity(ok ? "" : "Debes aceptar los términos y condiciones.");
        mensaje.style.display = ok ? "none" : "block";
    };

    checkbox.addEventListener("change", sync);

    form.addEventListener("submit", (e) => {
        sync();
        if (!checkbox.checked) {
            e.preventDefault();
            checkbox.reportValidity();
        }
    });
});