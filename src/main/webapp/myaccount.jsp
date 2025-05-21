<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Account - DelishExpress</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: url('${pageContext.request.contextPath}/images/account-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            padding-top: 50px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: rgba(255,255,255,0.95);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>My Account</h1>
    <c:if test="${not empty sessionScope.user}">
        <p><strong>Username:</strong> ${sessionScope.user.username}</p>
        <p><strong>Email:</strong> ${sessionScope.user.email}</p>
        <div class="mt-3">
            <a href="${pageContext.request.contextPath}/editAccount.jsp" class="btn btn-primary">Edit Account</a>
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">
                Delete Account
            </button>
            <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#logoutConfirmModal">
                Logout
            </button>
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-info">Back to Home</a>
        </div>
    </c:if>
    <c:if test="${empty sessionScope.user}">
        <p>You are not logged in. Please <a href="${pageContext.request.contextPath}/login.jsp">Sign In</a>.</p>
    </c:if>
</div>

<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutConfirmModal" tabindex="-1" aria-labelledby="logoutConfirmLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutConfirmLabel">Confirm Logout</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to log out?
            </div>
            <div class="modal-footer">
                <a href="${pageContext.request.contextPath}/logoutProcess" class="btn btn-danger">Yes, Log Out</a>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No, Stay Logged In</button>
            </div>
        </div>
    </div>
</div>

<!-- Delete Account Confirmation Modal -->
<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteConfirmLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteConfirmLabel">Confirm Account Deletion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete your account? This action cannot be undone.
            </div>
            <div class="modal-footer">
                <a href="${pageContext.request.contextPath}/deleteAccountProcess" class="btn btn-danger">Yes, Delete My Account</a>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No, Cancel</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
