async function fetchData(id) {
  const delay = Math.floor(Math.random() * 2000) + 1000; 
  console.log(Запит ${id} розпочато (затримка: ${delay / 1000} с));

  return new Promise((resolve) => {
    setTimeout(() => {
      console.log(Запит ${id} завершено);
      resolve(Дані для ID: ${id});
    }, delay);
  });
}
async function processData() {
  console.log('Паралельне виконання трьох запитів...');
  const parallelResults = await Promise.all([fetchData(1), fetchData(2), fetchData(3)]);
  console.log('Результати паралельного виконання:', parallelResults);

  console.log('Послідовне виконання трьох запитів...');

  for await (const result of [fetchData(4), fetchData(5), fetchData(6)]) {
    console.log('Отримано:', result);
  }

  console.log('Усі запити завершені!');
}

processData();