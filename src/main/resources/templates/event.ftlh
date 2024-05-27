<!-- <!DOCTYPE html>
<html>
<head>
    <title>Event</title>
</head>
<body>
    <h1>${event.name}</h1>
    <p>${event.description}</p>
    <p>Date: ${event.date}</p>
    <form action="/registrations/register" method="post">
        <input type="hidden" name="event.id" value="${event.id}" />
        <button type="submit">Register</button>
    </form>w
    <br>
    <a href="/">Main</a>
</body>
</html>
 -->



<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Детальная информация о событии - Система регистрации событий</title>
    <link rel="stylesheet" href="/css/event_styles.css">
    <link rel="stylesheet" href="/css/slider.css">
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
        <section id="event-details">
            <h2>Детальная информация о событии</h2>

            <div class="event-media">
                <div class="slider">
                    <!-- Slides -->
                    <div class="slides">
                        <div class="slide"><img src="/images/image1.jpg" alt="Изображение 1"></div>
                        <!-- <div class="slide"><img src="/image2.jpg" alt="Изображение 2"></div>
                        <div class="slide"><img src="/image3.jpg" alt="Изображение 3"></div> -->
                        <!-- Добавьте больше изображений по необходимости -->
                    </div>
                    <!-- Navigation -->
                    <div class="slider-nav">
                        <button class="prev">❮</button>
                        <button class="next">❯</button>
                    </div>
                </div>
            </div>

            <form action="/registrations/register" method="post" class="event-info">
                <h3>${event.name}</h3>
                <p>Дата: ${event.date}</p>
                <p>Место проведения: Адрес проведения события</p>
                <p>Описание: ${event.description}</p>

                <input type="hidden" name="event.id" value="${event.id}" />

                <#if isAlreadyRegistered>
                    <p>Вы уже зарегистрированы</p>
                <#else>
                    <button type="submit">Зарегистрироваться</button>
                </#if>
            </form>

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

    <script src="/js/slider.js"></script>
    
</body>

</html>