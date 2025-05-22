<%@ page import="com.example.review.Review" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>All Reviews</title></head>
<body>
<h2>All Reviews</h2>
<%
  List<Review> reviews = (List<Review>) request.getAttribute("reviews");
  if (reviews != null && !reviews.isEmpty()) {
    for (Review r : reviews) {
%>
<p><strong><%= r.getUsername() %></strong> reviewed <strong><%= r.getFoodItem() %></strong>:<br>
  "<%= r.getComment() %>"</p>
<hr>
<%
  }
} else {
%>
<p>No reviews available.</p>
<%
  }
%>
<br><a href="review.jsp">Back to Submit Review</a>
</body>
</html>
