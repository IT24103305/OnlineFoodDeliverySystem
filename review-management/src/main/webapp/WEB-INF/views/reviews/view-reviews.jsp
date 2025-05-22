<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Food Delivery Reviews</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
    th { background-color: #f2f2f2; }
    tr:nth-child(even) { background-color: #f9f9f9; }
    .rating { color: #FFD700; font-weight: bold; }
    .actions a { margin-right: 10px; text-decoration: none; }
    .add-review { margin: 20px 0; }
    .add-review a {
      display: inline-block;
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      text-decoration: none;
      border-radius: 4px;
    }
    .add-review a:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<h1>Food Delivery Reviews</h1>

<div class="add-review">
  <a href="${pageContext.request.contextPath}/reviews?action=new">Add New Review</a>
</div>

<c:if test="${not empty reviews}">
  <table>
    <thead>
    <tr>
      <th>User ID</th>
      <th>Order ID</th>
      <th>Food Item ID</th>
      <th>Rating</th>
      <th>Comment</th>
      <th>Date</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="review" items="${reviews}">
      <tr>
        <td>${review.userId}</td>
        <td>${review.orderId}</td>
        <td>${review.foodItemId}</td>
        <td class="rating">
          <c:forEach begin="1" end="${review.rating}">★</c:forEach>
          <c:forEach begin="${review.rating + 1}" end="5">☆</c:forEach>
        </td>
        <td>${review.comment}</td>
        <td>${review.timestamp}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</c:if>

<c:if test="${empty reviews}">
  <p>No reviews found.</p>
</c:if>
</body>
</html>