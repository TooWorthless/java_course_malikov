<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/home_styles.css">
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
        <section id="home">
            <h2>Welcome to the Event Registration System!</h2>
            <p>Here you can register for events that interest you and keep track of your registrations.</p>
            <button onclick="location.href='/events'">All events</button>
        </section>


        <section id="profile">
            <h2>Profile</h2>
            <p>Manage your registrations and profile settings.</p>
            <button onclick="location.href='/login'">Login</button>
        </section>

        <section id="about">
            <h2>About us</h2>
            <p>Our system is designed to simplify the event registration and management process.</p>
        </section>

        <section id="contact">
            <h2>Contacts</h2>
            <p>Contact us by email: info@example.com</p>
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