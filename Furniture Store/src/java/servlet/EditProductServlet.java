package servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

@WebServlet("/admin/EditProductServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 30
)
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            int id = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String description = request.getParameter("description");

            // Handle image upload
            Part filePart = request.getPart("image");
            String fileName = System.currentTimeMillis() + "_" + getSubmittedFileName(filePart);
            System.out.println("imaage========================================================" + filePart);
            String postpath = "E:/MCAProject/e-commerceFurniture/web/admin/image/" + fileName;
            try {
                FileOutputStream fos = new FileOutputStream(postpath);
                InputStream is = filePart.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                is.close();
                fos.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");

            String sql;
            PreparedStatement pstmt;

            if (fileName != null) {
                sql = "UPDATE products SET name=?, category=?, price=?, stock=?, description=?, image_url=? WHERE id=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, productName);
                pstmt.setString(2, category);
                pstmt.setDouble(3, price);
                pstmt.setInt(4, stock);
                pstmt.setString(5, description);
                pstmt.setString(6, fileName); // Save only the file name
                pstmt.setInt(7, id);
            } else {
                sql = "UPDATE products SET name=?, category=?, price=?, stock=?, description=? WHERE id=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, productName);
                pstmt.setString(2, category);
                pstmt.setDouble(3, price);
                pstmt.setInt(4, stock);
                pstmt.setString(5, description);
                pstmt.setInt(6, id);
            }

            int result = pstmt.executeUpdate();
            conn.close();

            if (result > 0) {
                response.sendRedirect("products.jsp");
//                out.println("{");
//                out.println("  \"success\": true,");
//                out.println("  \"message\": \"Product updated successfully\"");
//                out.println("}");
                // out.println("{ \"success\": true, \"message\": \"Product updated successfully\" }");
                 

            } else {
                throw new Exception("No product found with the given ID.");
            }

        } catch (Exception e) {
            out.println("{ \"success\": false, \"message\": \"" + e.getMessage().replace("\"", "\\\"") + "\" }");
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
