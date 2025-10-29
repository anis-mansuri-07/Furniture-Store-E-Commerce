import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RemoveCartServlet")
public class RemoveCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String cartId = request.getParameter("cart_id");
        if (cartId == null || cartId.isEmpty()) {
            response.sendRedirect("cart.jsp?error=MissingCartId");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");

            String sql = "DELETE FROM cart WHERE cart_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cartId);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("cart.jsp?removed=true");
            } else {
                response.sendRedirect("cart.jsp?removed=false");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp?error=Exception");
        } finally {
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doPost(request, response); // allow GET as well
    }
}
