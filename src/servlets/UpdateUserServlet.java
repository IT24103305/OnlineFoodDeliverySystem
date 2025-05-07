package servlets;

import user_manager.UserManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {

    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the form
        String userId = request.getParameter("userId");
        String newEmail = request.getParameter("newEmail");
        String newPassword = request.getParameter("newPassword");

        // Call the update method from UserManager (which performs file rewriting)
        userManager.updateUser(userId, newEmail, newPassword);

        // (Optional) Refresh the session with new user details if stored in session
        // For simplicity, here we simply redirect the user to the dashboard.
        request.setAttribute("successMessage", "User updated successfully!");
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
