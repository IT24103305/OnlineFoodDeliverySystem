<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Delivery</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <nav>
        <h1>Food Delivery App</h1>
        <div>
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/jsp/adminDelivery.jsp">Admin Panel</a>
        </div>
    </nav>
</header>

<div class="container">
    <h2>Create a New Delivery</h2>
    <form action="createDelivery" method="post">
        <label for="name">Customer Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="address">Delivery Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="dish">Select Dish:</label>
        <select id="dish" name="dish" required>
            <option value="Pizza">Pizza</option>
            <option value="Burger">Burger</option>
            <option value="Pasta">Pasta</option>
            <option value="Sushi">Sushi</option>
        </select>

        <button type="submit">Create Delivery</button>
    </form>
</div>

<footer>
    © 2025 Food Delivery App. All rights reserved.
</footer>
</body>
</html>