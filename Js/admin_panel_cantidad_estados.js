(function () {
    const canvases = document.querySelectorAll('[data-admin-chart="estados"]');
    if (!canvases.length || typeof Chart === 'undefined') {
        return;
    }

    const chartData = (window.ADMIN_CHART_DATA && window.ADMIN_CHART_DATA.estados) || {};
    const labels = Array.isArray(chartData.labels) && chartData.labels.length ? chartData.labels : ['Sin estados'];
    const values = Array.isArray(chartData.values) && chartData.values.length ? chartData.values : [0];
    const tickColor = '#9fc3a8';
    const gridColor = 'rgba(255, 255, 255, 0.08)';

    function createChartConfig() {
        return {
            type: 'line',
            data: {
                labels: labels.slice(),
                datasets: [
                    {
                        label: 'Estados',
                        data: values.slice(),
                        backgroundColor: 'rgba(57, 255, 20, 0.35)',
                        borderColor: 'rgba(57, 255, 20, 0.9)',
                        borderWidth: 1,
                        borderRadius: 8
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
