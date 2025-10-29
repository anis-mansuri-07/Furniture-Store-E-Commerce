<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>

        <!-- Dashboard Content -->
        <div class="p-6">
            <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
                
                PreparedStatement psproducts = conn.prepareStatement("SELECT COUNT(*) AS total_products FROM products");
                ResultSet rsproducts = psproducts.executeQuery();
                int totalproducts = 0;
                if (rsproducts.next()) {
                    totalproducts = rsproducts.getInt("total_products");
                }

                PreparedStatement psUsers = conn.prepareStatement("SELECT COUNT(*) AS total_users FROM register");
                ResultSet rsUsers = psUsers.executeQuery();
                int totalUsers = 0;
                if (rsUsers.next()) {
                    totalUsers = rsUsers.getInt("total_users");
                }

                PreparedStatement pscategories = conn.prepareStatement("SELECT COUNT(*) AS total_categories FROM categories");
                ResultSet rscategories = pscategories.executeQuery();
                int totalcategories = 0;
                if (rscategories.next()) {
                    totalcategories = rscategories.getInt("total_categories");
                }
                conn.close();
        %>
            <!-- Metrics Cards -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex items-center">
                        <i data-lucide="package" class="h-10 w-10 text-wood"></i>
                        <div class="ml-4">
                            <h3 class="text-gray-500 text-sm">Total Products</h3>
                            <p class="text-2xl font-semibold"><%= totalproducts %></p>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex items-center">
                        <i data-lucide="shapes" class="h-10 w-10 text-wood"></i>
                        <div class="ml-4">
                            <h3 class="text-gray-500 text-sm">Total Categories</h3>
                            <p class="text-2xl font-semibold"><%= totalcategories %></p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex items-center">
                        <i data-lucide="shopping-bag" class="h-10 w-10 text-wood"></i>
                        <div class="ml-4">
                            <h3 class="text-gray-500 text-sm">New Orders</h3>
                            <p class="text-2xl font-semibold">45</p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex items-center">
                        <i data-lucide="users" class="h-10 w-10 text-wood"></i>
                        <div class="ml-4">
                            <h3 class="text-gray-500 text-sm">Total Users</h3>
                            <p class="text-2xl font-semibold"><%= totalUsers %></p>
                        </div>
                    </div>
                </div>
            </div>
            <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <!-- Charts Section -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
                <div class="bg-white rounded-lg shadow p-6">
                    <h2 class="text-xl font-semibold mb-4">Monthly Sales</h2>
                    <canvas id="salesChart" height="200"></canvas>
                </div>
                
                <div class="bg-white rounded-lg shadow p-6">
                    <h2 class="text-xl font-semibold mb-4">Top Selling Products</h2>
                    <canvas id="productsChart" height="200"></canvas>
                </div>
            </div>

            <!-- Products Table -->
            <div class="bg-white rounded-lg shadow">
                <div class="p-6">
                    <h2 class="text-xl font-semibold mb-4">Product Management</h2>
                    <div class="overflow-x-auto">
                        <table class="min-w-full">
                            <thead>
                                <tr class="bg-soft-gray">
                                    <th class="px-6 py-3 text-left">Product</th>
                                    <th class="px-6 py-3 text-left">Category</th>
                                    <th class="px-6 py-3 text-left">Price</th>
                                    <th class="px-6 py-3 text-left">Stock</th>
                                    <th class="px-6 py-3 text-left">Status</th>
                                    <th class="px-6 py-3 text-left">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200">
                                <!-- Sample product rows -->
                                <tr class="hover:bg-soft-gray">
                                    <td class="px-6 py-4">
                                        <div class="flex items-center">
                                            <img src="images/products/sofa-1.jpg" alt="Sofa" class="h-12 w-12 rounded object-cover">
                                            <span class="ml-3">Modern Sofa</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4">Living Room</td>
                                    <td class="px-6 py-4">$899</td>
                                    <td class="px-6 py-4">15</td>
                                    <td class="px-6 py-4">
                                        <span class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-sm">In Stock</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <button class="text-blue-600 hover:text-blue-800 mr-2">
                                            <i data-lucide="edit" class="h-5 w-5"></i>
                                        </button>
                                        <button class="text-red-600 hover:text-red-800">
                                            <i data-lucide="trash-2" class="h-5 w-5"></i>
                                        </button>
                                    </td>
                                </tr>
                                <!-- Add more product rows as needed -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Initialize Lucide Icons -->
    <script>
        lucide.createIcons();
    </script>

    <!-- Initialize Charts -->
    <script>
        // Sales Chart
        const salesCtx = document.getElementById('salesChart').getContext('2d');
        new Chart(salesCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Sales',
                    data: [15000, 18000, 22000, 19000, 24500, 28000],
                    borderColor: '#9B7E60',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });

        // Products Chart
        const productsCtx = document.getElementById('productsChart').getContext('2d');
        new Chart(productsCtx, {
            type: 'doughnut',
            data: {
                labels: ['Sofas', 'Dining Tables', 'Beds', 'Wardrobes'],
                datasets: [{
                    data: [30, 25, 20, 15],
                    backgroundColor: ['#9B7E60', '#B8A088', '#D4C4B7', '#E6DFD8']
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });
    </script>
</body>
</html>
