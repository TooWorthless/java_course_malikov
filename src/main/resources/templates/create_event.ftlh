<!DOCTYPE html>
<html>
<head>
    <title>Create Event</title>
</head>
<body>
    <h1>Create Event</h1>
    <form action="/events/create" method="post">
        <div>
            <label>Name:</label>
            <input type="text" name="name" value="${event.name!}" />
        </div>
        <div>
            <label>Description:</label>
            <textarea name="description">${event.description!}</textarea>
        </div>
        <div>
            <label>Date:</label>
            <input type="date" name="date" value="${event.date!}" />
        </div>
        <div>
            <button type="submit">Create</button>
        </div>
    </form>

    <br>
    <a href="/">Main</a>
</body>
</html>
