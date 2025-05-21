<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/13/2025
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.FoodItem, controller.FoodManager" %>

<%


    String username = (String) session.getAttribute("username");
    List<FoodItem> foodList = FoodManager.getAllFoodItems();
%>

<!DOCTYPE html> <html> <head> <title>View All Food Items</title> <link rel="stylesheet" href="css/viewFood.css"> </head> <body> <header> <div class="logo">🍴 SunBite Admin</div> <nav class="nav-links"> <a href="admin_index.jsp">Dashboard</a> <a href="AddFoodItem.jsp">Add Food</a> <a href="logout.jsp">Logout</a> </nav> </header> <h2>Welcome, Admin <%= username %>!</h2> <h3>All Food Items</h3>
<%
    if (foodList == null || foodList.isEmpty()) {
%>
<p>No food items found.</p>
<%
} else {
%>
<table>
    <tr>
        <th>Food ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Category</th>
        <th>Price (LKR)</th>
        <th>Actions</th>
    </tr>
    <%
        for (FoodItem item : foodList) {
    %>
    <tr>
        <td><%= item.getFoodId() %></td>
        <td><%= item.getName() %></td>
        <td><%= item.getDescription() %></td>
        <td><%= item.getCategory() %></td>
        <td><%= item.getPrice() %></td>
        <td>
            <a href="EditFoodDetails.jsp?foodId=<%= item.getFoodId() %>">Edit</a> |
            <a href="DeleteFoodItem.jsp?foodId=<%= item.getFoodId() %>" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
<%
    }
%>

</body> </html>