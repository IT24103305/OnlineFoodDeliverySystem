package servlet;

import model.FoodItem;
import controller.FoodManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class DeleteFoodItem extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodId = request.getParameter("foodId");
        FoodItem item = FoodManager.getFoodById(foodId);
        request.setAttribute("foodItem", item);
        RequestDispatcher dispatcher = request.getRequestDispatcher("DeleteFoodItem.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodId = request.getParameter("foodId");
        FoodManager.deleteFoodItem(foodId);
        response.sendRedirect("ViewFood.jsp");
    }
}
