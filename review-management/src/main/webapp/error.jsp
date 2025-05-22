<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Error Page</title>
  <style>
    body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
    .error-container { max-width: 600px; margin: 0 auto; }
    h1 { color: #d9534f; }
    .btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: #337ab7;
      color: white;
      text-decoration: none;
      border-radius: 4px;
      margin-top: 20px;
    }
  </style>
</head>
<body>
<div class="error-container">
  <h1>${pageContext.errorData.statusCode} Error</h1>
  <p>${pageContext.exception.message}</p>
  <a href="${pageContext.request.contextPath}/reviews" class="btn">Back to Reviews</a>
</div>
</body>
</html>