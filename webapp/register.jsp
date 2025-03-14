<!DOCTYPE html>
<html>
<head>
    <title>Register a New User</title>
</head>
<body>
<h1>Register a New User</h1>
<form action="user" method="post">
    <input type="hidden" name="action" value="create">
    <label for="userId">User ID:</label>
    <input type="text" id="userId" name="userId" required><br><br>

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required><br><br>

    <label for="phoneNumber">Phone Number:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>

    <button type="submit">Register</button>
</form>
</body>
</html>
