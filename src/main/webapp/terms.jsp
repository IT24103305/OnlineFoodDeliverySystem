<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Terms & Conditions - DelishExpress</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Background image for Terms & Conditions (save terms-bg.jpg into src/main/webapp/images/) -->
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: url('${pageContext.request.contextPath}/images/terms-bg.jpg') no-repeat center center fixed;
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
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        h3 {
            margin-top: 20px;
        }
        p, li {
            text-align: justify;
        }
        ul {
            margin-left: 20px;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Terms & Conditions</h1>
    <p>Welcome to DelishExpress Food Delivery. These Terms & Conditions outline the rules and regulations for the use of our website. By accessing and using our website, you accept these terms in full. If you disagree with any part of these terms, please do not use our website.</p>

    <h3>Intellectual Property Rights</h3>
    <p>All content on this website—including text, graphics, logos, images, and software—is the property of DelishExpress or its licensors and is protected by copyright and trademark laws.</p>

    <h3>Restrictions</h3>
    <p>You are strictly prohibited from publishing, reproducing, distributing, or commercializing any content from this site without our express written consent. Unauthorized use of any material found on this website is a violation of applicable copyright and trademark laws.</p>

    <h3>Your Content</h3>
    <p>By posting or submitting content on this website, you grant DelishExpress a non-exclusive, worldwide, irrevocable license to use, reproduce, modify, publish, translate, and distribute your content for purposes related to the website’s operation.</p>

    <h3>No Warranties</h3>
    <p>This website is provided “as is” without any representations or warranties, express or implied, including but not limited to the implied warranties of merchantability or fitness for a particular purpose. We do not warrant that the website will be error‑free or uninterrupted.</p>

    <h3>Limitation of Liability</h3>
    <p>In no event shall DelishExpress, its affiliates, or their respective officers, directors, employees, or agents be liable for any direct, indirect, incidental, special, or consequential damages arising out of your use of this website.</p>

    <h3>Changes to the Terms</h3>
    <p>We reserve the right to modify these Terms & Conditions at any time. Any changes will be posted on this page, and your continued use of the website after any modifications constitutes your acceptance of the revised terms.</p>

    <div class="text-center mt-3">
        <button onclick="location.href='${pageContext.request.contextPath}/index.jsp'" class="btn btn-info">Back to Home</button>
    </div>
</div>
</body>
</html>
