<?php
$consultaEstadosChart = "
    SELECT
        COALESCE(e.nombre_estado, 'Sin estado') AS etiqueta,
        COUNT(*) AS total
    FROM activos a
    LEFT JOIN estados e ON e.id_estado = a.id_estado
    GROUP BY COALESCE(e.nombre_estado, 'Sin estado')
    ORDER BY total DESC, etiqueta ASC
    LIMIT 6
";
$resultadoEstadosChart = $conn->query($consultaEstadosChart);

if ($resultadoEstadosChart) {
    if ($resultadoEstadosChart->num_rows > 0) {

        while ($fila = $resultadoEstadosChart->fetch_assoc()) {
            $adminChartData['estados']['labels'][] = (string)$fila['etiqueta'];
            $adminChartData['estados']['values'][] = (int)$fila['total'];
        }

    } else {
        
        $adminChartData['estados'] = [
            'labels' => ['Sin estados'],
            'values' => [0]
        ];
    }
} else {

    $adminChartData['estados'] = [
        'labels' => ['Error en consulta'],
        'values' => [0]
    ];
}
