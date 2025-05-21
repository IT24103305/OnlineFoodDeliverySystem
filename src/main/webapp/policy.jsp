<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Policy - DelishExpress</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Using the policy background image -->
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: url('${pageContext.request.contextPath}/images/policy-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            padding-top: 50px;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: rgba(255,255,255,0.95);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
        h1 { text-align: center; margin-bottom: 20px; }
        p { text-align: justify; }
        ul { margin-left: 20px; }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Policy</h1>
    <p>Welcome to DelishExpress Food Delivery. We are committed to providing you with an outstanding online food ordering experience while protecting your privacy and maintaining high quality standards.</p>

    <h3>Privacy Policy</h3>
    <p>Your privacy is very important to us. We will never sell or share your personal information (such as your name, email address, or phone number) without your permission. All personal data is securely stored and used solely for enhancing your ordering experience and customer support.</p>

    <h3>User Responsibilities</h3>
    <p>For the best experience, please ensure that all information you provide is up-to-date and accurate. You are responsible for maintaining the confidentiality of your account credentials. If you suspect any unauthorized use of your account, please contact us immediately.</p>

    <h3>Ordering, Shipping, and Returns</h3>
    <p>DelishExpress is dedicated to delivering your food orders quickly and efficiently. In the event of any delays or issues with your order, please reach out to our support team. Our returns or refund policy is clearly outlined on our website; please review these details before confirming your order.</p>

    <h3>Changes to Policy</h3>
    <p>We reserve the right to update or change our policy at any time, and any changes will be posted on this page. We recommend reviewing our policy periodically to stay informed about how we are protecting your information.</p>

    <div class="text-center mt-3">
        <button onclick="location.href='${pageContext.request.contextPath}/index.jsp'" class="btn btn-info">Back to Home</button>
    </div>
</div>
</body>
</html>
