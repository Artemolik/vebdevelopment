<!DOCTYPE html>
<html lang="uk">
<head><meta charset="UTF-8"><title>Замовлення</title></head>
<body>
  <form id="form">
    Ім’я: <input id="name" required><br>
    Email: <input id="email" type="email" required><br>
    Товар: 
    <select id="product">
      <option value="100">Ноутбук - 100$</option>
      <option value="50">Мишка - 50$</option>
      <option value="20">Клавіатура - 20$</option>
    </select><br>
    Кількість: <input id="qty" type="number" min="1" max="100" required><br>
    <button type="submit">Замовити</button>
  </form>

  <div id="result"></div>

  <script>
    form.onsubmit = e => {
      e.preventDefault();
      const name = name.value.trim();
      const email = email.value.trim();
      const price = +product.value;
      const qty = +qty.value;
      if (qty < 1 || qty > 100) return alert("Кількість 1–100!");
      const total = price * qty;
      result.innerHTML = `Ім’я: ${escape(name)}<br>Email: ${escape(email)}<br>Сума: ${total}$`;
      form.reset();
    };
    function escape(str) {
      return str.replace(/[&<>"']/g, t => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#039;'}[t]));
    }
  </script>
</body>
</html>

