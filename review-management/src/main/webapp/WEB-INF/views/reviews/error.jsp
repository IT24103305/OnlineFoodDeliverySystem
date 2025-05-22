<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Review System Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            text-align: center;
            background-color: #f5f5f5;
        }
        .error-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .error-code {
            font-size: 48px;
            color: #e74c3c;
            margin: 20px 0;
        }
        .error-message {
            color: #666;
            margin: 20px 0;
            padding: 15px;
            background-color: #fdf0ef;
            border-radius: 4px;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .back-link:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Review System Error</h1>
        
        <div class="error-code">
            <%= response.getStatus() %>
        </div>
        
        <div class="error-message">
            <% if (request.getAttribute("error") != null) { %>
                <%= request.getAttribute("error") %>
            <% } else if (response.getStatus() == 404) { %>
                The page you're looking for could not be found.
            <% } else { %>
                An unexpected error occurred while processing your request.
            <% } %>
        </div>
        
        <a href="${pageContext.request.contextPath}/reviews" class="back-link">Back to Reviews</a>
    </div>
</body>
</html> 