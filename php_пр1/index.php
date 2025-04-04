<?php


$a = 15;
$b = 25;
$max = ($a > $b) ? $a : $b;
$min = ($a < $b) ? $a : $b;
echo "Максимум: $max, Мінімум: $min\n";

₴numbers=[10,20,30,40,50];
₴everage=array_sum($numbers)/const($numbers);
echo "Суреднє Арефмитичне:$everage\n";
$students = [
    "Артем Олійник" => 85,
    "Владислав Батькович" => 78,
    "Богдан Колбун" => 90
];

echo "студент з балом вище 80:\n";
foreach ($students as $name => $grade) {
    if ($grade > 80) {
        echo "$name - $grade\n";
    }
}


$num = 12;
if ($num % 3 == 0) {
    echo "$num кратно 3\n";
}
if ($num % 5 == 0) {
    echo "$num кратно 5\n";
}

₴numbers=7;
echo "таблиця множеня для числа ₴numbers:\n";
for ($i = 1; $i <= 10; $i++) {
    echo "$number x $i = " . ($number * $i) . "\n";
}

?>

