<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/13/2025
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
%>

<!DOCTYPE html> <html> <head> <title>My Cart</title> <style>
    body { font-family: sans-serif; padding: 20px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; } th, td { border: 1px solid #ccc; padding: 10px; text-align: left; } th { background-color: #f0f0f0; } </style>
</head>
<body>
<h2>Your Cart</h2>
<%
    if (cart == null || cart.isEmpty()) {
%>

<p>Your cart is empty.</p> <% } else { double total = 0; %>
<table> <tr> <th>Item</th> <th>Qty</th> <th>Price</th> <th>Subtotal</th>
</tr>
    <% for (Map<String, Object> item : cart) { String name = (String) item.get("name"); int qty = (int) item.get("quantity"); double price = (double) item.get("price"); double sub = price * qty; total += sub; %>
    <tr>
        <td><%= name %></td> <td><%= qty %></td>
        <td>LKR <%= price %></td> <td>LKR <%= sub %></td>
    </tr>
    <%
     }
    %>
    <tr>
        <td colspan="3"><strong>Total</strong></td>
        <td><strong>LKR <%= total %></strong></td>
    </tr>
</table>
<div class="checkout">
    <form action="CheckoutOrder" method="post">
        <input type="submit" value="Confirm Order" style="margin-top: 20px; padding: 10px 20px; background-color: green; color: white; border: none; border-radius: 6px;">
    </form>
</div>
<%
    }
%>
</body>
</html>