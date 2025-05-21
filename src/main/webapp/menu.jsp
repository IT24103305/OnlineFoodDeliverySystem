<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/19/2025
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*, model.FoodItem, model.FoodManager" %>
<%
    List<FoodItem> foodList = FoodManager.getAllFoodItems();
    String category = request.getParameter("category");
%>
<html>
<head><title>Menu - SunBite</title>
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
<div style="text-align: right; padding: 10px;">
    <a href="admin_index.jsp" style="padding: 8px 16px; background-color: #0077cc; color: white; text-decoration: none; border-radius: 6px; font-weight: bold;">Admin Login</a>
</div>

<h1 class="menu-title">Menu</h1>
<div class="category-buttons">
    <a href="menu.jsp?category=All">All</a>
    <a href="menu.jsp?category=Koththu">Koththu</a>
    <a href="menu.jsp?category=Pasta">Pasta</a>
    <a href="menu.jsp?category=Pizza">Pizza</a>
    <a href="menu.jsp?category=Drinks">Drinks</a>
    <a href="menu.jsp?category=Fried Rice">Fried Rice</a>
</div>
<div class="menu-container">
    <%
        for (FoodItem item : foodList) {
            if (category == null || category.equals("All") || item.getCategory().equalsIgnoreCase(category)) {
    %>
    <div class="card"> <img src="images/<%= item.getFoodId() %>.jpg" alt="<%= item.getName() %>">
        <div
                class="info"> <h3><%= item.getName() %></h3>
            <p><%= item.getDescription() %></p>
            <p class="price">LKR <%= item.getPrice() %></p>
        </div>
        <div class="item-info">
            <h3><%= item.getName() %></h3>
            <p><%= item.getDescription() %></p>
            <p class="price">LKR <%= item.getPrice() %></p>
        </div>
    </div>
    <%  }
    }
    %>
</div>
</body>
</html>
