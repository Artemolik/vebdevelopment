function calculator() {
    let a = parseFloat(prompt("Введіть перше число:"));
    let b = parseFloat(prompt("Введіть друге число:"));
    let operation = prompt("Введіть операцію (+, -, *, /):");

    let result;

    switch (operation) {
        case "+":
            result = a + b;
            break;
        case "-":
            result = a - b;
            break;
        case "*":
            result = a * b;
            break;
        case "/":
            result = b !== 0 ? a / b : "Помилка! Ділення на нуль.";
            break;
        default:
            result = "Невірна операція!";
    }

    alert("Результат: " + result);
}
calculator();

