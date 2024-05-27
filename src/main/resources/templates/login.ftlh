<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>LOGIN</h1>
    <form action="/login" method="post">
        <div><label> User Email : <input type="text" name="username"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <div><input type="submit" value="Sign In"/></div>
    </form>

    <br>
    <a href="/signup">Reg</a>
    <br><br>
    <a href="/">Main</a>
</body>
</html> -->



<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход / Регистрация - Система регистрации событий</title>
    <link rel="stylesheet" href="/css/login_styles.css">
    <script defer src="/js/auth.js"></script>
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
        <section id="auth">
            <div class="auth-container">
                <div id="login-form" class="form-container">
                    <h2>Вход</h2>
                    <form action="/login" method="POST">
                        <label for="username">Имя пользователя</label>
                        <input type="text" id="username" name="username" required>

                        <label for="password">Пароль</label>
                        <input type="password" id="password" name="password" required>

                        <button type="submit">Войти</button>
                    </form>
                    <p>Нет аккаунта? <a href="#" id="show-register">Зарегистрироваться</a></p>
                </div>

                <div id="register-form" class="form-container" style="display: none;">
                    <h2>Регистрация</h2>
                    <form action="/signup" method="POST">
                        <label for="name">Имя</label>
                        <input type="text" id="name" name="name" required>

                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>

                        <label for="password">Пароль</label>
                        <input type="password" id="password" name="password" required>

                        <button type="submit">Зарегистрироваться</button>
                    </form>
                    <p>Уже есть аккаунт? <a href="#" id="show-login">Войти</a></p>
                </div>
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
