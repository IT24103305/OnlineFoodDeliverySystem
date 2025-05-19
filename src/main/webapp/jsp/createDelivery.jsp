<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Delivery</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Create a New Delivery</h2>
<form action="${pageContext.request.contextPath}/createDelivery" method="post">
    <label for="name">Customer Name:</label>
    <input type="text" id="name" name="name" required>
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required>
    <label for="dish">Dish:</label>
    <select id="dish" name="dish" required>
        <option value="Pizza">Pizza</option>
        <option value="Burger">Burger</option>
        <option value="Pasta">Pasta</option>
        <option value="Salad">Salad</option>
    </select>
    <button type="submit">Create Delivery</button>
</form>
<a href="${pageContext.request.contextPath}/">Back to Home</a>
</body>
</html>