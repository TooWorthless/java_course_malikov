<!DOCTYPE html>
<html>
<head>
    <title>Event</title>
</head>
<body>
    <h1>${event.name}</h1>
    <p>${event.description}</p>
    <p>Date: ${event.date}</p>
    <!-- <form action="/registrations/register" method="post">
        <input type="hidden" name="event.id" value="${event.id}" />
        <button type="submit">Register</button>
    </form> -->
    <!-- sdf -->
    <br>
    <a href="/">Main</a>
</body>
</html>




<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Детальная информация о событии - Система регистрации событий</title>
    <link rel="stylesheet" href="event_styles.css">
    <link rel="stylesheet" href="slider.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="logo.png" alt="Логотип">
            <h1>Система регистрации событий</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.html">Главная</a></li>
                <li><a href="events.html">Все события</a></li>
                <li><a href="profile.html">Личный кабинет</a></li>
                <li><a href="about.html">О нас</a></li>
                <li><a href="contact.html">Контакты</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="event-details">
            <h2>Детальная информация о событии</h2>

            <div class="event-media">
                <div class="slider">
                    <!-- Slides -->
                    <div class="slides">
                        <div class="slide"><img src="image1.jpg" alt="Изображение 1"></div>
                        <div class="slide"><img src="image2.jpg" alt="Изображение 2"></div>
                        <div class="slide"><img src="image3.jpg" alt="Изображение 3"></div>
                        <!-- Добавьте больше изображений по необходимости -->
                    </div>
                    <!-- Navigation -->
                    <div class="slider-nav">
                        <button class="prev">❮</button>
                        <button class="next">❯</button>
                    </div>
                </div>
            </div>

            <div class="event-info">
                <h3>Название события</h3>
                <p>Дата: 01.06.2024</p>
                <p>Место проведения: Адрес проведения события</p>
                <p>Описание: Это подробное описание события, включающее информацию о программе, выступающих, организаторах и других деталях.</p>
                <button>Зарегистрироваться</button>
            </div>

            <div class="comments-section">
                <h3>Комментарии</h3>
                <div class="comments">
                    <div class="comment">
                        <p><strong>Пользователь 1:</strong> Очень интересное событие, обязательно приду!</p>
                    </div>
                    <div class="comment">
                        <p><strong>Пользователь 2:</strong> Был в прошлом году, всем рекомендую!</p>
                    </div>
                    <!-- Добавьте больше комментариев по необходимости -->
                </div>

                <div class="add-comment">
                    <h4>Оставить комментарий</h4>
                    <form>
                        <textarea placeholder="Ваш комментарий" required></textarea>
                        <button type="submit">Отправить</button>
                    </form>
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

    <script src="slider.js"></script>
</body>
</html>
