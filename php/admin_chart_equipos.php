<?php
$consultaEquiposChart = "
    SELECT 
    COALESCE(a.marca, 'Sin marca') AS etiqueta,
    COUNT(*) AS total
FROM activos a
GROUP BY COALESCE(a.marca, 'Sin marca')
ORDER BY total DESC, etiqueta ASC
LIMIT 6;

";
$resultadoEquiposChart = $conn->query($consultaEquiposChart);

if ($resultadoEquiposChart) {
    if ($resultadoEquiposChart->num_rows > 0) {

        while ($fila = $resultadoEquiposChart->fetch_assoc()) {
            $adminChartData['equipos']['labels'][] = (string)$fila['etiqueta'];
            $adminChartData['equipos']['values'][] = (int)$fila['total'];
        }

    } else {
        
        $adminChartData['equipos'] = [
            'labels' => ['Sin equipos'],
            'values' => [0]
        ];
    }
} else {

    $adminChartData['equipos'] = [
        'labels' => ['Error en consulta'],
        'values' => [0]
    ];
}
