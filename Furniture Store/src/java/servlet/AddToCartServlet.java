package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Retrieve user session
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            // If the user is not logged in, show a login prompt
            out.println("<html><head>");
            out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("</head><body>");
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  title: 'Login Required',");
            out.println("  text: 'Please login first!',");
            out.println("  icon: 'warning',");
            out.println("  confirmButtonText: 'OK'");
            out.println("}).then(() => { window.location.href='login.jsp'; });");
            out.println("</script>");
            out.println("</body></html>");
            return;
        }

        // Retrieve the product details from the form
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        String priceStr = request.getParameter("price");
        String image = request.getParameter("image");
        int stock = Integer.parseInt(request.getParameter("stock"));
        int quantity = 1;  // Default quantity is 1

        // Validate input data
        if (productId == null || productName == null || priceStr == null || image == null || stock <= 0) {
            out.println("<html><head>");
            out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("</head><body>");
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  title: 'Error!',");
            out.println("  text: 'Invalid product details. Please try again.',");
            out.println("  icon: 'error',");
            out.println("  confirmButtonText: 'OK'");
            out.println("});");
            out.println("</script>");
            out.println("</body></html>");
            return;
        }

        double price = Double.parseDouble(priceStr);

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
            
            // Check if the product is already in the cart for the user
            PreparedStatement checkStmt = conn.prepareStatement("SELECT quantity FROM cart WHERE product_id = ? AND user_email = ?");
            checkStmt.setString(1, productId);
            checkStmt.setString(2, userEmail);
            var rs = checkStmt.executeQuery();

            if (rs.next()) {
                // If product is already in the cart, update the quantity
                int currentQuantity = rs.getInt("quantity");
                quantity += currentQuantity;  // Add to existing quantity

                PreparedStatement updateStmt = conn.prepareStatement("UPDATE cart SET quantity = ? WHERE product_id = ? AND user_email = ?");
                updateStmt.setInt(1, quantity);
                updateStmt.setString(2, productId);
                updateStmt.setString(3, userEmail);
                updateStmt.executeUpdate();
            } else {
                // If product is not in the cart, insert a new record
                PreparedStatement stmt = conn.prepareStatement("INSERT INTO cart (product_id, product_name, category, price, product_image, quantity, user_email) VALUES (?, ?, ?, ?, ?, ?, ?)");
                stmt.setString(1, productId);
                stmt.setString(2, productName);
                stmt.setString(3, category);
                stmt.setDouble(4, price);
                stmt.setString(5, image);
                stmt.setInt(6, quantity);
                stmt.setString(7, userEmail);
                stmt.executeUpdate();
            }

            conn.close();

            // Show a success message with SweetAlert
            out.println("<html><head>");
            out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("</head><body>");
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  title: 'Added to Cart!',");
            out.println("  icon: 'success',");
            out.println("  confirmButtonColor: '#9B7E60',");
            out.println("  confirmButtonText: 'View Cart'");
            out.println("}).then((result) => {");
            out.println("    if (result.isConfirmed) {");
            out.println("        window.location.href = 'category.jsp';");
            out.println("    }");
            out.println("});");
            out.println("</script>");
            out.println("</body></html>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<html><head>");
            out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("</head><body>");
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  title: 'Error!',");
            out.println("  text: 'Something went wrong. Please try again later.',");
            out.println("  icon: 'error',");
            out.println("  confirmButtonText: 'OK'");
            out.println("}).then((result) => {");
            out.println("    if (result.isConfirmed) {");
            out.println("        window.location.href = 'category.jsp';");
            out.println("    }");
            out.println("});");
            out.println("</script>");
            out.println("</body></html>");
        }
    }
}
