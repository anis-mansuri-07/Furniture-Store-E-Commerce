<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%
    if (userEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String, String>> cartItems = new ArrayList<>();
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");

        String sql = "SELECT cart_id, product_id, product_name, category, price, product_image, quantity, added_at FROM cart WHERE user_email = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, userEmail);
        rs = stmt.executeQuery();

        while (rs.next()) {
            Map<String, String> item = new HashMap<>();
            item.put("cart_id", rs.getString("cart_id"));
            item.put("product_id", rs.getString("product_id"));
            item.put("product_name", rs.getString("product_name"));
            item.put("category", rs.getString("category"));
            item.put("price", rs.getString("price"));
            item.put("product_image", rs.getString("product_image"));
            item.put("quantity", rs.getString("quantity"));

            Timestamp timestamp = rs.getTimestamp("added_at");
            SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, hh:mm a");
            item.put("added_at", sdf.format(timestamp));

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
<br><br><br><br><br>
<div class="container cart-container">
    <div class="cart-header">
        <h2 class="section-title">Your Shopping Cart</h2>
    </div>
    <div class="row g-4">
        <div class="col-lg-8">
            <% 
            double total = 0;
            for (Map<String, String> item : cartItems) { 
                double price = Double.parseDouble(item.get("price"));
                int quantity = Integer.parseInt(item.get("quantity"));
                total += price * quantity;
            %>
            <div class="cart-item" data-price="<%= price %>">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <img src="<%= item.get("product_image") %>" alt="<%= item.get("product_name") %>" class="img-fluid rounded">
                    </div>
                    <div class="col-md-6 item-details">
                        <h5><%= item.get("product_name") %></h5>
                        <div class="product-meta">
                            <span class="text-muted">Category: <%= item.get("category") %></span>
                            <span class="badge bg-success ms-2">In Stock</span>
                        </div>
                        <div class="product-specs mt-2">
                            <p class="mb-1"><small>Added On: <%= item.get("added_at") %></small></p>
                        </div>
                        <form action="UpdateCartServlet" method="post" class="quantity-control mt-3" onsubmit="return beforeSubmit(this);">
                            <input type="hidden" name="cart_id" value="<%= item.get("cart_id") %>">
                            <button type="button" class="quantity-btn minus" onclick="updateQuantity(this, -1)"><i class="bi bi-dash"></i></button>
                            <input type="number" class="quantity-input" name="quantity" value="<%= quantity %>" min="1" max="10" readonly>
                            <button type="button" class="quantity-btn plus" onclick="updateQuantity(this, 1)"><i class="bi bi-plus"></i></button>
                            <button type="submit" class="update-btn"><i class="bi bi-arrow-clockwise"></i></button>
                        </form>
                        
                    </form>
                    </div>
                    <div class="col-md-3 text-end">
                        <div class="price mb-2">Rs<%= String.format("%.2f", price) %></div>
                        <form action="RemoveCartServlet" method="post" onsubmit="return confirm('Are you sure you want to remove this item?');">
                            <input type="hidden" name="cart_id" value="<%= item.get("cart_id") %>">
                            <button type="submit" class="remove-btn"><i class="bi bi-trash"></i> Remove</button>
                        </form>
                        
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <div class="col-lg-4">
            <div class="cart-summary">
                <h4 class="summary-title">Order Summary</h4>
                <div class="summary-items">
                    <div class="summary-item">
                        <span>Items (<%= cartItems.size() %>)</span>
                        <span class="subtotal">Rs<%= String.format("%.2f", total) %></span>
                    </div>
                    <div class="summary-item total">
                        <span>Total</span>
                        <span class="total-amount">Rs<%= String.format("%.2f", total) %></span>
                    </div>
                </div>
                <form action="checkout.jsp" method="post">
                <button type="submit" class="checkout-btn"><i class="bi bi-credit-card me-2"></i>Proceed to Checkout</button>
                </form>
                <div class="secure-checkout">
                    <i class="bi bi-shield-check"></i>
                    <small>Secure Checkout</small>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function updateQuantity(button, change) {
        const input = button.parentElement.querySelector('.quantity-input');
        let currentValue = parseInt(input.value);
        let newValue = currentValue + change;
        if (newValue >= 1 && newValue <= 10) {
            input.value = newValue;
            updateTotals();
        }
    }
</script>

<style>
    .cart-container {
        padding: 40px 0;
        min-height: 80vh;
    }
    
    .cart-header {
        margin-bottom: 30px;
        text-align: center;
    }
    
    .section-title {
        color: #2c3e50;
        font-weight: 600;
        margin-bottom: 10px;
    }
    
    .cart-item {
        background: #fff;
        border-radius: 15px;
        padding: 25px;
        margin-bottom: 20px;
        box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        transition: all 0.3s ease;
        border: 1px solid rgba(0,0,0,0.05);
    }
    
    .cart-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 20px rgba(0,0,0,0.08);
    }
    
    .cart-item img {
        border-radius: 10px;
        object-fit: cover;
        width: 100%;
        transition: transform 0.3s ease;
    }
    
    .cart-item img:hover {
        transform: scale(1.05);
    }
    
    .item-details h5 {
        color: #2c3e50;
        margin-bottom: 10px;
        font-weight: 600;
    }
    
    .product-meta {
        margin-bottom: 10px;
    }
    
    .price {
        color: #e74c3c;
        font-weight: 600;
        font-size: 1.25rem;
    }
    
    .quantity-control {
        display: flex;
        align-items: center;
        gap: 15px;
        background: #f8f9fa;
        padding: 8px 15px;
        border-radius: 30px;
        width: fit-content;
    }
    
    .quantity-btn {
        background: white;
        border: 1px solid #dee2e6;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .quantity-btn:hover {
        background: #e9ecef;
        transform: scale(1.1);
    }
    
    .quantity-input {
        width: 40px;
        text-align: center;
        border: none;
        background: transparent;
        font-weight: 600;
    }
    
    .cart-summary {
        background: #fff;
        border-radius: 15px;
        padding: 30px;
        position: sticky;
        top: 20px;
        box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        border: 1px solid rgba(0,0,0,0.05);
    }
    
    .summary-title {
        color: #2c3e50;
        margin-bottom: 25px;
        font-weight: 600;
    }
    
    .summary-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        color: #6c757d;
    }
    
    .coupon-section {
        margin: 20px 0;
        padding: 15px 0;
        border-top: 1px dashed #dee2e6;
        border-bottom: 1px dashed #dee2e6;
    }
    
    .total {
        font-size: 1.25rem;
        color: #2c3e50;
        font-weight: 600;
        margin-top: 15px;
    }
    
    .checkout-btn {
        background: #2ecc71;
        color: white;
        border: none;
        padding: 15px;
        border-radius: 10px;
        width: 100%;
        font-weight: 600;
        margin-top: 20px;
        transition: all 0.3s ease;
    }
    
    .checkout-btn:hover {
        background: #27ae60;
        transform: translateY(-2px);
    }
    
    .secure-checkout {
        text-align: center;
        margin-top: 15px;
        color: #7f8c8d;
    }
    
    .remove-btn {
        color: #e74c3c;
        border: none;
        background: none;
        padding: 8px 15px;
        cursor: pointer;
        transition: all 0.3s ease;
        border-radius: 20px;
    }
    
    .remove-btn:hover {
        background: #fee5e3;
        color: #c0392b;
    }
    .update-btn {
        background: #fff;
        border: 1px solid #dee2e6;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-left: 10px;
        color: #2ecc71;
    }
    
    .update-btn:hover {
        background: #2ecc71;
        color: white;
        transform: rotate(180deg);
    }
</style>

<script>
    function updateQuantity(button, change) {
        const input = button.parentElement.querySelector('.quantity-input');
        const currentValue = parseInt(input.value);
        const newValue = currentValue + change;
        
        if (newValue >= 1 && newValue <= 10) {
            input.value = newValue;
            updateTotals();
        }
    }
    
    function removeItem(button) {
        if (confirm('Are you sure you want to remove this item?')) {
            const cartItem = button.closest('.cart-item');
            cartItem.style.opacity = '0';
            setTimeout(() => {
                cartItem.remove();
                updateTotals();
            }, 300);
        }
    }
    
    function updateTotals() {
        let subtotal = 0;
        document.querySelectorAll('.cart-item').forEach(item => {
            const price = parseFloat(item.dataset.price);
            const quantity = parseInt(item.querySelector('.quantity-input').value);
            subtotal += price * quantity;
        });
        
        const tax = subtotal * 0.08;
        const shipping = 29.99;
        const total = subtotal + tax + shipping;
        
        document.querySelector('.subtotal').textContent = `$${subtotal.toFixed(2)}`;
        document.querySelector('.tax').textContent = `$${tax.toFixed(2)}`;
        document.querySelector('.total-amount').textContent = `$${total.toFixed(2)}`;
    }
</script>

<%@ include file="footer.jsp" %>