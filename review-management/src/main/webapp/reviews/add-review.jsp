<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Add New Review</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background-color: #f5f5f5;
    }
    .review-form {
      background: white;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      max-width: 500px;
      margin: 0 auto;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }
    input[type="text"],
    textarea,
    select {
      width: 100%;
      padding: 8px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
    }
    textarea {
      height: 100px;
      resize: vertical;
    }
    .char-count {
      font-size: 12px;
      color: #666;
      text-align: right;
    }
    .button-group {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
      margin-top: 20px;
    }
    button {
      padding: 8px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .submit-btn {
      background-color: #4CAF50;
      color: white;
    }
    .cancel-btn {
      background-color: #f44336;
      color: white;
    }
    .error {
      color: #f44336;
      margin-bottom: 15px;
    }
  </style>
</head>
<body>
<div class="review-form">
  <h2>Add New Review</h2>

  <% if (request.getAttribute("error") != null) { %>
  <div class="error"><%= request.getAttribute("error") %></div>
  <% } %>

  <form action="reviews/add" method="post">
    <div class="form-group">
      <label for="orderId">Order ID:</label>
      <input type="text" id="orderId" name="orderId" required>
    </div>

    <div class="form-group">
      <label for="rating">Rating:</label>
      <select id="rating" name="rating" required>
        <option value="1">1 - Poor</option>
        <option value="2">2 - Fair</option>
        <option value="3">3 - Good</option>
        <option value="4">4 - Very Good</option>
        <option value="5">5 - Excellent</option>
      </select>
    </div>

    <div class="form-group">
      <label for="comment">Comments:</label>
      <textarea id="comment" name="comment" maxlength="50" required></textarea>
      <div class="char-count"><span id="charCount">0</span>/50 characters</div>
    </div>

    <div class="button-group">
      <button type="button" class="cancel-btn" onclick="window.location.href='reviews'">Cancel</button>
      <button type="submit" class="submit-btn">Submit</button>
    </div>
  </form>
</div>

<script>
  // Character count for comments
  document.getElementById('comment').addEventListener('input', function() {
    const charCount = this.value.length;
    document.getElementById('charCount').textContent = charCount;
  });
</script>
</body>
</html>