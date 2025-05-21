<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DelishExpress - Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Use the registration background image -->
    <style>
        body {
            background: url('${pageContext.request.contextPath}/images/register-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            padding-top: 50px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: rgba(255,255,255,0.95);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 { text-align: center; margin-bottom: 30px; }
    </style>
    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }
    </script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Register</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/registerProcess" method="post" onsubmit="return validateForm();">
        <div class="mb-3">
            <label for="username" class="form-label">Username:</label>
            <input required type="text" class="form-control" id="username" name="username">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input required type="email" class="form-control" id="email" name="email">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input required type="password" class="form-control" id="password" name="password"
                   pattern="(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}"
                   title="Password must be at least 8 characters and include a number and symbol">
        </div>
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password:</label>
            <input required type="password" class="form-control" id="confirmPassword" name="confirmPassword">
        </div>
        <button type="submit" class="btn btn-primary w-100">Register</button>
        <button type="reset" class="btn btn-secondary w-100 mt-2">Clear</button>
    </form>
    <div class="mt-3 text-center">
        <a href="${pageContext.request.contextPath}/login.jsp" class="text-decoration-none">Already have an account? Sign In</a>
    </div>
    <div class="mt-3 text-center">
        <button onclick="location.href='${pageContext.request.contextPath}/index.jsp'" class="btn btn-info">Back to Home</button>
    </div>
</div>
</body>
</html>
