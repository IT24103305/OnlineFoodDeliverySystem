package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.FoodItem;
import controller.FoodManager;

import java.io.IOException;

@WebServlet("/EditFoodDetails")
public class EditFoodDetails extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Read updated form data
        String foodId = request.getParameter("foodId");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));

        // 2. Create updated FoodItem
        FoodItem updatedItem = new FoodItem(foodId, name, description, category, price);

        // 3. Update item in file
        FoodManager.updateFoodItem(updatedItem);

        // 4. Redirect back to ViewFood
        response.sendRedirect("ViewFood");
    }
}