<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Submit Review</title></head>
<body>
<h2>Submit a Review</h2>
<form action="review" method="post">
  Username: <input type="text" name="username" required><br>
  Food Item: <input type="text" name="foodItem" required><br>
  Comment:<br>
  <textarea name="comment" rows="5" cols="30" required></textarea><br>
  <input type="submit" value="Submit Review">
</form>
<br>
<a href="review">View All Reviews</a>
</body>
</html>
