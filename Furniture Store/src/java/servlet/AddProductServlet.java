package servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

@WebServlet("/admin/addProduct")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 30
)
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            // Get form data
            String productName = request.getParameter("productName");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String description = request.getParameter("description");
            
            // Handle image upload
            Part filePart = request.getPart("image");
            String fileName = System.currentTimeMillis() + "_" + getSubmittedFileName(filePart);
           
            String postpath = "E:/MCAProject/e-commerceFurniture/web/admin/image/"+ fileName;
               try
               {
                FileOutputStream fos = new FileOutputStream(postpath);
                InputStream is = filePart.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                is.close();
                fos.close();
               }catch(Exception e)
               {
                   e.printStackTrace();
               }
            
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
            
            // Insert product
            String sql = "INSERT INTO products (name, category, price, stock, description, image_url) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productName);
            pstmt.setString(2, category);
            pstmt.setDouble(3, price);
            pstmt.setInt(4, stock);
            pstmt.setString(5, description);
            pstmt.setString(6,fileName);
            
            int result = pstmt.executeUpdate();
            conn.close();
            
            if (result > 0) {
                // Success response
                out.println("{");
                out.println("  \"success\": true,");
                out.println("  \"message\": \"Product added successfully\"");
                out.println("}");
            } else {
                throw new Exception("Failed to add product");
            }
            
        } catch (Exception e) {
            // Error response
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
