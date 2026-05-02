(function () {
    const canvases = document.querySelectorAll('[data-admin-chart="ubicaciones"]');
    if (!canvases.length || typeof Chart === 'undefined') {
        return;
    }

    const labels = ['Zona A', 'Zona B', 'Zona C'];
    const values = [12, 19, 8];
    const sliceColors = [
        'rgba(57, 255, 20, 0.45)',
        'rgba(0, 170, 255, 0.4)',
        'rgba(255, 204, 0, 0.4)'
    ];

    function createChartConfig() {
        return {
            type: 'pie',
            data: {
                labels: labels.slice(),
                datasets: [
                    {
                        label: 'Ubicaciones',
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
                }
            }
        };
    }

    canvases.forEach(function (canvas) {
        new Chart(canvas.getContext('2d'), createChartConfig());
    });
})();
