<?php
header('Content-Type: application/json');
$data_file = 'tasks.json';
function read_tasks() {
    global $data_file;
    if (file_exists($data_file)) {
        $data = file_get_contents($data_file);
        return json_decode($data, true) ?: [];
    }
    return [];
}
function save_tasks($tasks) {
    global $data_file;
    file_put_contents($data_file, json_encode($tasks, JSON_PRETTY_PRINT));
}
$method = $_SERVER['REQUEST_METHOD'];

$endpoint = $_GET['endpoint'] ?? '';

$parts = explode('/', $endpoint);
$resource = $parts[0] ?? '';
$id = $parts[1] ?? null;

switch ($resource) {
    case 'tasks':
        switch ($method) {
            case 'GET':
                
                $tasks = read_tasks();
                echo json_encode($tasks);
                break;

            case 'POST':
            
                $data = json_decode(file_get_contents('php://input'), true);
                if (isset($data['task'])) {
                    $tasks = read_tasks();
                    $new_task = [
                        'id' => uniqid(), 
                        'task' => $data['task'],
                        'completed' => false,
                    ];
                    $tasks[] = $new_task;
                    save_tasks($tasks);
                    echo json_encode($new_task, JSON_PRETTY_PRINT);
                } else {
                    http_response_code(400); 
                    echo json_encode(['error' => 'Поле "task" є обов\'язковим.']);
                }
                break;

            case 'PUT':
            
                if ($id !== null) {
                    $data = json_decode(file_get_contents('php://input'), true);
                    $tasks = read_tasks();
                    $updated = false;
                    foreach ($tasks as &$task) {
                        if ($task['id'] === $id) {
                            if (isset($data['task'])) {
                                $task['task'] = $data['task'];
                            }
                            if (isset($data['completed'])) {
                                $task['completed'] = (bool) $data['completed'];
                            }
                            $updated = true;
                            break;
                        }
                    }
                    if ($updated) {
                        save_tasks($tasks);
                        echo json_encode(['message' => 'Завдання оновлено.']);
                    } else {
                        http_response_code(404); 
                        echo json_encode(['error' => 'Завдання з ID ' . $id . ' не знайдено.']);
                    }
                } else {
                    http_response_code(400); 
                    echo json_encode(['error' => 'Не вказано ID завдання для оновлення.']);
                }
                break;

            case 'DELETE':
                
                if ($id !== null) {
                    $tasks = read_tasks();
                    $initial_count = count($tasks);
                    $tasks = array_filter($tasks, function ($task) use ($id) {
                        return $task['id'] !== $id;
                    });
                    if (count($tasks) < $initial_count) {
                        save_tasks($tasks);
                        echo json_encode(['message' => 'Завдання видалено.']);
                    } else {
                        http_response_code(404); 
                        echo json_encode(['error' => 'Завдання з ID ' . $id . ' не знайдено.']);
                    }
                } else {
                    http_response_code(400); 
                    echo json_encode(['error' => 'Не вказано ID завдання для видалення.']);
                }
                break;

            default:
                http_response_code(405); 
                echo json_encode(['error' => 'Метод не дозволено.']);
                break;
        }
        break;

    default:
        http_response_code(404); 
        echo json_encode(['error' => 'Ендпоінт не знайдено.']);
        break;
}
?>