package servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.util.*;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String foodId = request.getParameter("foodId");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();

// Cart is a list of CartItem maps
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

// Add new item
        Map<String, Object> item = new HashMap<>();
        item.put("foodId", foodId);
        item.put("name", name);
        item.put("price", price);
        item.put("quantity", quantity);
        cart.add(item);

        session.setAttribute("cart", cart);
        response.sendRedirect("viewCart.jsp");
    }
}