<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creating an Event - Event Registration System</title>
    <link rel="stylesheet" href="/css/admin_create_styles.css">
</head>

<body>
    <header>
        <div class="logo">
            <img src="/images/logo.jpg">
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
        <section id="create-event">
            <h2>Create new event</h2>
            <form id="createEventForm" onsubmit="submitForm(event)">
                <label for="name">Name:</label>
                <input class="event_form_input" type="text" id="name" name="name" required>

                <label for="title">Title:</label>
                <input class="event_form_input" type="text" id="title" name="title" required>

                <label for="description">Description:</label>
                <textarea class="event_form_input" id="description" name="description" required></textarea>

                <label for="date">Date:</label>
                <input class="event_form_input" type="date" id="date" name="date" required>

                <label for="place">Place:</label>
                <input class="event_form_input" type="text" id="place" name="place" required>

                <label for="image">Image link:</label>
                <input class="event_form_input" type="text" id="image" name="image" required>

                <div class="button-group">
                    <div id="button" onclick="submitForm()">Create</div>
                    <button type="button" onclick="resetForm()">Reset</button>
                </div>
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

    <input hidden type="text" id="email" value="${email}">
    <input hidden type="text" id="password" value="${password}">

    <script src="/js/admin_create_event.js"></script>

</body>

</html>