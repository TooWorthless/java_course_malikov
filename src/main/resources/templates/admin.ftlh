<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin home - Event Registration System</title>
    <link rel="stylesheet" href="/css/admin_nav_styles.css">
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
        <section>
            <h2>Event management</h2>
            <p>Here you can view all events, delete them, or change information about them</p>
            <button onclick="location.href='/admin/events'">Events</button>
            <button onclick="location.href='/admin/events/create'">Create event</button>
        </section>


        <!-- <section>
            <h2>User management</h2>
            <p>Here you can view all users, delete them, or change infromation about them</p>
            <button onclick="location.href='/admin/users'">Users</button>
            <button onclick="location.href='/admin/user'">Create user</button>
        </section> -->
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