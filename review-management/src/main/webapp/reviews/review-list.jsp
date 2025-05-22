<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Review Management</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background-color: #f5f5f5;
    }
    .container {
      background: white;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    h1 {
      color: #333;
    }
    .review-list {
      margin-top: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f2f2f2;
    }
    .rating {
      color: gold;
    }
    .action-btn {
      padding: 5px 10px;
      text-decoration: none;
      border-radius: 3px;
      margin-right: 5px;
    }
    .edit-btn {
      background-color: #4CAF50;
      color: white;
    }
    .add-btn {
      background-color: #2196F3;
      color: white;
      padding: 8px 15px;
      text-decoration: none;
      border-radius: 4px;
      display: inline-block;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Review Management</h1>

  <a href="reviews/add" class="add-btn">Add New Review</a>

  <div class="review-list">
    <table>
      <thead>
      <tr>
        <th>Order ID</th>
        <th>Rating</th>
        <th>Comments</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="review" items="${reviews}">
        <tr>
          <td>${review.orderId}</td>
          <td class="rating">
            <c:forEach begin="1" end="${review.rating}">★</c:forEach>
            <c:forEach begin="${review.rating + 1}" end="5">☆</c:forEach>
          </td>
          <td>${review.comment}</td>
          <td>
            <a href="reviews/edit?id=${review.id}" class="action-btn edit-btn">Edit</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>