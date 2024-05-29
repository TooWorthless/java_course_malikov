<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Signup - ERS</title>
    <link rel="stylesheet" href="/css/login_styles.css">
    <script defer src="/js/auth.js"></script>
</head>
<body>
    <header>
        <div class="logo">
            <img src="/images/logo.jpg" alt="Логотип">
            <h1>ERS</h1>
        </div>
        <nav>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/events">All events</a></li>
                <li><a href="/profile">Profile</a></li>
                <li><a href="/">About us</a></li>
                <li><a href="/">Contacts</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="auth">
            <div class="auth-container">
                <div id="login-form" class="form-container">
                    <h2>Login form</h2>
                    <form action="/login" method="post">
                        <label for="username">User Email</label>
                        <input type="text" id="username" name="username" required>

                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>

                        <button type="submit">Log in</button>
                    </form>
                    <p>No account? <a href="#" id="show-register">Sign up</a></p>
                </div>

                <div id="register-form" class="form-container" style="display: none;">
                    <h2>Signup form</h2>
                    <form action="/signup" method="post">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" required>

                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>

                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>

                        <button type="submit">Sign up</button>
                    </form>
                    <p>Already have an account? <a href="#" id="show-login">Log in</a></p>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Event registration system. All rights reserved.</p>
        <ul>
            <li><a href="/">Privacy Policy</a></li>
            <li><a href="/">Terms of Use</a></li>
        </ul>
    </footer>
</body>
</html>
