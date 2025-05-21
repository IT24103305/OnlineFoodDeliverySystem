package com.delishexpress.controller;

import com.delishexpress.manager.Authentication;
import com.delishexpress.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/loginProcess")
public class LoginServlet extends HttpServlet {
    private Authentication authentication;

    @Override
    public void init() throws ServletException {
        authentication = new Authentication();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the login form.
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            User user = authentication.authenticate(username, password);
            if (user != null) {
                // If authentication is successful, save the user in session.
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                // Forward to loginSuccess.jsp to display a professional welcome message.
                request.getRequestDispatcher("/loginSuccess.jsp").forward(request, response);
            } else {
                // If authentication fails, show a styled error message and remain on login.jsp.
                request.setAttribute("error", "Invalid username or password. Please check your credentials.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            throw new ServletException("Error during login", ex);
        }
    }
}
