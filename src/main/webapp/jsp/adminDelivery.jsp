<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Admin Panel - All Deliveries</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Customer</th>
        <th>Address</th>
        <th>Dish</th>
        <th>Order Time</th>
        <th>Status</th>
    </tr>
    <c:forEach var="delivery" items="${deliveries}">
        <tr>
            <td>${delivery.id}</td>
            <td>${delivery.customer.name}</td>
            <td>${delivery.customer.address}</td>
            <td>${delivery.dish}</td>
            <td>${delivery.orderTime}</td>
            <td>${delivery.cancelled ? 'Cancelled' : 'Active'}</td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/">Back to Home</a>
</body>
</html>