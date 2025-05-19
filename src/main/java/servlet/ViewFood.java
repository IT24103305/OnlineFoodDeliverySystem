package servlet;

import model.FoodItem;
import controller.FoodManager;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.List;

@WebServlet("/ViewFood")
public class ViewFood extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<FoodItem> items = FoodManager.getAllFoodItems();
        request.setAttribute("foodList", items);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewFood.jsp");
        dispatcher.forward(request, response);
    }
}
