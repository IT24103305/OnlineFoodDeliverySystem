<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DelishExpress - Update Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
            padding-top: 50px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 { text-align: center; margin-bottom: 30px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Update Account</h1>
    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <form action="updateAccountProcess" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" name="username" id="username" value="${sessionScope.user.username}" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" name="email" id="email" value="${sessionScope.user.email}" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">New Password (leave blank if unchanged):</label>
                    <input type="password" class="form-control" name="password" id="password">
                </div>
                <button type="submit" class="btn btn-success w-100">Update Account</button>
            </form>
        </c:when>
        <c:otherwise>
            <p>You must be logged in to update account details. Please <a href="${pageContext.request.contextPath}/login.jsp">sign in</a>.</p>
        </c:otherwise>
    </c:choose>
    <div class="mt-3 text-center">
        <a href="${pageContext.request.contextPath}/myaccount" class="btn btn-secondary">Cancel</a>
    </div>
</div>
</body>
</html>
