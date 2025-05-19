<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Delivery</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Delivery Details</h2>
<c:if test="${delivery == null}">
    <p>Delivery not found.</p>
</c:if>
<c:if test="${delivery != null}">
    <p>ID: ${delivery.id}</p>
    <p>Customer: ${delivery.customer.name}</p>
    <p>Address: ${delivery.customer.address}</p>
    <p>Dish: ${delivery.dish}</p>
    <p>Order Time: ${delivery.orderTime}</p>
    <p>Status: ${delivery.cancelled ? 'Cancelled' : 'Active'}</p>
    <c:if test="${!delivery.cancelled && LocalDateTime.now().isBefore(delivery.orderTime.plusMinutes(10))}">
        <form action="cancelDelivery" method="post">
            <input type="hidden" name="id" value="${delivery.id}">
            <button type="submit">Cancel Delivery</button>
        </form>
    </c:if>
</c:if>
<a href="${pageContext.request.contextPath}/jsp/createDelivery.jsp">Create New Delivery</a>
<br>
<a href="${pageContext.request.contextPath}/jsp/adminDelivery.jsp">Admin Panel</a>
</body>
</html>