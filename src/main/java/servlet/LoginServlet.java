package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String role = request.getParameter("role");

        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("role", role); // this can be null if not selected


        if ("admin".equalsIgnoreCase(role)) {
            response.sendRedirect("admin_index.jsp");
        } else if ("customer".equalsIgnoreCase(role)) {
            response.sendRedirect("index.jsp");
        } else {
            // fallback if role is null or invalid
            response.sendRedirect("login.jsp");
        }

    }
}
