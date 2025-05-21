<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DelishExpress - Delete Account</title>
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
            text-align: center;
        }
        h1 {
            margin-bottom: 30px;
            color: #dc3545;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Delete Account</h1>
    <p>Are you sure you want to delete your account? This action cannot be undone.</p>
    <form action="deleteAccount" method="post">
        <button type="submit" class="btn btn-danger">Yes, Delete My Account</button>
        <a href="${pageContext.request.contextPath}/myaccount.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
