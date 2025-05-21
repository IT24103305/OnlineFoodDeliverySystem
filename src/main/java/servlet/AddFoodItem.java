package servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import model.*;

@WebServlet("/AddFoodItem")
public class AddFoodItem extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String foodId = request.getParameter("foodId");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));

        FoodItem item = new Meal(foodId, name, description, category, price);
        FoodManager.addFoodItem(item);

        response.sendRedirect("ViewFood.jsp");
    }
}