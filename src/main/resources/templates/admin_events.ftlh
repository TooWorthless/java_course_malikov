<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event List - Event Registration System</title>
    <link rel="stylesheet" href="/css/admin_events_styles.css">
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
            <h2>All events list</h2>

            <#list events as event>
                <div class="event">
                    <form id="event_${event.id}_form">
                        <!-- <input class="event_input event_input_${event.id}" hidden type="text" name="id" value="${event.id}"> -->

                        <h3 class="event_${event.id}_elem">${event.name}</h3>
                        <input class="event_input event_input_${event.id}" type="text" name="name" value="${event.name}">

                        <p class="event_${event.id}_elem">${event.title}</p>
                        <input class="event_input event_input_${event.id}" type="text" name="title" value="${event.title}">
                        
                        <p class="event_${event.id}_elem"><strong>Description:</strong> ${event.description}</p>
                        <textarea class="event_input event_input_${event.id}" name="description" id="" cols="30" rows="10">
                            ${event.description}
                        </textarea>
                        
                        <p class="event_${event.id}_elem"><strong>Date:</strong> ${event.date}</p>
                        <input class="event_input event_input_${event.id}" type="date" name="date" value="${event.date!}" />
                        
                        <p class="event_${event.id}_elem"><strong>Place:</strong> ${event.place}</p>
                        <input class="event_input event_input_${event.id}" type="text" name="place" value="${event.place}">
                        
                        <p class="event_${event.id}_elem"><strong>Image link:</strong> <a href="${event.image}">${event.image}</a></p>
                        <input class="event_input event_input_${event.id}" type="text" name="image" value="${event.image}">
                    </form>
                    
                    <div class="actions">
                        <button id="edit_event_${event.id}_btn" onclick="editEvent('${event.id}')">Edit</button>
                        <button id="update_event_${event.id}_btn" class="updating_btn" onclick="updateEvent('${event.id}')">Save</button>
                        <button id="cancel_update_event_${event.id}_btn" class="updating_btn" onclick="cancelUpdate('${event.id}')">Cancel</button>
                        <button id="delete_event_${event.id}_btn" onclick="deleteEvent('${event.id}')">Delete</button>
                    </div>
                </div>
            </#list>


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

    <script src="/js/admin_events.js"></script>
</body>
</html>
