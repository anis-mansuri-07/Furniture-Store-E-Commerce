package servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/products.jsp");
            return;
        }
        
        try {
            int productId = Integer.parseInt(idParam);
            
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
            
            // Execute delete query
            String sql = "DELETE FROM products WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productId);
            int result = pstmt.executeUpdate();
            conn.close();
            
            // Optionally, you could add file deletion logic if you need to remove the image file.
            
            // Redirect back to the products page
            response.sendRedirect(request.getContextPath() + "/admin/products.jsp");
            
        } catch (Exception e) {
            // In case of error, print the error message (could be enhanced to show a custom error page)
            e.printStackTrace();
            response.getWriter().println("Error deleting product: " + e.getMessage());
        }
    }
}
