<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Add Review</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    form { max-width: 500px; margin: auto; }
    .form-group { margin-bottom: 15px; }
    label { display: block; margin-bottom: 5px; }
    input, textarea, select { width: 100%; padding: 8px; box-sizing: border-box; }
    button { padding: 10px 15px; background-color: #4CAF50; color: white; border: none; cursor: pointer; border-radius: 4px; }
    button:hover { background-color: #45a049; }
    .error { color: red; margin-bottom: 15px; }
    .back-link {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #3498db;
      color: white;
      text-decoration: none;
      border-radius: 4px;
    }
    .back-link:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>
<h1>Add Review</h1>

<% if (request.getAttribute("error") != null) { %>
<p class="error"><%= request.getAttribute("error") %></p>
<% } %>

<form action="${pageContext.request.contextPath}/reviews" method="post">
  <input type="hidden" name="action" value="add">

  <div class="form-group">
    <label for="userId">User ID:</label>
    <input type="text" id="userId" name="userId" required>
  </div>

  <div class="form-group">
    <label for="orderId">Order ID:</label>
    <input type="text" id="orderId" name="orderId" required>
  </div>

  <div class="form-group">
    <label for="foodItemId">Food Item ID:</label>
    <input type="text" id="foodItemId" name="foodItemId" required>
  </div>

  <div class="form-group">
    <label for="rating">Rating (1-5):</label>
    <select id="rating" name="rating" required>
      <option value="1">1 - Poor</option>
      <option value="2">2 - Fair</option>
      <option value="3">3 - Good</option>
      <option value="4">4 - Very Good</option>
      <option value="5">5 - Excellent</option>
    </select>
  </div>

  <div class="form-group">
    <label for="comment">Comment:</label>
    <textarea id="comment" name="comment" rows="4" required></textarea>
  </div>

  <button type="submit">Submit Review</button>
</form>

<a href="${pageContext.request.contextPath}/reviews?action=list" class="back-link">Back to Reviews</a>
</body>
</html>