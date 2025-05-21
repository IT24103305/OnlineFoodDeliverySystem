<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DelishExpress - My Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
            padding: 50px 0;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 { text-align: center; margin-bottom: 30px; }
        .btn-group a { margin-right: 10px; }
    </style>
</head>
<body>
<div class="container">
    <h1>My Account</h1>
    <c:choose>
        <!-- Only show account details if a user is in session -->
        <c:when test="${not empty sessionScope.user}">
            <p><strong>Username:</strong> ${sessionScope.user.username}</p>
            <p><strong>Email:</strong> ${sessionScope.user.email}</p>
            <div class="btn-group">
                <a href="${pageContext.request.contextPath}/updateaccount" class="btn btn-warning">Update Account</a>
                <a href="${pageContext.request.contextPath}/deleteaccount" class="btn btn-danger">Delete Account</a>
            </div>
        </c:when>
        <c:otherwise>
            <!-- If the user is not logged in, inform them -->
            <p>No user details found. Please <a href="${pageContext.request.contextPath}/login.jsp">sign in</a> first.</p>
        </c:otherwise>
    </c:choose>
    <div class="mt-3">
        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">Back to Home</a>
    </div>
</div>
</body>
</html>
