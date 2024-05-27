<!-- <!DOCTYPE html>
<html>
<head>
    <title>Events</title>
</head>
<body>
    <h1>Events</h1>
    <ul>
        <#list events as event>
            <li>
                <a href="/events/${event.id}">${event.name}</a>
            </li>
        </#list>
    </ul>
    <br>
    <a href="/events/create">Create Event</a>
    <br><br>
    
</body>
</html> -->





<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Все события - Система регистрации событий</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 0;
        }

        header .logo {
            display: flex;
            align-items: center;
            padding-left: 20px;
        }

        header .logo img {
            height: 70px;
            border-radius: 10px;
            margin-right: 10px;
        }

        header nav {
            text-align: right;
            padding-right: 20px;
        }

        header nav ul {
            list-style: none;
            padding: 0;
        }

        header nav ul li {
            display: inline;
            margin-left: 20px;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        header nav ul li a:hover {
            text-decoration: underline;
        }

        main {
            padding: 20px;
        }

        main section {
            margin-bottom: 40px;
        }

        main section h2 {
            color: #4CAF50;
        }

        main section p {
            font-size: 1.1em;
        }

        .event-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .event-item {
            background-color: white;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .event-item h3 {
            margin-top: 0;
        }

        .event-item p {
            margin: 5px 0;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1em;
        }

        button:hover {
            background-color: #45a049;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: absolute;
            width: 100%;
            bottom: 0;
        }

        footer p {
            margin: 5px 0;
        }

        footer ul {
            list-style: none;
            padding: 0;
        }

        footer ul li {
            display: inline;
            margin-left: 10px;
        }

        footer ul li a {
            color: white;
            text-decoration: none;
        }

        footer ul li a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <header>
        <div class="logo">
            <img src="logo.jpg" alt="Логотип">
            <h1>Система регистрации событий</h1>
        </div>
        <nav>
            <ul>
                <li><a href="/">Главная</a></li>
                <li><a href="#">Все события</a></li>
                <li><a href="#">Личный кабинет</a></li>
                <li><a href="#">О нас</a></li>
                <li><a href="#">Контакты</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="events">
            <h2>Все события</h2>
            <p>Список всех доступных событий для регистрации.</p>
            <div class="event-list">

                <#list events as event>
                    <div class="event-item">
                        <h3><a href="/events/${event.id}">${event.name}</a></h3>
                        <p>${event.description}. Дата: ${event.date}</p>
                    </div>
                </#list>

            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Система регистрации событий. Все права защищены.</p>
        <ul>
            <li><a href="privacy.html">Политика конфиденциальности</a></li>
            <li><a href="terms.html">Условия использования</a></li>
        </ul>
    </footer>
</body>
</html>