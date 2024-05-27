<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        <section id="home">
            <h2>Добро пожаловать в Систему регистрации событий!</h2>
            <p>Здесь вы можете зарегистрироваться на интересующие вас мероприятия и следить за своими регистрациями.</p>
            <button onclick="location.href='/events'">Посмотреть события</button>
        </section>


        <section id="profile">
            <h2>Личный кабинет</h2>
            <p>Управляйте своими регистрациями и настройками профиля.</p>
            <button onclick="location.href='/login'">Войти</button>
        </section>

        <section id="about">
            <h2>О нас</h2>
            <p>Наша система предназначена для упрощения процесса регистрации на события и управления ими.</p>
        </section>

        <section id="contact">
            <h2>Контакты</h2>
            <p>Свяжитесь с нами по электронной почте: info@example.com</p>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Система регистрации событий. Все права защищены.</p>
        <ul>
            <li><a href="#privacy">Политика конфиденциальности</a></li>
            <li><a href="#terms">Условия использования</a></li>
        </ul>
    </footer>

</body>

</html>