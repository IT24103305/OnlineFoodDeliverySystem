<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1>Edit Review</h1>
    <form action="reviews/edit" method="post">
        <input type="hidden" name="reviewId" value="${review.reviewId}">
        <div class="mb-3">
            <label for="orderId" class="form-label">Order ID</label>
            <input type="number" class="form-control" id="orderId" name="orderId" value="${review.orderId}" required>
        </div>
        <div class="mb-3">
            <label for="userId" class="form-label">User ID</label>
            <input type="text" class="form-control" id="userId" name="userId" value="${review.userId}" required>
        </div>
        <div class="mb-3">
            <label for="rating" class="form-label">Rating (1-5)</label>
            <input type="number" class="form-control" id="rating" name="rating" value="${review.rating}" min="1" max="5" required>
        </div>
        <div class="mb-3">
            <label for="comment" class="form-label">Comment</label>
            <textarea class="form-control" id="comment" name="comment" rows="3">${review.comment}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="reviews" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>