<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SunBite - Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<header>
    <h1><i class="fas fa-utensils"></i> SunBite</h1>
    <div class="nav-buttons">
        <button>Menu</button>
        <button>Search</button>
        <button>Cart</button>
    </div>
</header>
<div class="container">
    <h2>Admin Panel - All Deliveries</h2>
    <table class="delivery-table">
        <tr>
            <th class="col-delivery-id">Delivery ID</th>
            <th class="col-customer">Customer</th>
            <th class="col-contact">Contact Number</th>
            <th class="col-address">Address</th>
            <th class="col-order-id">Order ID</th>
            <th class="col-order-time">Order Time</th>
            <th class="col-status">Status</th>
        </tr>
        <c:forEach var="delivery" items="${deliveries}">
            <tr>
                <td class="col-delivery-id">${delivery.delivery_ID}</td>
                <td class="col-customer">${delivery.customer.name}</td>
                <td class="col-contact">${delivery.customer.contactNumber}</td>
                <td class="col-address">${delivery.address}</td>
                <td class="col-order-id">${delivery.order_ID}</td>
                <td class="col-order-time">${delivery.orderTime}</td>
                <td class="col-status">${delivery.status}</td>
            </tr>
        </c:forEach>
    </table>
    <div class="footer-links">
        <a href="${pageContext.request.contextPath}/">Back to SunBite Home</a>
    </div>
</div>
</body>
</html>