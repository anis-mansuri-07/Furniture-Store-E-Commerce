package servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

@WebServlet("/admin/updateProduct")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 30
)
public class UpdateProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            // Get form data
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String description = request.getParameter("description");
            
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
            
            // Handle image upload if new image is provided
            Part filePart = request.getPart("image");
            String imageUrl = null;
            
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = System.currentTimeMillis() + "_" + getSubmittedFileName(filePart);
                String uploadPath = request.getServletContext().getRealPath("/admin/images/products");
                
                // Create directory if it doesn't exist
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                
                // Save the file
                filePart.write(uploadPath + File.separator + fileName);
                imageUrl = "images/products/" + fileName;
                
                // Update product with new image
                String sql = "UPDATE products SET name=?, category=?, price=?, stock=?, description=?, image_url=? WHERE id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, productName);
                pstmt.setString(2, category);
                pstmt.setDouble(3, price);
                pstmt.setInt(4, stock);
                pstmt.setString(5, description);
                pstmt.setString(6, imageUrl);
                pstmt.setInt(7, productId);
                
                int result = pstmt.executeUpdate();
                
                if (result > 0) {
                    // Delete old image file
                    String oldImageSql = "SELECT image_url FROM products WHERE id=?";
                    PreparedStatement oldImageStmt = conn.prepareStatement(oldImageSql);
                    oldImageStmt.setInt(1, productId);
                    ResultSet rs = oldImageStmt.executeQuery();
                    
                    if (rs.next()) {
                        String oldImagePath = request.getServletContext().getRealPath("/admin/" + rs.getString("image_url"));
                        File oldImage = new File(oldImagePath);
                        if (oldImage.exists()) {
                            oldImage.delete();
                        }
                    }
                }
            } else {
                // Update product without changing image
                String sql = "UPDATE products SET name=?, category=?, price=?, stock=?, description=? WHERE id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, productName);
                pstmt.setString(2, category);
                pstmt.setDouble(3, price);
                pstmt.setInt(4, stock);
                pstmt.setString(5, description);
                pstmt.setInt(6, productId);
                
                pstmt.executeUpdate();
            }
            
            conn.close();
            
            // Send success response
            out.println("{");
            out.println("  \"success\": true,");
            out.println("  \"message\": \"Product updated successfully\"");
            out.println("}");
            
        } catch (Exception e) {
            // Send error response
            out.println("{");
            out.println("  \"success\": false,");
            out.println("  \"message\": \"" + e.getMessage().replace("\"", "\\\"") + "\"");
            out.println("}");
        }
    }
    
    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        for (String token : header.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return "";
    }
}