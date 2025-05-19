<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/13/2025
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="controller.FoodManager" %>

<%
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    String foodId = request.getParameter("foodId");
    if (foodId != null) {
        FoodManager.deleteFoodItem(foodId); // you must implement this
        response.sendRedirect("ViewFood");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Food Item</title>
</head>
<body>
     <p>No food ID provided to delete.</p>
</body>
</html>