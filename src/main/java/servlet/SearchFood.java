package servlet;

import controller.FoodManager;
import model.FoodItem;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/SearchFood")
public class SearchFood extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<FoodItem> results = FoodManager.searchFoodItems(keyword != null ? keyword : "");
        request.setAttribute("results", results);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("WEB-INF/searchFood.jsp").forward(request, response);
    }
}