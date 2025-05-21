package com.delishexpress.controller;

import com.delishexpress.manager.UserManager;
import com.delishexpress.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteAccountProcess")
public class DeleteAccountServlet extends HttpServlet {
    private UserManager userManager;
    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        User user = (User) session.getAttribute("user");
        try {
            boolean deleted = userManager.deleteUser(user.getUsername());
            if (deleted) {
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/goodbye_delete.jsp");
            } else {
                request.setAttribute("error", "There was a problem deleting your account.");
                request.getRequestDispatcher("/myaccount.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            throw new ServletException("Error while deleting account", ex);
        }
    }
}
