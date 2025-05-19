<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fooddelivery.model.Delivery" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Admin Delivery Panel</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<nav>
    <a href="../index.jsp">Home</a>
    <a href="createDelivery.jsp">Create Delivery</a>
    <a href="adminDelivery.jsp">Admin Panel</a>
</nav>
<h1>Admin Delivery Panel</h1>
<%
    List<Delivery> deliveries = (List<Delivery>) request.getAttribute("deliveries");
    if (deliveries != null && !deliveries.isEmpty()) {
%>
<table>
    <tr>
        <th>ID</th>
        <th>Customer Name</th>
        <th>Address</th>
        <th>Dish</th>
        <th>Order Time</th>
        <th>Status</th>
    </tr>
    <%
        for (Delivery delivery : deliveries) {
    %>
    <tr>
        <td><%= delivery.getId() %></td>
        <td><%= delivery.getCustomer().getName() %></td>
        <td><%= delivery.getCustomer().getAddress() %></td>
        <td><%= delivery.getDish() %></td>
        <td><%= delivery.getOrderTime() %></td>
        <td><%= delivery.isCancelled() ? "Cancelled" : "Active" %></td>
    </tr>
    <%
        }
    %>
</table>
<%
} else {
%>
<p>No deliveries found.</p>
<%
    }
%>
</body>
</html>