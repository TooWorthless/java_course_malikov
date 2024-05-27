<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Личный кабинет - Система регистрации событий</title>
    <link rel="stylesheet" href="/css/profile_styles.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="/images/logo.jpg" alt="Логотип">
            <h1>Система регистрации событий</h1>
        </div>          
        <nav>
            <ul>
                <li><a href="/">Главная</a></li>
                <li><a href="/events">Все события</a></li>
                <li><a href="/profile">Личный кабинет</a></li>
                <li><a href="/">О нас</a></li>
                <li><a href="/">Контакты</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="profile">
            <h2>Личный кабинет</h2>
            <div class="profile-info">
                <h3>Информация о пользователе</h3>
                <p><strong>Имя:</strong> ${user.name}</p>
                <p><strong>Email:</strong> ${user.email}</p>
            </div>
            <div class="events-list">
                <h3>События, на которые вы зарегистрированы</h3>
                <ul>
                    <#list events as event>
                        <li><a href="/events/${event.id}">${event.name}</a></li>
                    </#list>
                </ul>
                
            </div>
            <form action="/logout" method="get">
                <button type="submit" id="logout-btn">Выйти из профиля</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Система регистрации событий. Все права защищены.</p>
        <ul>
            <li><a href="privacy.html">Политика конфиденциальности</a></li>
            <li><a href="terms.html">Условия использования</a></li>
        </ul>
    </footer>

    <!-- <script src="/js/logout.js"></script> -->
</body>
</html>
