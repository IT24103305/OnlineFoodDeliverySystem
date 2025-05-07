package servlets;

import user_manager.User;
import user_manager.UserManager;
import user_manager.ValidationService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private UserManager userManager;
    private ValidationService validationService;

    @Override
    public void init() throws ServletException {
        // Initialize the required services
        userManager = new UserManager();
        validationService = new ValidationService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input data
        String errorMessage = "";
        if (!validationService.isValidEmail(email)) {
            errorMessage = "Invalid email format.";
        } else if (!validationService.isValidPassword(password)) {
            errorMessage = "Password must be at least 8 characters and include uppercase, lowercase, digit, and special character.";
        }

        // If there's a validation error, send back to registration page
        if (!errorMessage.isEmpty()) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            // Create and register the user
            User newUser = new User(userId, name, email, password);
            userManager.registerUser(newUser);

            // Forward to login page with a success message
            request.setAttribute("successMessage", "Registration successful! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
