<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/13/2025
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*, model.FoodItem, controller.FoodManager" %>
<%
    String selectedCategory = request.getParameter("category");
    List<FoodItem> allItems = FoodManager.getAllFoodItems();
    List<FoodItem> filteredItems = new ArrayList<>();

    for (FoodItem item : allItems) {
        if (item.getCategory().equalsIgnoreCase(selectedCategory)) {
            filteredItems.add(item);
        }
    }

    // Setup session queue (cart)
    Queue<FoodItem> cart = (Queue<FoodItem>) session.getAttribute("cartQueue");
    if (cart == null) {
        cart = new LinkedList<>();
        session.setAttribute("cartQueue", cart);
    }
%>

<html>
<head><title>Select Food - <%= selectedCategory %></title></head>
<body>
<h2><%= selectedCategory %> Cuisine</h2>

<table border="1">
    <tr><th>Name</th><th>Price</th><th>Action</th></tr>
    <% for (FoodItem item : filteredItems) { %>
    <tr>
        <td><%= item.getName() %></td>
        <td><%= item.getPrice() %></td>
        <td>
            <form action="AddToCart" method="post">
                <input type="hidden" name="foodId" value="<%= item.getFoodId() %>">
                Quantity: <input type="number" name="quantity" value="1" min="1">
                <input type="submit" value="Add to Cart">
            </form>
        </td>
    </tr>
    <% } %>
</table>

<p><a href="viewCart.jsp">View Cart</a></p>
</body>
</html>
