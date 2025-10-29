<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>

<%
    String productId = request.getParameter("id");
    if (productId == null || productId.isEmpty()) {
        response.sendRedirect("categories.jsp");
        return;
    }

    String name = "", category = "", image = "admin/image/default.jpg", description = "";
    int stock = 0;
    double price = 0.0;
    java.sql.Date createdAt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM products WHERE id = ?");
        stmt.setInt(1, Integer.parseInt(productId));
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            category = rs.getString("category");
            image = "admin/image/" + rs.getString("image_url");
            description = rs.getString("description");
            price = rs.getDouble("price");
            stock = rs.getInt("stock");
            createdAt = rs.getDate("created_at");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Format Date
    String formattedDate = (createdAt != null) ? new java.text.SimpleDateFormat("dd MMM yyyy").format(createdAt) : "N/A";
%>

<br><br><br>

<style>
    .product-image {
        max-height: 500px;
        width: 100%;
        object-fit: contain;
        background: #f8f9fa;
        padding: 2rem;
        border-radius: 10px;
    }
    
    .thumbnail {
        width: 100px;
        height: 100px;
        object-fit: cover;
        cursor: pointer;
        border-radius: 8px;
        transition: all 0.3s ease;
    }
    
    .thumbnail:hover, .thumbnail.active {
        border: 2px solid #9B7E60;
        transform: scale(1.05);
    }
    
    .quantity-input {
        width: 80px;
        text-align: center;
        font-size: 1.1rem;
    }
    
    .product-features {
        background: #f8f9fa;
        border-radius: 10px;
        padding: 1.5rem;
        margin-top: 2rem;
    }
    
    .feature-item {
        display: flex;
        align-items: center;
        margin-bottom: 1rem;
    }
    
    .feature-icon {
        width: 40px;
        height: 40px;
        background: #9B7E60;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 1rem;
        color: white;
    }
    
    .price {
        color: #9B7E60;
        font-size: 2rem;
    }
    
    .stock-status {
        background: #e8f5e9;
        color: #2e7d32;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        display: inline-block;
        margin-bottom: 1rem;
    }
</style>

<div class="container py-5">
    <div class="row">
        <!-- Product Images -->
        <div class="col-md-6 mb-4">
            <div class="position-relative">
                <img src="<%= image %>" class="img-fluid rounded product-image mb-3" id="mainImage" alt="<%= name %>">
            </div>
        </div>

        <!-- Product Details -->
        <div class="col-md-6">
            <span class="text-uppercase text-muted mb-2 d-block"><%= category %> Collection</span>
            <h1 class="h2 mb-3 fw-bold"><%= name %></h1>
            
            <div class="d-flex align-items-center mb-4">
                <div class="rating me-2">
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-half text-warning"></i>
                    <span class="ms-2 text-muted">(4.5)</span>
                </div>
            </div>
            
            <h3 class="price mb-4">₹<%= price %></h3>
            
            <% if (stock > 0) { %>
                <span class="stock-status">
                    <i class="bi bi-check-circle-fill me-2"></i>In Stock (<%= stock %> available)
                </span>
            <% } else { %>
                <span class="stock-status bg-danger text-white">
                    <i class="bi bi-x-circle-fill me-2"></i>Out of Stock
                </span>
            <% } %>
            
            
            <div class="mb-4">
                <h2 class="h5 mb-3">Description</h2>
                <p class="text-muted"><%= description %></p>
            </div>

            <div class="purchase-options">
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="productId" value="<%= productId %>">
                    <input type="hidden" name="productName" value="<%= name %>">
                    <input type="hidden" name="category" value="<%= category %>">
                    <input type="hidden" name="price" value="<%= price %>">
                    <input type="hidden" name="image" value="<%= image %>">
                    <input type="hidden" name="stock" value="<%= stock %>">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-cart-plus me-2"></i>Add to Cart
                    </button>
                </form>
            
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            

            <!-- <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary btn-lg">
                    <i class="bi bi-cart-plus me-2"></i>Add to Cart
                </button>
            </div> -->

            <!-- Product Features -->
            <div class="product-features">
                <h3 class="h5 mb-4">Product Features</h3>
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="bi bi-truck"></i>
                    </div>
                    <div>
                        <h4 class="h6 mb-1">Free Delivery</h4>
                        <p class="text-muted mb-0">Free shipping on orders above ₹999</p>
                    </div>
                </div>
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="bi bi-shield-check"></i>
                    </div>
                    <div>
                        <h4 class="h6 mb-1">Quality Guarantee</h4>
                        <p class="text-muted mb-0">1-year warranty on all products</p>
                    </div>
                </div>
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="bi bi-arrow-counterclockwise"></i>
                    </div>
                    <div>
                        <h4 class="h6 mb-1">Easy Returns</h4>
                        <p class="text-muted mb-0">30-day return policy</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Handle SweetAlert on form submit (can trigger after cart addition success)
    document.querySelector('.btn.buy-now-btn').addEventListener('click', function (e) {
        e.preventDefault();

        fetch('AddToCartServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: `productId=<%= productId %>&productName=<%= name %>&price=<%= price %>&image=<%= image %>&stock=<%= stock %>`
        })
        .then(response => response.text())
        .then(data => {
            Swal.fire({
                title: 'Added to Cart!',
                text: `<%= name %> has been added to your cart.`,
                imageUrl: `<%= image %>`,
                imageWidth: 100,
                imageHeight: 100,
                icon: 'success',
                confirmButtonColor: '#9B7E60',
                showCancelButton: true,
                cancelButtonText: 'Continue Shopping',
                confirmButtonText: 'View Cart'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'cart.jsp';
                }
            });
        })
        .catch(error => console.error('Error adding to cart:', error));
    });
</script>

<%@ include file="footer.jsp" %>