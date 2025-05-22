<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.fooddelivery.review.Review" %>
<!DOCTYPE html>
<html>
<head>
    <title>Food Delivery Reviews</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; text-align: left; border: 1px solid #ddd; }
        th { background-color: #0f164b; }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }
        .delete-button { background-color: #f44336; }
        .button:hover { opacity: 0.8; }
    </style>
</head>
<body>
    <div class="container">
        <h2>All Reviews</h2>
        <%
            List<Review> reviews = (List<Review>) request.getAttribute("reviews");
            if (reviews != null && !reviews.isEmpty()) {
        %>
        <table>
            <tr>
                <th>User</th>
                <th>Item</th>
                <th>Review</th>
                <th>Actions</th>
            </tr>
            <% for (Review r : reviews) { %>
            <tr>
                <td><%= r.getUserName() %></td>
                <td><%= r.getFoodItem() %></td>
                <td><%= r.getReviewText() %></td>
                <td>
                    <form action="review" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="user" value="<%= r.getUserName() %>"/>
                        <input type="submit" value="Delete" class="button delete-button"/>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        <p>No reviews found.</p>
        <% } %>
        
        <p style="margin-top: 20px;">
            <a href="review_form.jsp" class="button">Add New Review</a>
        </p>
    </div>
</body>
</html>
