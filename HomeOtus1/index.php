<?php
require_once __DIR__ . '/vendor/autoload.php';

echo "Enter the path for the file: ";

$file = trim(fgets(STDIN));

$string = file_get_contents($file);

$helper = new Helper();

try {
    echo $helper->matchBrackets($string) ? 'true' . PHP_EOL : 'false' . PHP_EOL;
} catch (InvalidArgumentException $exception) {
    echo "Не верные данные в файле " . $file . PHP_EOL;
}
