<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<style>
    .product-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border: none;
        box-shadow: 0 2px 15px rgba(0,0,0,0.05);
    }
    
    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 20px rgba(0,0,0,0.1);
    }
    
    .product-image {
        position: relative;
        overflow: hidden;
    }
    
    .product-image img {
        height: 100%;
        object-fit: cover;
    }
    
    .product-overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0,0,0,0.4);
        display: flex;
        justify-content: center;
        align-items: center;
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    
    .product-card:hover .product-overlay {
        opacity: 1;
    }
    
    .price {
        font-size: 1.25rem;
        font-weight: 600;
        color: var(--bs-primary);
    }
    
    .rating {
        font-size: 0.875rem;
    }
</style>

<!-- Page Header -->
<div class="page-header" style="background-image: url('https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?auto=format&fit=crop&q=80');">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <h1 class="display-4 fw-bold mb-3">Our Products</h1>
                <p class="lead mb-4">Discover our collection of premium furniture</p>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Products</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<!-- Products Section -->
<div class="container py-5">
    <!-- Sort Options
    <div class="d-flex justify-content-end align-items-center mb-4">
        <div class="d-flex align-items-center">
            <span class="me-2">Sort by:</span>
            <select class="form-select form-select-sm" style="width: auto;">
                <option>Featured</option>
                <option>Price: Low to High</option>
                <option>Price: High to Low</option>
                <option>Newest</option>
            </select>
        </div>
    </div> -->

    <!-- Products Grid -->
    <div class="row g-4">
        <!-- Product Card -->
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products");

            while (rs.next()) {
        %>
        <div class="col-md-6 col-lg-4">
            <div class="card product-card h-100">
                <!-- Update the product card in the while loop -->
                <div class="product-image">
                    <a href="product-detail.jsp?id=<%= rs.getString("id") %>">
                        <img src="admin/image/<%= rs.getString("image_url") %>" class="card-img-top" alt="<%= rs.getString("name") %>">
                    </a>
                    <div class="product-overlay">
                        <a href="product-detail.jsp?id=<%= rs.getString("id") %>" class="btn btn-sm btn-primary">
                            <i class="bi bi-cart-plus"></i> View Details
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class="card-title"><%= rs.getString("name") %></h5>
                    <p class="card-text text-muted"><%= rs.getString("category") %>Collection</p>
                    <p class="card-text text-muted"><%= rs.getString("description") %></p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price">₹<%= rs.getString("price") %></span>
                        <div class="rating">
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-half text-warning"></i>
                            <span class="ms-1">(4.5)</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>
<%@ include file="footer.jsp" %>
