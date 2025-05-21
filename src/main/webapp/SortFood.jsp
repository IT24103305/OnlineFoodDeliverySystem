<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/21/2025
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.FoodItem, model.FoodManager, algorithm.QuickSort" %>
<%
    List<FoodItem> foodList = FoodManager.getAllFoodItems();
    FoodItem[] itemsArray = foodList.toArray(new FoodItem[0]);
    QuickSort.sort(itemsArray, 0, itemsArray.length - 1);
%>
<html>
<head><title>Sorted Food Items</title></head>
<body>
<h2>Sorted by Price (Low to High)</h2>
<table border="1">
    <tr><th>ID</th><th>Name</th><th>Description</th><th>Category</th><th>Price</th></tr>
    <% for (FoodItem item : itemsArray) { %>
    <tr>
        <td><%= item.getFoodId() %></td>
        <td><%= item.getName() %></td>
        <td><%= item.getDescription() %></td>
        <td><%= item.getCategory() %></td>
        <td><%= item.getPrice() %></td>
    </tr>
    <% } %>
</table>
</body>
</html>
