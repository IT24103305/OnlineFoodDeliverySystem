<%@ page language="java" %>
<%
    String user = request.getParameter("user");
%>
<form action="ReviewServlet" method="post">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="user" value="<%= user %>"/>
    New Review for <%= user %>: <br/>
    <textarea name="review"></textarea><br/>
    <input type="submit" value="Update Review"/>
</form>
