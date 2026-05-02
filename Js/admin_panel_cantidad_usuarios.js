(function () {
    const canvases = document.querySelectorAll('[data-admin-chart="usuarios"]');
    if (!canvases.length || typeof Chart === 'undefined') {
        return;
    }

    const chartData = (window.ADMIN_CHART_DATA && window.ADMIN_CHART_DATA.usuarios) || {};

    const labels = Array.isArray(chartData.labels) && chartData.labels.length
        ? chartData.labels
        : ['Sin usuarios'];

    const values = Array.isArray(chartData.values) && chartData.values.length
        ? chartData.values
        : [0];

    const sliceColors = [
        'rgba(57, 255, 20, 0.4)',
        'rgba(0, 170, 255, 0.4)',
        'rgba(255, 204, 0, 0.4)',
        'rgba(155, 111, 255, 0.38)',
        'rgba(255, 99, 132, 0.36)'
    ];

    function coloresPorCantidad(paleta, n) {
        const out = [];
        for (let i = 0; i < n; i++) {
            out.push(paleta[i % paleta.length]);
        }
        return out;
    }

    function createChartConfig() {
        return {
            type: 'doughnut',
            data: {
                labels: labels,
                datasets: [
                    {
                        label: 'Usuarios por rol',
                        data: values,
                        backgroundColor: coloresPorCantidad(sliceColors, values.length),
                        borderColor: 'rgba(255, 255, 255, 0.12)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '55%',
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        callbacks: {
                            label: function (context) {
                                return context.label + ': ' + context.raw;
                            }
                        }
                    }
                }
            }
        };
    }

    canvases.forEach(function (canvas) {
        const ctx = canvas.getContext('2d');
        if (canvas._chartInstance) {
            canvas._chartInstance.destroy();
        }

        canvas._chartInstance = new Chart(ctx, createChartConfig());
    });
})();
