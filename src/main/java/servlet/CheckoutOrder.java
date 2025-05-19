package servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import java.io.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/CheckoutOrder")
public class CheckoutOrder extends HttpServlet {
    private static final String ORDER_FILE = "C:/FoodDeliveryData/orders.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        String username = (String) session.getAttribute("username");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("viewCart.jsp");
            return;
        }

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(ORDER_FILE, true))) {
            String orderId = UUID.randomUUID().toString();
            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

            bw.write("OrderID: " + orderId + " | User: " + username + " | Time: " + timestamp);
            bw.newLine();

            for (Map<String, Object> item : cart) {
                bw.write(item.get("foodId") + " | " + item.get("name") + " | Qty: " + item.get("quantity") + " | Price: " + item.get("price"));
                bw.newLine();
            }

            bw.write("------------------------------------------------------");
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Clear cart and redirect
        session.removeAttribute("cart");
        response.sendRedirect("orderSuccess.jsp");
    }
}