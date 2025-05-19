package servlet;

import model.FoodItem;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class SubmitCart extends HttpServlet {
    private static final String FILE_PATH = "C:\\FoodDeliveryData/orders.txt"; // update path

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");

        HttpSession session = request.getSession();
        Queue<FoodItem> cart = (Queue<FoodItem>) session.getAttribute("cartQueue");

        if (cart != null && !cart.isEmpty()) {
            Map<String, Integer> itemCounts = new HashMap<>();
            Map<String, FoodItem> itemMap = new HashMap<>();

            for (FoodItem item : cart) {
                itemCounts.put(item.getFoodId(), itemCounts.getOrDefault(item.getFoodId(), 0) + 1);
                itemMap.put(item.getFoodId(), item);
            }

            try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
                for (String foodId : itemCounts.keySet()) {
                    FoodItem item = itemMap.get(foodId);
                    int qty = itemCounts.get(foodId);
                    String line = userId + " | " + item.getCategory() + " | " + item.getName() + " | " + item.getFoodId()
                            + " | " + qty + " | " + (item.getPrice() * qty);
                    bw.write(line);
                    bw.newLine();
                }
            }

            cart.clear(); // empty the queue after placing order
            session.setAttribute("cartQueue", cart);
        }

        response.sendRedirect("orderSuccess.jsp");
    }
}
