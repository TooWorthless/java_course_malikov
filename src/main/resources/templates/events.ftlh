<!DOCTYPE html>
<html>
<head>
    <title>Events</title>
</head>
<body>
    <h1>Events</h1>
    <ul>
        <#list events as event>
            <li>
                <a href="/events/${event.id}">${event.name}</a>
            </li>
        </#list>
    </ul>
    <br>
    <a href="/events/create">Create Event</a>
    <br><br>
    <a href="/">Main</a>
</body>
</html>
