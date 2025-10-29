package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("userEmail");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pinCode = request.getParameter("pinCode");
        String phone = request.getParameter("phone");
        String productNames = request.getParameter("productName");
        String totalAmountStr = request.getParameter("totalAmount");

        double totalAmount = Double.parseDouble(totalAmountStr);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql")) {
                String sql = "INSERT INTO orders (user_email, address, city, state, pin_code, phone, product_name, total_amount) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, userEmail);
                    ps.setString(2, address);
                    ps.setString(3, city);
                    ps.setString(4, state);
                    ps.setString(5, pinCode);
                    ps.setString(6, phone);
                    ps.setString(7, productNames);
                    ps.setDouble(8, totalAmount);

                    ps.executeUpdate();
                }

                // Optionally, clear the cart
                try (PreparedStatement clearCart = conn.prepareStatement("DELETE FROM cart WHERE user_email = ?")) {
                    clearCart.setString(1, userEmail);
                    clearCart.executeUpdate();
                }
            }

            response.sendRedirect("category.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error processing order: " + e.getMessage());
        }
    }
}
