<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All events - Event registration system</title>
    <link rel="stylesheet" href="/css/events_styles.css">
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
        <section id="events">
            <h2>All events</h2>
            <p>List of all available events for registration.</p>
            <div class="event-list">

                <#list events as event>
                    <div class="event-item">
                        <h3><a href="/event/${event.id}">${event.name}</a></h3>
                        <p>${event.title}. Date: ${event.date}</p>
                    </div>
                </#list>

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