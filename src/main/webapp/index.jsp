<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Food Delivery App</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <nav>
        <h1>Food Delivery App</h1>
        <div>
            <a href="${pageContext.request.contextPath}/jsp/createDelivery.jsp">Create Delivery</a>
            <a href="${pageContext.request.contextPath}/jsp/adminDelivery.jsp">Admin Panel</a>
        </div>
    </nav>
</header>

<div class="container">
    <h2>Welcome to Food Delivery App</h2>
    <p style="text-align: center;">Order your favorite meals with ease!</p>
    <div style="text-align: center; margin-top: 20px;">
        <a href="${pageContext.request.contextPath}/jsp/createDelivery.jsp" class="button">Create a New Delivery</a>
        <a href="${pageContext.request.contextPath}/jsp/adminDelivery.jsp" class="button">View Admin Panel</a>
    </div>
</div>

<footer>
    &copy; 2025 Food Delivery App. All rights reserved.
</footer>
</body>
</html>