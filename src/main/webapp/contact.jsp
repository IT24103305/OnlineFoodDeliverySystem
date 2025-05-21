<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - DelishExpress</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: url('${pageContext.request.contextPath}/images/contact-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            padding-top: 50px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: rgba(255,255,255,0.95);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Contact Us</h1>
    <p>If you have any questions or need assistance, please contact us via the following:</p>
    <ul>
        <li><strong>Phone:</strong> +94 11 1234567</li>
        <li><strong>Email:</strong> info@delishexpress.lk</li>
        <li><strong>Address:</strong> 123, Food Street, Colombo 07, Sri Lanka</li>
    </ul>
    <div class="text-center mt-3">
        <button onclick="location.href='${pageContext.request.contextPath}/index.jsp'" class="btn btn-info">Back to Home</button>
    </div>
</div>
</body>
</html>
