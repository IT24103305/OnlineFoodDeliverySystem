package servlets;

import user_manager.UserManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the userId from query parameters
        String userId = request.getParameter("userId");
        if (userId != null) {
            userManager.deleteUser(userId);
        }
        // Invalidate the session since the account is deleted
        HttpSession session = request.getSession();
        session.invalidate();

        // Redirect to the registration page or a goodbye page
        request.setAttribute("successMessage", "Account deleted successfully!");
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
