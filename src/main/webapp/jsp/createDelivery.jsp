<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SunBite - Create Delivery</title>
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
    <h2>Create Your Delivery</h2>
    <c:if test="${not empty error}">
        <p class="error-message">${error}</p>
    </c:if>
    <form action="${pageContext.request.contextPath}/createDelivery" method="post" class="delivery-form">
        <div class="form-group">
            <label for="name">Customer Name:</label>
            <input type="text" id="name" name="name" required placeholder="Enter customer name">
        </div>
        <div class="form-group">
            <label for="contactNumber">Contact Number:</label>
            <input type="text" id="contactNumber" name="contactNumber" required placeholder="e.g., +1234567890">
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required placeholder="Enter delivery address">
        </div>
        <button type="submit" class="submit-btn">Create Delivery</button>
    </form>
    <div class="footer-links">
        <a href="${pageContext.request.contextPath}/">Back to SunBite Home</a>
    </div>
</div>
</body>
</html>