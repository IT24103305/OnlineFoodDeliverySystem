<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DelishExpress - About Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            /* Background image; ensure the file 'about-bg.jpg' is in src/main/webapp/images/ */
            background: url('${pageContext.request.contextPath}/images/about-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }
        .content-wrapper {
            background: rgba(255, 255, 255, 0.85);
            padding: 40px;
            max-width: 800px;
            margin: 80px auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        h1 {
            margin-bottom: 20px;
            color: #333;
        }
        p {
            font-size: 1.2rem;
            line-height: 1.6;
            color: #444;
        }
    </style>
</head>
<body>
<div class="content-wrapper">
    <h1>About DelishExpress</h1>
    <p>Welcome to DelishExpress Food Delivery! We strive to provide you with the fastest and most delicious food delivery service available. Our commitment to quality and customer satisfaction is what sets us apart.</p>
    <p>We partner with a range of local restaurants to offer a diverse menu so you can enjoy your favourite dishes delivered right to your door. Thank you for choosing us!</p>
    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Back to Home</a>
</div>
</body>
</html>
