<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Goodbye - Logged Out</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Use a beautiful high-blue gradient background -->
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #2196F3, #64B5F6);
            padding-top: 100px;
            text-align: center;
            color: #fff;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: rgba(255,255,255,0.95);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            color: #333;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Goodbye and Thank You!</h1>
    <p>You have been successfully logged out.<br>We hope to see you again soon!</p>
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Back to Home</a>
</div>
</body>
</html>
