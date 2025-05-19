<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/13/2025
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.FoodItem" %>
<%
    List<FoodItem> results = (List<FoodItem>) request.getAttribute("results");
    String keyword = (String) request.getAttribute("keyword");
%>

<html> <head><title>Search Food</title></head> <body> <h2>Search Food Items</h2> <form action="SearchFood" method="get"> <input type="text" name="keyword" value="<%= keyword != null ? keyword : "" %>" placeholder="Enter food name or category" required /> <input type="submit" value="Search" /> </form>
<% if (results != null && !results.isEmpty()) { %>
<table border="1">
    <tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th></tr>
    <% for (FoodItem item : results) { %>
    <tr>
        <td><%= item.getFoodId() %></td>
        <td><%= item.getName() %></td>
        <td><%= item.getCategory() %></td>
        <td><%= item.getPrice() %></td>
    </tr>
    <% } %>
</table>
<% } else if (keyword != null) { %>
<p>No food items found matching "<%= keyword %>"</p>
<% } %>

</body> </html>