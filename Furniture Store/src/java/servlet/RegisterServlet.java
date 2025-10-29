package servlet;

import java.sql.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
         
        try {
            // Get form data
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String contactNumber = request.getParameter("contactNumber");
            String password = request.getParameter("password"); // Direct password without hashing
            
            // Check if email already exists
            if (isEmailExists(email)) {
                session.setAttribute("error", "Email already registered!");
                response.sendRedirect("register.jsp");
                return;
            }
            Class.forName("com.mysql.cj.jdbc.Driver");
           
            // Database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore","root","mysql");
            
            // Insert user data
            String sql = "INSERT INTO register (full_name, email, contact_number, password) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullName);
            pstmt.setString(2, email);
            pstmt.setString(3, contactNumber);
            pstmt.setString(4, password);
            
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<!DOCTYPE html>");
                response.getWriter().println("<html>");
                response.getWriter().println("<head>");
                response.getWriter().println("<title>Registration Success</title>");
                response.getWriter().println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
                response.getWriter().println("</head>");
                response.getWriter().println("<body>");
                response.getWriter().println("<script>");
                response.getWriter().println("document.addEventListener('DOMContentLoaded', function() {");
                response.getWriter().println("    Swal.fire({");
                response.getWriter().println("        title: 'Success!',");
                response.getWriter().println("        text: 'Account created successfully!',");
                response.getWriter().println("        icon: 'success',");
                response.getWriter().println("        confirmButtonText: 'OK'");
                response.getWriter().println("    }).then((result) => {");
                response.getWriter().println("        if (result.isConfirmed) {");
                response.getWriter().println("            window.location.href='login.jsp';");
                response.getWriter().println("        }");
                response.getWriter().println("    });");
                response.getWriter().println("});");
                response.getWriter().println("</script>");
                response.getWriter().println("</body>");
                response.getWriter().println("</html>");
            } else {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<!DOCTYPE html>");
                response.getWriter().println("<html>");
                response.getWriter().println("<head>");
                response.getWriter().println("<title>Registration Error</title>");
                response.getWriter().println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
                response.getWriter().println("</head>");
                response.getWriter().println("<body>");
                response.getWriter().println("<script>");
                response.getWriter().println("document.addEventListener('DOMContentLoaded', function() {");
                response.getWriter().println("    Swal.fire({");
                response.getWriter().println("        title: 'Error!',");
                response.getWriter().println("        text: 'Registration failed! Please try again.',");
                response.getWriter().println("        icon: 'error',");
                response.getWriter().println("        confirmButtonText: 'OK'");
                response.getWriter().println("    }).then((result) => {");
                response.getWriter().println("        if (result.isConfirmed) {");
                response.getWriter().println("            window.location.href='register.jsp';");
                response.getWriter().println("        }");
                response.getWriter().println("    });");
                response.getWriter().println("});");
                response.getWriter().println("</script>");
                response.getWriter().println("</body>");
                response.getWriter().println("</html>");
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            session.setAttribute("error", "Error: " + e.getMessage());
            response.sendRedirect("register.jsp");
        }
    }
    
    private boolean isEmailExists(String email) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore","root","mysql");
            String sql = "SELECT COUNT(*) FROM register WHERE email = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            
            rs.close();
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}