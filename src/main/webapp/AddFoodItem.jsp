<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/13/2025
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Add Food Item</title></head>
<body>
<h2>Add New Food Item</h2>
<form action="AddFoodItem" method="post">
    Food ID: <input type="text" name="foodId" required><br>
    Name: <input type="text" name="name" required><br>
    Description: <input type="text" name="description" required><br>
    Category: <input type="text" name="category" required><br>
    Price: <input type="number" step="0.01" name="price" required><br>
    <input type="submit" value="Add Item">
</form>
</body>
</html>