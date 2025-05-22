<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .error-container {
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
            padding: 20px;
        }
        .error-message {
            color: #f44336;
            padding: 20px;
            margin: 20px 0;
            border: 1px solid #f44336;
            border-radius: 4px;
            background-color: #ffebee;
        }
        .home-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .home-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h2>Oops! Something went wrong</h2>
        <div class="error-message">
            <%= exception != null ? exception.getMessage() : "An error occurred while processing your request." %>
        </div>
        <a href="${pageContext.request.contextPath}/review_form.jsp" class="home-link">Back to Review Form</a>
    </div>
</body>
</html> 