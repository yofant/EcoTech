/* EcoTech — comportamiento compartido del tema
   - Estado del navbar al hacer scroll
   - Aparición progresiva de bloques (IntersectionObserver)
   Respeta la preferencia del sistema "reducir movimiento".
*/
(function () {
    "use strict";

    var reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

    /* Marca el documento antes de pintar: el CSS solo oculta los bloques
       con animación cuando esta clase está presente, así el contenido
       nunca queda invisible si el script falla. */
    document.documentElement.classList.add("js-reveal");

    /* ------------------------------------------------------------------
       Navbar: cambia de aspecto al hacer scroll
       ------------------------------------------------------------------ */
    var navbar = document.querySelector("[data-navbar]");

    if (navbar) {
        var syncNavbar = function () {
            navbar.classList.toggle("is-scrolled", window.scrollY > 24);
        };

        syncNavbar();
        window.addEventListener("scroll", syncNavbar, { passive: true });
    }

    /* ------------------------------------------------------------------
       Animación al entrar en viewport
       ------------------------------------------------------------------ */
    var revealables = document.querySelectorAll("[data-reveal]");

    if (!revealables.length) {
        return;
    }

    if (reduceMotion || !("IntersectionObserver" in window)) {
        revealables.forEach(function (el) {
            el.classList.add("is-revealed");
        });
        return;
    }

    var observer = new IntersectionObserver(
        function (entries) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    entry.target.classList.add("is-revealed");
                    observer.unobserve(entry.target);
                }
            });
        },
        { threshold: 0.12, rootMargin: "0px 0px -60px 0px" }
    );

    revealables.forEach(function (el) {
        observer.observe(el);
    });
})();
