<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*, java.util.*" %>

<div class="p-6">
    <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-semibold text-gray-800">Orders Management</h2>
    </div>

    <div class="bg-white rounded-lg shadow">
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-soft-gray">
                    <tr>
                        <th class="px-6 py-3 text-left">Order ID</th>
                        <th class="px-6 py-3 text-left">Customer</th>
                        <th class="px-6 py-3 text-left">Date</th>
                        <th class="px-6 py-3 text-left">Total</th>
                        <th class="px-6 py-3 text-left">Status</th>
                        <th class="px-6 py-3 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%
                        try {
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM orders");

                            while (rs.next()) {
                                int orderId = rs.getInt("order_id");
                                String userEmail = rs.getString("user_email");
                                String orderDate = rs.getString("order_date");
                                String totalAmount = rs.getString("total_amount");
                                String status = rs.getString("product_status");
                    %>
                    <tr class="hover:bg-soft-gray">
                        <td class="px-6 py-4">#<%= orderId %></td>
                        <td class="px-6 py-4"><%= userEmail %></td>
                        <td class="px-6 py-4"><%= orderDate %></td>
                        <td class="px-6 py-4"><%= totalAmount %></td>
                        <td class="px-6 py-4">
                            <% if ("Pending".equalsIgnoreCase(status)) { %>
                                <span class="px-2 py-1 text-sm rounded-full bg-yellow-100 text-yellow-800">Pending</span>
                            <% } else { %>
                                <span class="px-2 py-1 text-sm rounded-full bg-green-100 text-green-800">Approved</span>
                            <% } %>
                        </td>
                        <td class="px-6 py-4">
                            <button class="text-blue-600 hover:text-blue-800" 
                                    onclick="openStatusModal('<%= orderId %>', '<%= status %>')">
                                <i data-lucide="eye" class="h-5 w-5"></i>
                            </button>
                        </td>
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

<!-- Status Modal -->
<div id="statusModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
    <div class="bg-white p-6 rounded-lg shadow-lg w-96">
        <h3 class="text-xl mb-4">Update Order Status</h3>
        <form action="UpdateOrderStatusServlet" method="post">
            <!-- Hidden Order ID field -->
            <input type="hidden" name="orderId" id="modalOrderId">
            
            <label for="status" class="block mb-2">Status</label>
            <select name="status" id="modalStatus" class="form-select w-full mb-4">
                <option value="Pending">Pending</option>
                <option value="Approved">Approved</option>
            </select>

            <div class="flex justify-end">
                <button type="button" onclick="closeStatusModal()" class="mr-2 px-4 py-2 bg-gray-300 rounded">Cancel</button>
                <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded">Update</button>
            </div>
        </form>
    </div>
</div>

<script>
    lucide.createIcons();

    function openStatusModal(orderId, currentStatus) {
        document.getElementById("modalOrderId").value = orderId;
        document.getElementById("modalStatus").value = currentStatus;
        document.getElementById("statusModal").classList.remove("hidden");
        document.getElementById("statusModal").classList.add("flex");
    }

    function closeStatusModal() {
        document.getElementById("statusModal").classList.add("hidden");
        document.getElementById("statusModal").classList.remove("flex");
    }
</script>
