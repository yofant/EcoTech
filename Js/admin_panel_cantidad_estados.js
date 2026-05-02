(function () {
    const canvases = document.querySelectorAll('[data-admin-chart="estados"]');
    if (!canvases.length || typeof Chart === 'undefined') {
        return;
    }

    const tickColor = '#9fc3a8';
    const gridColor = 'rgba(255, 255, 255, 0.08)';
    const puntosBase = [
        { x: 1, y: 14 },
        { x: 2, y: 22 },
        { x: 3, y: 18 },
        { x: 4, y: 26 }
    ];

    function createChartConfig() {
        return {
            type: 'scatter',
            data: {
                datasets: [
                    {
                        label: 'Estados',
                        data: puntosBase.map(function (p) {
                            return { x: p.x, y: p.y };
                        }),
                        backgroundColor: 'rgba(57, 255, 20, 0.35)',
                        borderColor: 'rgba(57, 255, 20, 0.9)',
                        borderWidth: 1,
                        pointRadius: 6
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
                        type: 'linear',
                        ticks: { color: tickColor },
                        grid: { color: gridColor }
                    },
                    y: {
                        type: 'linear',
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
