<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal account - Event registration system</title>
    <link rel="stylesheet" href="/css/profile_styles.css">
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
        <section id="profile">
            <h2>Profile</h2>
            <div class="profile-info">
                <h3>User information</h3>
                <p><strong>Name:</strong> ${user.name}</p>
                <p><strong>Email:</strong> ${user.email}</p>
            </div>
            <div class="events-list">
                <h3>Events you are registered for</h3>
                <ul>
                    <#list events as event>
                        <li>
                            <a href="/event/${event.id}">${event.name}</a>
                        </li>
                    </#list>
                </ul>
                
            </div>
            <form action="/logout" method="get">
                <button type="submit" id="logout-btn">Log out</button>
            </form>
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
