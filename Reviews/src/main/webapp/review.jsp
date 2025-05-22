<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Review</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-container { max-width: 600px; margin: 0 auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover { background-color: #45a049; }
        .error { 
            color: #f44336;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #f44336;
            border-radius: 4px;
            background-color: #ffebee;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Submit a Review</h2>
        
        <% if (request.getAttribute("error") != null) { %>
        <div class="error">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="review" method="post">
        <input type="hidden" name="action" value="add"/>

            <div class="form-group">
                <label for="user">Your Name:</label>
                <input type="text" id="user" name="user" required/>
            </div>

            <div class="form-group">
                <label for="item">Food Item:</label>
                <input type="text" id="item" name="item" required/>
            </div>

            <div class="form-group">
                <label for="review">Your Review:</label>
                <textarea id="review" name="review" rows="4" required></textarea>
            </div>

            <button type="submit">Submit Review</button>
        </form>

        <p style="margin-top: 20px;">
            <a href="review" style="color: #4CAF50; text-decoration: none;">View All Reviews</a>
        </p>
    </div>
</body>
</html>
