<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/13/2025
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Add Food Item</title>
    <link rel="stylesheet" type="text/css" href="addfood.css">
</head>

<body>
<img src="images/SL001.JPG" alt="Kiribath" width="474">
<h2>Add New Food Item</h2>
<form action="AddFoodItem" method="post">
    <label>Food ID:</label><input type="text" name="foodId" required><br>
    <label>Food Name:</label>
    <input type="text" name="name" required><br><br>

    <label>Description:</label><br>
    <textarea name="description" rows="4" cols="40" required></textarea><br><br>

    <label>Category (Cuisine):</label>
    <select name="category" required>
        <option value="Sri Lankan">Sri Lankan</option>
        <option value="Indian">Indian</option>
        <option value="Chinese">Chinese</option>
        <option value="Italian">Italian</option>
        <option value="Dessert">Dessert</option>
    </select><br><br>

    <label>Price (Rs):</label>
    <input type="number" name="price" required><br><br>

    <input type="submit" value="Add Food Item">
</form>
