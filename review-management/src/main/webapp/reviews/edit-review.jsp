<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit Review</title>
  <style>
    /* Same styles as add-review.jsp */
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
  <h2>Edit Review</h2>

  <% if (request.getAttribute("error") != null) { %>
  <div class="error"><%= request.getAttribute("error") %></div>
  <% } %>

  <form action="reviews/edit" method="post">
    <input type="hidden" name="id" value="${review.id}">

    <div class="form-group">
      <label for="orderId">Order ID:</label>
      <input type="text" id="orderId" name="orderId" value="${review.orderId}" required>
    </div>

    <div class="form-group">
      <label for="rating">Rating:</label>
      <select id="rating" name="rating" required>
        <option value="1" ${review.rating == 1 ? 'selected' : ''}>1 - Poor</option>
        <option value="2" ${review.rating == 2 ? 'selected' : ''}>2 - Fair</option>
        <option value="3" ${review.rating == 3 ? 'selected' : ''}>3 - Good</option>
        <option value="4" ${review.rating == 4 ? 'selected' : ''}>4 - Very Good</option>
        <option value="5" ${review.rating == 5 ? 'selected' : ''}>5 - Excellent</option>
      </select>
    </div>

    <div class="form-group">
      <label for="comment">Comments:</label>
      <textarea id="comment" name="comment" maxlength="50" required>${review.comment}</textarea>
      <div class="char-count"><span id="charCount">${review.comment.length()}</span>/50 characters</div>
    </div>

    <div class="button-group">
      <button type="button" class="cancel-btn" onclick="window.location.href='reviews'">Cancel</button>
      <button type="submit" class="submit-btn">Update</button>
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