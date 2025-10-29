package servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try {
            // Get form data
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            boolean rememberMe = request.getParameter("rememberMe") != null;
            
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
            
            // Check user credentials
            String sql = "SELECT * FROM register WHERE email = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                // Login successful
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("userEmail", email);
                session.setAttribute("userName", rs.getString("full_name"));
                
                // Set session timeout if remember me is checked
                if (rememberMe) {
                    session.setMaxInactiveInterval(7 * 24 * 60 * 60); // 7 days
                }
                
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<!DOCTYPE html>");
                response.getWriter().println("<html><head>");
                response.getWriter().println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
                response.getWriter().println("</head><body>");
                response.getWriter().println("<script>");
                response.getWriter().println("document.addEventListener('DOMContentLoaded', function() {");
                response.getWriter().println("    Swal.fire({");
                response.getWriter().println("        title: 'Success!',");
                response.getWriter().println("        text: 'Login successful!',");
                response.getWriter().println("        icon: 'success',");
                response.getWriter().println("        confirmButtonText: 'OK'");
                response.getWriter().println("    }).then((result) => {");
                response.getWriter().println("        window.location.href='index.jsp';");
                response.getWriter().println("    });");
                response.getWriter().println("});");
                response.getWriter().println("</script>");
                response.getWriter().println("</body></html>");
            } else {
                // Login failed
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<!DOCTYPE html>");
                response.getWriter().println("<html><head>");
                response.getWriter().println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
                response.getWriter().println("</head><body>");
                response.getWriter().println("<script>");
                response.getWriter().println("document.addEventListener('DOMContentLoaded', function() {");
                response.getWriter().println("    Swal.fire({");
                response.getWriter().println("        title: 'Error!',");
                response.getWriter().println("        text: 'Invalid email or password!',");
                response.getWriter().println("        icon: 'error',");
                response.getWriter().println("        confirmButtonText: 'OK'");
                response.getWriter().println("    }).then((result) => {");
                response.getWriter().println("        window.location.href='login.jsp';");
                response.getWriter().println("    });");
                response.getWriter().println("});");
                response.getWriter().println("</script>");
                response.getWriter().println("</body></html>");
            }
            
            // Close resources
            rs.close();
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            // Handle any errors
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<!DOCTYPE html>");
            response.getWriter().println("<html><head>");
            response.getWriter().println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            response.getWriter().println("</head><body>");
            response.getWriter().println("<script>");
            response.getWriter().println("document.addEventListener('DOMContentLoaded', function() {");
            response.getWriter().println("    Swal.fire({");
            response.getWriter().println("        title: 'Error!',");
            response.getWriter().println("        text: 'An error occurred: " + e.getMessage() + "',");
            response.getWriter().println("        icon: 'error',");
            response.getWriter().println("        confirmButtonText: 'OK'");
            response.getWriter().println("    }).then((result) => {");
            response.getWriter().println("        window.location.href='login.jsp';");
            response.getWriter().println("    });");
            response.getWriter().println("});");
            response.getWriter().println("</script>");
            response.getWriter().println("</body></html>");
        }
    }
}