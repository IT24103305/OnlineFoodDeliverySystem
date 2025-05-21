<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome, ${sessionScope.user.username} - DelishExpress</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background: linear-gradient(135deg, #4A90E2, #50E3C2);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
            text-align: center;
            padding-top: 100px;
            margin: 0;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }
        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.2rem;
        }
        .btn-group {
            margin-top: 30px;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>
    <p>You have successfully logged in to DelishExpress Food Delivery.</p>
    <div class="btn-group">
        <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
            Proceed to Home
        </button>
    </div>
</div>
</body>
</html>
