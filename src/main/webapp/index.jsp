<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SunBite - Food Delivery App</title>
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
    <p class="welcome-message">Explore our menu and enjoy delicious meals delivered to your door.</p>
    <a href="${pageContext.request.contextPath}/jsp/createDelivery.jsp" class="order-now-btn">Delivery Now</a>
    <br>
    <a href="${pageContext.request.contextPath}/jsp/adminDelivery.jsp">Admin Panel</a>
</div>
</body>
</html>j