import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cartIdParam = request.getParameter("cart_id");
        String quantityParam = request.getParameter("quantity");

        if (cartIdParam == null || quantityParam == null) {
            response.sendRedirect("cart.jsp?error=missing_parameters");
            return;
        }

        int cartId = Integer.parseInt(cartIdParam);
        int quantity = Integer.parseInt(quantityParam);

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");

            String updateSQL = "UPDATE cart SET quantity = ? WHERE cart_id = ?";
            stmt = conn.prepareStatement(updateSQL);
            stmt.setInt(1, quantity);
            stmt.setInt(2, cartId);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }

        response.sendRedirect("cart.jsp");
    }
}
