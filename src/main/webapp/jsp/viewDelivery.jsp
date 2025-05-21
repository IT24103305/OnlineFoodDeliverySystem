<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SunBite - View Delivery</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
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
    <h2>Delivery Details</h2>
    <c:if test="${not empty error}">
        <p style="color: #FF4444; font-weight: bold;">${error}</p>
    </c:if>
    <c:if test="${delivery == null}">
        <p>Delivery not found.</p>
    </c:if>
    <c:if test="${delivery != null}">
        <p>Delivery ID: ${delivery.delivery_ID}</p>
        <p>Customer: ${delivery.customer.name}</p>
        <p>Contact Number: ${delivery.customer.contactNumber}</p>
        <p>Address: ${delivery.address}</p>
        <p>Order ID: ${delivery.order_ID}</p>
        <p>Order Time: ${delivery.orderTime}</p>
        <p>Status: ${delivery.status}</p>
        <c:if test="${canCancel}">
            <form action="cancelDelivery" method="post">
                <input type="hidden" name="delivery_ID" value="${delivery.delivery_ID}">
                <button type="submit" class="submit-btn">Cancel Delivery</button>
            </form>
        </c:if>
        <c:if test="${isAfterCutoff && delivery.status == 'Active'}">
            <p style="color: #FF4444;">Cancellation is no longer available (more than 10 minutes have passed).</p>
        </c:if>
    </c:if>
    <div class="footer-links">
        <a href="${pageContext.request.contextPath}/jsp/adminDelivery.jsp" class="order-now-btn">Click Here to Pay</a>
        <a href="${pageContext.request.contextPath}/" class="order-now-btn">Back to SunBite Home</a>
    </div>
</div>
</body>
</html>