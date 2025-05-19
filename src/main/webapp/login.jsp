<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/19/2025
  Time: 7:43 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - SunBite</title>
    <link rel="stylesheet" href="login.css">
    <script>
        function checkUsername(input) {
            var roleSelect = document.getElementById("role");
            if (input.value.toLowerCase() === "admin") {
                roleSelect.innerHTML = `
          <option value="admin">Admin</option>
          <option value="customer">Customer</option>
        `;
            } else {
                roleSelect.innerHTML = `
          <option value="customer">Customer</option>
        `;
            }
        }
    </script>
</head>
<body>
<div class="login-container">
    <h2>SunBite Login</h2>
    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Enter Username" required><br>
        <select name="role" required>
            <option value="">Select Role</option>
            <option value="customer">Customer</option>
            <option value="admin">Admin</option>
        </select>
        <br>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>