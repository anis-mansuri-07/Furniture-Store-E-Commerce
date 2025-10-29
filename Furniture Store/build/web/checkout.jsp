<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*, java.util.*" %>

<%
    if (userEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String, String>> cartItems = new ArrayList<>();
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    double total = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");

        String sql = "SELECT cart_id, product_name, price, quantity FROM cart WHERE user_email = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, userEmail);
        rs = stmt.executeQuery();

        while (rs.next()) {
            Map<String, String> item = new HashMap<>();
            item.put("id", rs.getString("cart_id"));
            item.put("product_name", rs.getString("product_name"));
            item.put("price", rs.getString("price"));
            item.put("quantity", rs.getString("quantity"));

            double price = Double.parseDouble(rs.getString("price"));
            int quantity = Integer.parseInt(rs.getString("quantity"));
            total += price * quantity;

            cartItems.add(item);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
        try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
        try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
    }
%>

<style>
    .checkout-section {
        background: #fff;
        border-radius: 10px;
        padding: 25px;
        margin-bottom: 20px;
        box-shadow: 0 2px 15px rgba(0,0,0,0.05);
    }
    .order-summary {
        background: #f8f9fa;
        border-radius: 10px;
        padding: 20px;
        position: sticky;
        top: 20px;
    }
    .form-control:focus {
        border-color: #9B7E60;
        box-shadow: 0 0 0 0.2rem rgba(155,126,96,0.25);
    }
</style>
<br><br><br>
<form id="shippingForm" action="PlaceOrderServlet" method="post">
<div class="container py-5">
    <h2 class="mb-4">Checkout</h2>
    <div class="row">
        <!-- Shipping Form -->
        <div class="col-lg-8">
            <div class="checkout-section">
                <h4 class="mb-4">Shipping Information</h4>
                    <input type="hidden" name="userEmail" value="<%= userEmail %>">
                    <%
                    for (Map<String, String> item : cartItems) {
                        String productName = item.get("product_name");
                        String quantity = item.get("quantity");
                        double price = Double.parseDouble(item.get("price"));
                        double itemTotal = price * Integer.parseInt(quantity);
                %>
                    <input type="hidden" name="productName" value="<%= productName %>, ">
                    <input type="hidden" name="totalAmount" value="<%= itemTotal %>">
                <% } %>
                    <input type="hidden" name="productStatus" value="pending">
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input type="text" name="address" class="form-control" required>
                    </div>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="form-label">City</label>
                            <input type="text" name="city" class="form-control" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">State</label>
                            <select name="state" class="form-select" required>
                                <option value="">Select State</option>
                                <option value="MH">Maharashtra</option>
                                <option value="GJ">Gujarat</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">PIN Code</label>
                            <input type="text" name="pinCode" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone</label>
                        <input type="tel" name="phone" class="form-control" required>
                    </div>
            </div>
        </div>

        <!-- Order Summary -->
        <div class="col-lg-4">
            <div class="order-summary">
                <h4 class="mb-4">Order Summary</h4>
                <%
                    for (Map<String, String> item : cartItems) {
                        String productName = item.get("product_name");
                        String quantity = item.get("quantity");
                        double price = Double.parseDouble(item.get("price"));
                        double itemTotal = price * Integer.parseInt(quantity);
                %>
                <div class="d-flex justify-content-between mb-2">
                    <span><%= productName %> × <%= quantity %></span>
                    <span>₹<%= String.format("%.2f", itemTotal) %></span>
                </div>
                <% } %>
                <hr>
                <div class="d-flex justify-content-between mb-2">
                    <span>Subtotal</span>
                    <span>₹<%= String.format("%.2f", total) %></span>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <span>Shipping</span>
                    <span>₹<%= total >= 999 ? "0.00" : "99.00" %></span>
                </div>
                <hr>
                <div class="d-flex justify-content-between mb-4">
                    <span class="fw-bold">Total</span>
                    <span class="fw-bold">₹<%= String.format("%.2f", total + (total >= 999 ? 0 : 99)) %></span>
                </div>
                <button type="submit" class="btn btn-primary w-100" onclick="placeOrder()">Place Order</button>
            </div>
        </div>
    </div>
</div>
</form>

<script>
function placeOrder() {
    const form = document.getElementById('shippingForm');

    if (!form.checkValidity()) {
        Swal.fire({
            title: 'Error!',
            text: 'Please fill in all required fields',
            icon: 'error',
            confirmButtonColor: '#9B7E60'
        });
        return;
    }

    Swal.fire({
        title: 'Confirm Order',
        text: 'Are you sure you want to place this order?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#9B7E60',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Yes, place order!'
    }).then((result) => {
        if (result.isConfirmed) {
            form.submit();
        }
    });
}
</script>

<%@ include file="footer.jsp" %>
