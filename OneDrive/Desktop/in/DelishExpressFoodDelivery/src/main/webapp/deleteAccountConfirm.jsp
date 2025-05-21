<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Confirm Account Deletion - DelishExpress</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            padding-top: 100px;
            text-align: center;
        }
        .container {
            max-width: 400px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Are you sure you want to delete your account?</h2>
    <br>
    <a href="${pageContext.request.contextPath}/deleteAccountProcess" class="btn btn-danger">Yes, Delete My Account</a>
    <a href="${pageContext.request.contextPath}/myaccount.jsp" class="btn btn-secondary">No, Go Back</a>
</div>
</body>
</html>
