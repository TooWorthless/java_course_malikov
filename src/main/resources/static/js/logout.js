document.addEventListener('DOMContentLoaded', function() {
    const logoutBtn = document.getElementById('logout-btn');

    logoutBtn.addEventListener('click', function() {
        // В данном примере просто выводим сообщение об успешном выходе из профиля
        alert('Выход из профиля');
        // Добавьте здесь логику для реального выхода из профиля, например, очистку данных сеанса или перенаправление на страницу входа
    });
});
