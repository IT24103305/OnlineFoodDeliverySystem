package servlets;

import user_manager.AuthenticationService;
import user_manager.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private AuthenticationService authenticationService;

    @Override
    public void init() throws ServletException {
        // Initialize the authentication service
        authenticationService = new AuthenticationService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve submitted credentials
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Authenticate the user
        User user = authenticationService.authenticate(email, password);
        if (user != null) {
            // Start a new session and store user details
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
