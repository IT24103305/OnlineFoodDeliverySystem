<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Food Delivery System</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color: #f0f2f5;">

<div class="container text-center mt-5">
    <h1 class="mb-4 text-success">Online Food Delivery System</h1>
    <p class="lead mb-4">Welcome! Choose an option below:</p>

    <div class="row justify-content-center">
        <div class="col-md-4 mb-3">
            <a href="review.jsp" class="btn btn-primary btn-lg btn-block">Submit a Review</a>
        </div>
        <div class="col-md-4 mb-3">
            <a href="ReviewServlet" class="btn btn-info btn-lg btn-block">View All Reviews</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
