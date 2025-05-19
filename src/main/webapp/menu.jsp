<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/19/2025
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.FoodItem, controller.FoodManager, java.util.*" %>
<%
    String selectedCategory = request.getParameter("category");
    List<FoodItem> foodList = FoodManager.getAllFoodItems();
%>

<!DOCTYPE html> <html>
<head>
    <title>Menu - SunBite</title>
    <link rel="stylesheet" href="menu.css">
</head>
<body> <h1 class="title">Menu</h1>
<div class="category-tabs">
    <a href="menu.jsp">All</a>
    <a href="menu.jsp?category=Koththu">Koththu</a>
    <a href="menu.jsp?category=Pasta">Pasta</a>
    <a href="menu.jsp?category=Pizza">Pizza</a>
    <a href="menu.jsp?category=Drinks">Drinks</a>
    <a href="menu.jsp?category=Fried Rice">Fried Rice</a>
</div> <div class="menu-container">
    <%
        for (FoodItem item : foodList) {
            if (selectedCategory == null || selectedCategory.equalsIgnoreCase("All") || selectedCategory.equalsIgnoreCase(item.getCategory())) {
    %>

    <div class="card"> <img src="images/<%= item.getFoodId() %>.jpg" alt="<%= item.getName() %>">
        <div
            class="info"> <h3><%= item.getName() %></h3>
        <p><%= item.getDescription() %></p>
            <p class="price">LKR <%= item.getPrice() %></p>
        <form action="AddToCart" method="post">
            <input type="hidden" name="foodId" value="<%= item.getFoodId() %>">
            <input type="hidden" name="name" value="<%= item.getName() %>">
            <input type="hidden" name="price" value="<%= item.getPrice() %>">
            <input type="number" name="quantity" value="1" min="1" required>
            <input type="submit" value="Add to Cart">
    </form>
    </div>
    </div> <% } } %>
</div>
</body>
</html>