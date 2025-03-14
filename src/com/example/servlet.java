package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// Annotation to map the servlet to a URL pattern
@WebServlet("/user")
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle create and update operations
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            String userId = request.getParameter("userId");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");

            // Create User object
            User user = new User(userId, name, address, phoneNumber);

            // Save the user to a file or database (to be implemented later)
            response.getWriter().println("<h1>User Created Successfully: " + user.getName() + "</h1>");

        } else if ("update".equals(action)) {
            // Implement update logic here
            response.getWriter().println("<h1>Update feature is not implemented yet.</h1>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle read and delete operations
        String action = request.getParameter("action");

        if ("read".equals(action)) {
            String userId = request.getParameter("userId");
            // Logic to read user data (not yet implemented)
            response.getWriter().println("<h1>Read User Feature is not implemented yet.</h1>");

        } else if ("delete".equals(action)) {
            String userId = request.getParameter("userId");
            // Logic to delete user data (not yet implemented)
            response.getWriter().println("<h1>Delete User Feature is not implemented yet.</h1>");
        }
    }
}
