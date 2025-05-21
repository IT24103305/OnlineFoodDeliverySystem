<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/13/2025
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.FoodItem, controller.FoodManager" %>

<%


    String foodId = request.getParameter("foodId");
    FoodItem item = FoodManager.getFoodById(foodId); // you must implement this

    if (item == null) {
%>

<p>Food item not found.</p> <% return; } %> <!DOCTYPE html> <html> <head> <title>Edit Food Item</title> <link rel="stylesheet" href="css/addFood.css"> </head> <body> <h2>Edit Food Item</h2> <form action="EditFoodDetails" method="post"> <input type="hidden" name="foodId" value="<%= item.getFoodId() %>">
    php-template
    Copy
    Edit
    Name:<br>
    <input type="text" name="name" value="<%= item.getName() %>" required><br><br>

    Description:<br>
    <textarea name="description" required><%= item.getDescription() %></textarea><br><br>

    Category:<br>
    <input type="text" name="category" value="<%= item.getCategory() %>" required><br><br>

    Price (LKR):<br>
    <input type="number" name="price" value="<%= item.getPrice() %>" step="0.01" required><br><br>

    <input type="submit" value="Update Food Item">
</form> </body> </html>