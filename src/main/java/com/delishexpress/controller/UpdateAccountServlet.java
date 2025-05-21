package com.delishexpress.controller;

import com.delishexpress.manager.UserManager;
import com.delishexpress.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateAccount")
public class UpdateAccountServlet extends HttpServlet {
    private UserManager userManager;
    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = (User) session.getAttribute("user");
        user.setEmail(email);
        user.setPassword(password);
        try {
            boolean updated = userManager.updateUser(user);
            if (updated) {
                session.setAttribute("user", user);
                request.setAttribute("message", "Your account has been updated successfully!");
                request.getRequestDispatcher("/updateAccountSuccess.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Update failed. Please try again.");
                request.getRequestDispatcher("/editAccount.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Error updating account", e);
        }
    }
}
