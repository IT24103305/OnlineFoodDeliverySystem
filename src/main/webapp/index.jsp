<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DelishExpress Food Delivery</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f8f9fa; }
        .navbar-brand { font-weight: bold; font-size: 1.8rem; }
        .hero {
            background: url('${pageContext.request.contextPath}/images/hero.jpg') no-repeat center center;
            background-size: cover; height: 70vh; position: relative; color: #fff;
        }
        .hero-overlay { position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.5); }
        .hero-content { position: relative; z-index: 2; text-align: center; top: 50%; transform: translateY(-50%); }
        .hero-content h1 { font-size: 3rem; margin-bottom: 20px; }
        .hero-content p { font-size: 1.2rem; }
        .footer { background: #343a40; color: #fff; padding: 30px 15px; }
        .footer a { color: #ffc107; text-decoration: none; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">DelishExpress Food Delivery</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/menu.jsp">Menu</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/aboutUs.jsp">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/policy.jsp">Policy</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myaccount.jsp">My Account</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logoutProcess">Logout</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login.jsp">Sign In</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/registration.jsp">Register</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<section class="hero">
    <div class="hero-overlay"></div>
    <div class="hero-content container">
        <h1>Welcome to DelishExpress</h1>
        <p>Your fastest, most delicious food delivery experience.</p>
    </div>
</section>

<section class="container my-5 text-center">
    <h2>Experience the Best in Food Delivery</h2>
    <p>Delicious meals delivered right to your door.</p>
</section>

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>Contact Us</h5>
                <p>Phone: +94 11 1234567</p>
                <p>Email: info@delishexpress.lk</p>
                <p>Address: 123, Food Street, Colombo 07, Sri Lanka</p>
            </div>
            <div class="col-md-4">
                <h5>Find Us On</h5>
                <p>
                    <a href="#">Facebook</a><br>
                    <a href="#">Instagram</a><br>
                    <a href="#">Twitter</a>
                </p>
            </div>
            <div class="col-md-4">
                <h5>About &amp; Policies</h5>
                <p><a href="${pageContext.request.contextPath}/aboutUs.jsp">About Us</a></p>
                <p><a href="${pageContext.request.contextPath}/policy.jsp">Policy</a></p>
                <p><a href="${pageContext.request.contextPath}/terms.jsp">Terms &amp; Conditions</a></p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
