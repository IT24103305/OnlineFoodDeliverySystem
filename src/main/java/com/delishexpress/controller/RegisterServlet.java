package com.delishexpress.controller;

import com.delishexpress.manager.UserManager;
import com.delishexpress.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/registerProcess")
public class RegisterServlet extends HttpServlet {
    private UserManager userManager;
    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
            return;
        }
        User newUser = new User(username, email, password);
        try {
            boolean registered = userManager.registerUser(newUser);
            if (registered) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            } else {
                request.setAttribute("error", "Registration failed. Ensure your email is valid and the username/email is not already used.");
                request.getRequestDispatcher("/registration.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            throw new ServletException("Error during registration", ex);
        }
    }
}
