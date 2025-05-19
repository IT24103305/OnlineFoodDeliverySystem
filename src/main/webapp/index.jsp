<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"customer".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>SunBite | Home</title>
    <link rel="stylesheet" href="home.css">
</head>
<body> <div class="overlay">
    <header>
        <div class="logo"> SunBite</div> <nav class="nav-links">
        <a href="menu.jsp">Menu</a>
        <a href="searchFood.jsp">Search</a>
        <a href="viewCart.jsp">Cart</a>
    </nav>
    </header>
    <section class="hero">
        <h1>Welcome, <%= username %> </h1>
        <p>Explore our menu and enjoy delicious meals delivered to your door.</p>
        <a class="hero-btn" href="menu.jsp">Order Now</a>
    </section>
</div>
</body>
</html>