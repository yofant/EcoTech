(function () {
    const canvases = document.querySelectorAll('[data-admin-chart="usuarios"]');
    if (!canvases.length || typeof Chart === 'undefined') {
        return;
    }

    const labels = ['Admin', 'Cliente', 'Operador'];
    const values = [5, 42, 12];
    const sliceColors = [
        'rgba(57, 255, 20, 0.4)',
        'rgba(0, 170, 255, 0.4)',
        'rgba(255, 204, 0, 0.4)'
    ];

    function createChartConfig() {
        return {
            type: 'doughnut',
            data: {
                labels: labels.slice(),
                datasets: [
                    {
                        label: 'Usuarios por rol',
                        data: values.slice(),
                        backgroundColor: sliceColors.slice(),
                        borderColor: 'rgba(255, 255, 255, 0.12)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                cutout: '55%'
            }
        };
    }

    canvases.forEach(function (canvas) {
        new Chart(canvas.getContext('2d'), createChartConfig());
    });
})();
