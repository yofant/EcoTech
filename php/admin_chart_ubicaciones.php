<?php

$adminChartData['ubicaciones'] = [
    'labels' => [],
    'values' => []
];

$consultaUbicacionesChart = "
    SELECT
        COALESCE(nombre_ubicacion, 'Sin ubicacion') AS etiqueta,
        COUNT(*) AS total
    FROM ubicaciones
    GROUP BY COALESCE(nombre_ubicacion, 'Sin ubicacion')
    ORDER BY total DESC, etiqueta ASC
    LIMIT 6
";

$resultadoUbicacionesChart = $conn->query($consultaUbicacionesChart);

if ($resultadoUbicacionesChart) {
    if ($resultadoUbicacionesChart->num_rows > 0) {

        while ($fila = $resultadoUbicacionesChart->fetch_assoc()) {
            $adminChartData['ubicaciones']['labels'][] = (string)$fila['etiqueta'];
            $adminChartData['ubicaciones']['values'][] = (int)$fila['total'];
        }

    } else {
        
        $adminChartData['ubicaciones'] = [
            'labels' => ['Sin ubicaciones'],
            'values' => [0]
        ];
    }
} else {

    $adminChartData['ubicaciones'] = [
        'labels' => ['Error en consulta'],
        'values' => [0]
    ];
}
