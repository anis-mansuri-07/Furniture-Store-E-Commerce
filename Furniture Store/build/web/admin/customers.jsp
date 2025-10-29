<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>

        <!-- Customers Content -->
        <div class="p-6">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-800">Customer Management</h2>
                <div class="flex space-x-4">
                    <button class="bg-wood text-white px-4 py-2 rounded-lg hover:opacity-90">
                        <i data-lucide="download" class="h-5 w-5 inline-block mr-2"></i>Export
                    </button>
                </div>
            </div>

            <!-- Customers Table -->
            <div class="bg-white rounded-lg shadow">
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-soft-gray">
                            <tr>
                                <th class="px-6 py-3 text-left">#</th>
                                <th class="px-6 py-3 text-left">Name</th>
                                <th class="px-6 py-3 text-left">Email</th>
                                <th class="px-6 py-3 text-left">Phone</th>
                                <!-- <th class="px-6 py-3 text-left">Orders</th>
                                <th class="px-6 py-3 text-left">Total Spent</th>
                                <th class="px-6 py-3 text-left">Actions</th> -->
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200">
                            <%
                                try {
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM register");

                                    while (rs.next()) {
                            %>
                            <tr class="hover:bg-soft-gray">
                                <td class="px-6 py-4"><%= rs.getInt("id") %></td>
                                <td class="px-6 py-4"><%= rs.getString("full_name") %></td>
                                <td class="px-6 py-4"><%= rs.getString("email") %></td>
                                <td class="px-6 py-4"><%= rs.getString("contact_number") %></td>
                                <!-- <td class="px-6 py-4">5</td>
                                <td class="px-6 py-4">$2,450.00</td>
                                <td class="px-6 py-4">
                                    <button class="text-blue-600 hover:text-blue-800 mr-3">
                                        <i data-lucide="eye" class="h-5 w-5"></i>
                                    </button>
                                    <button class="text-red-600 hover:text-red-800">
                                        <i data-lucide="trash" class="h-5 w-5"></i>
                                    </button>
                                </td> -->
                            </tr>
                            <%
                                    }
                                    conn.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>