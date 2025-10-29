package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Admin Login Processing</title>");
        out.println("</head>");
        out.println("<body>");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
            
            String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminEmail", email);
                session.setAttribute("adminName", rs.getString("full_name"));
                session.setAttribute("adminRole", "admin");
                
                out.println("<script>");
                out.println("alert('Login Successful!');");
                out.println("window.location.href='admin/profile.jsp';");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("alert('Invalid Email or Password!');");
                out.println("window.location.href='admin/login.jsp';");
                out.println("</script>");
            }
            
            conn.close();
            
        } catch (Exception e) {
            out.println("<script>");
            out.println("alert('Error: " + e.getMessage() + "');");
            out.println("window.location.href='admin/login.jsp';");
            out.println("</script>");
        }
        
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}