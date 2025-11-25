<?php

// 1. Obtener la palabra de búsqueda del argumento de línea de comandos
if (!isset($argv[1])) {
    echo "0 Error\n";
    exit(1);
}
$searchWord = $argv[1];

// 2. Cargar la cadena de texto
$text = @file_get_contents('text.txt');
if ($text === false) {
    echo "0 Error_lectura\n";
    exit(1);
}

// 3. Medir el tiempo de búsqueda
$startTime = microtime(true);

// substr_count es la función nativa más rápida para esto
$count = substr_count($text, $searchWord);

$endTime = microtime(true);
$elapsedTime = ($endTime - $startTime) * 1000; // Convertir a milisegundos (ms)

// 4. Imprimir el resultado: CONTEO TIEMPO_STRING
// Usamos Milisegundos (ms) para PHP.
echo $count . " " . sprintf('%.3f ms', $elapsedTime) . "\n";

?>