<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>LOGIN</h1>
    <form action="/login" method="post">
        <div><label> User Email : <input type="text" name="username"/> </label></div>
        <!-- <div><label> Email : <input type="text" name="email"/> </label></div> -->
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <div><input type="submit" value="Sign In"/></div>
    </form>

    <br>
    <a href="/signup">Reg</a>
    <br><br>
    <a href="/">Main</a>
</body>
</html>