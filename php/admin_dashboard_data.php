<?php

$adminChartData['usuarios'] = [
    'labels' => [],
    'values' => []
];

if (!defined('ECOTECH_ADMIN_DASHBOARD_DATA')) {
    define('ECOTECH_ADMIN_DASHBOARD_DATA', true);

    if (!function_exists('adminChartFallback')) {
        function adminChartFallback($label = 'Sin datos')
        {
            return [
                'labels' => [$label],
                'values' => [0]
            ];
        }
    }

    $adminChartData = [
        'equipos' => ['labels' => [], 'values' => []],
        'ubicaciones' => ['labels' => [], 'values' => []],
        'estados' => ['labels' => [], 'values' => []],
        'usuarios' => ['labels' => [], 'values' => []]
    ];

    require __DIR__ . '/admin_chart_equipos.php';
    require __DIR__ . '/admin_chart_ubicaciones.php';
    require __DIR__ . '/admin_chart_estados.php';
    require __DIR__ . '/admin_chart_usuarios.php';
}
