package servlet;

import model.FoodItem;
import controller.FoodManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AddFoodItem")
public class AddFoodItem extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodId = request.getParameter("foodId");
        String name = request.getParameter("name");
        String discription = request.getParameter("discription");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));

        FoodItem item = new FoodItem(foodId,name,discription,category,price);
        FoodManager.addFoodItem(item);

        response.sendRedirect("ViewFood.jsp");  // Or a success page
    }
}
