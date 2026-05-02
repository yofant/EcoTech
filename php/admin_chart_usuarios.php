<?php
$consultaUsuariosChart = "
    SELECT
        rol AS etiqueta,
        COUNT(*) AS total
    FROM usuarios
    GROUP BY rol
    ORDER BY total DESC, etiqueta ASC
";
$resultadoUsuariosChart = $conn->query($consultaUsuariosChart);

if ($resultadoUsuariosChart && $resultadoUsuariosChart->num_rows > 0) {
    while ($fila = $resultadoUsuariosChart->fetch_assoc()) {
        $adminChartData['usuarios']['labels'][] = ucfirst((string) $fila['etiqueta']);
        $adminChartData['usuarios']['values'][] = (int) $fila['total'];
    }
} else {
    $adminChartData['usuarios'] = adminChartFallback('Sin usuarios');
}
