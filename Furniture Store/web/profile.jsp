<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Furniture Haven</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/layout.css">
</head>
<body>
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow position-relative">
                <!-- Logout Button at top-right corner -->
                <a href="LogoutServlet" class="btn btn-danger btn-sm position-absolute top-0 end-0 m-3">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>

                <div class="card-body p-5">
                    <h2 class="text-center mb-4">User Profile</h2>

                    <form action="UpdateProfileServlet" method="POST" id="profileForm">
                        <div class="row mb-4">
                            <div class="col-md-4 text-center">
                                <div class="profile-image-container mb-3">
                                    <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=User123" 
                                         alt="Profile" class="rounded-circle img-thumbnail">
                                </div>
                                
                                
                            </div>

                            <div class="col-md-8">
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName"
                                           value="<%= session.getAttribute("userName") %>" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                           value="<%= session.getAttribute("userEmail") %>" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="contactNumber" class="form-label">Contact Number</label>
                                    <input type="tel" class="form-control" id="contactNumber" name="contactNumber"
                                           pattern="[0-9]{10}" title="Please enter a valid 10-digit phone number"
                                            value="+91-9867543214">
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- Order History Section -->
                    <div class="mt-5">
                        <h3 class="mb-4">Order History</h3>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Item</th>
                                        <th>Date</th>
                                        <th>Total</th>
                                        <th>Status</th>
                                        <!-- <th>Action</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
                                        String userEmail = (String) session.getAttribute("userEmail");
                                        
                                        String sql = "SELECT * FROM orders WHERE user_email = ? ";
                                        PreparedStatement pstmt = conn.prepareStatement(sql);
                                        pstmt.setString(1, userEmail);
                                        ResultSet rs = pstmt.executeQuery();

                                        while(rs.next()) {
                                            String status = rs.getString("product_status");
                                            String statusClass = "";
                                            switch(status.toLowerCase()) {
                                                case "pending": statusClass = "warning"; break;
                                                case "confirmed": statusClass = "info"; break;
                                                case "shipped": statusClass = "primary"; break;
                                                case "delivered": statusClass = "success"; break;
                                                case "cancelled": statusClass = "danger"; break;
                                                default: statusClass = "secondary";
                                            }
                                    %>
                                    <tr>
                                        <td>#<%= rs.getString("order_id") %></td>
                                        <td><%= rs.getString("product_name") %></td>
                                        <td><%= rs.getDate("order_date") %></td>
                                        <td>₹<%= String.format("%.2f", rs.getDouble("total_amount")) %></td>
                                        <td>
                                            <span class="badge bg-<%= statusClass %>">
                                                <%= status %>
                                            </span>
                                        </td>
                                        <!-- <td>
                                            <button class="btn btn-sm btn-outline-primary" 
                                                    onclick="viewOrderDetails('<%= rs.getString("order_id") %>')">
                                                View Details
                                            </button>
                                        </td> -->
                                    </tr>
                                    <%
                                        }
                                        rs.close();
                                        pstmt.close();
                                        conn.close();
                                    } catch(Exception e) {
                                        out.println("<tr><td colspan='5' class='text-center text-danger'>Error loading orders: " + e.getMessage() + "</td></tr>");
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function viewOrderDetails(orderId) {
    // You can implement a modal or redirect to a detailed order page
    window.location.href = `order-details.jsp?id=${orderId}`;
}
</script>

<style>
    /* Add to existing styles */
    .table th {
        font-weight: 600;
    }
    
    .table td {
        vertical-align: middle;
    }
    
    .badge {
        padding: 0.5em 1em;
        font-weight: 500;
    }
    
    .text-truncate {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
</style>

<style>
    .profile-image-container {
        width: 150px;
        height: 150px;
        margin: 0 auto;
        position: relative;
    }

    .profile-image-container img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .form-control:focus {
        border-color: #80bdff;
        box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
    }
</style>
</body>
</html>
