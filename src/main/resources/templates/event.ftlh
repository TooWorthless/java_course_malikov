<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detailed information about the event - Event registration system</title>
    <link rel="stylesheet" href="/css/event_styles.css">
    <link rel="stylesheet" href="/css/slider.css">
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
        <section id="event-details">
            <h2>Detailed information about the event</h2>

            <div class="event-media">
                <div class="slider">
                    <div class="slides">
                        <div class="slide"><img src="${event.image}" alt=""></div>
                    </div>
                </div>
            </div>

            <div class="event-info">
                <h3>${event.name}</h3>
                <p>Date: ${event.date}</p>
                <p>Place: ${event.place}</p>
                <p>Description: ${event.description}</p>

                
                <#if isAlreadyRegistered>
                <p>You are already registered!</p>
                <form action="/registrations/unregister/${er.id}" method="post">
                    <button type="submit">Cancel registration</button>
                </form>
                <#else>
                <form action="/registrations/register" method="post">
                        <input type="hidden" name="event.id" value="${event.id}" />
                        <button type="submit">Register</button>
                    </form>
                </#if>
            </div>

            <!-- <div class="comments-section">
                <h3>Комментарии</h3>
                <div class="comments">
                    <div class="comment">
                        <p><strong>Пользователь 1:</strong> Очень интересное событие, обязательно приду!</p>
                    </div>
                    <div class="comment">
                        <p><strong>Пользователь 2:</strong> Был в прошлом году, всем рекомендую!</p>
                    </div>
                </div>

                <div class="add-comment">
                    <h4>Оставить комментарий</h4>
                    <form>
                        <textarea placeholder="Ваш комментарий" required></textarea>
                        <button type="submit">Отправить</button>
                    </form>
                </div>
            </div> -->
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