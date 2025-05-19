<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://xmlns.jcp.org/jsp/jstl/core" %>
<%@ page import="java.time.LocalDateTime" %>
<html>
<head>
    <title>View Delivery</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <nav>
        <h1>Food Delivery App</h1>
        <div>
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/jsp/createDelivery.jsp">Create Delivery</a>
            <a href="${pageContext.request.contextPath}/jsp/adminDelivery.jsp">Admin Panel</a>
        </div>
    </nav>
</header>

<div class="container">
    <h2>Delivery Details</h2>
    <c:if test="${delivery == null}">
        <p>Delivery not found.</p>
    </c:if>
    <c:if test="${delivery != null}">
        <p><strong>ID:</strong> ${delivery.id}</p>
        <p><strong>Customer:</strong> ${delivery.customer.name}</p>
        <p><strong>Address:</strong> ${delivery.customer.address}</p>
        <p><strong>Dish:</strong> ${delivery.dish}</p>
        <p><strong>Order Time:</strong> ${delivery.orderTime}</p>
        <p><strong>Status:</strong> ${delivery.cancelled ? 'Cancelled' : 'Active'}</p>
        <c:if test="${!delivery.cancelled && LocalDateTime.now().isBefore(delivery.orderTime.plusMinutes(10))}">
            <form action="cancelDelivery" method="post">
                <input type="hidden" name="id" value="${delivery.id}">
                <button type="submit">Cancel Delivery</button>
            </form>
        </c:if>
    </c:if>
    <div style="text-align: center; margin-top: 20px;">
        <a href="${pageContext.request.contextPath}/jsp/createDelivery.jsp" class="button">Create New Delivery</a>
        <a href="${pageContext.request.contextPath}/jsp/adminDelivery.jsp" class="button">Admin Panel</a>
    </div>
</div>

<footer>
    © 2025 Food Delivery App. All rights reserved.
</footer>
</body>
</html>