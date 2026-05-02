(function () {
    const canvases = document.querySelectorAll('[data-admin-chart="equipos"]');
    if (!canvases.length || typeof Chart === 'undefined') {
        return;
    }

    const labels = ['reacondicionados', 'reciclados', 'donados'];
    const values = [10, 20, 30];
    const tickColor = '#9fc3a8';
    const gridColor = 'rgba(255, 255, 255, 0.08)';

    function createChartConfig() {
        return {
            type: 'bar',
            data: {
                labels: labels.slice(),
                datasets: [
                    {
                        label: 'Cantidad de equipos',
                        data: values.slice(),
                        backgroundColor: 'rgba(57, 255, 20, 0.22)',
                        borderColor: 'rgba(57, 255, 20, 0.85)',
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
                scales: {
                    x: {
                        ticks: { color: tickColor },
                        grid: { color: gridColor }
                    },
                    y: {
                        ticks: { color: tickColor },
                        grid: { color: gridColor }
                    }
                }
            }
        };
    }

    canvases.forEach(function (canvas) {
        new Chart(canvas.getContext('2d'), createChartConfig());
    });
})();
