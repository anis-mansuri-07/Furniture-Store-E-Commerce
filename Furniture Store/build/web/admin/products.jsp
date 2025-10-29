<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<!-- Products Content -->
<div class="p-6">
    <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-semibold text-gray-800">Products Management</h2>
        <button onclick="showAddModal()" class="bg-wood text-white px-4 py-2 rounded-lg hover:opacity-90">
            <i data-lucide="plus" class="h-5 w-5 inline-block mr-2"></i>Add New Product
        </button>
    </div>

    <!-- Products Table -->
    <div class="bg-white rounded-lg shadow">
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-soft-gray">
                    <tr>
                        <th class="px-6 py-3 text-left">#</th>
                        <th class="px-6 py-3 text-left">Image</th>
                        <th class="px-6 py-3 text-left">Name</th>
                        <th class="px-6 py-3 text-left">Category</th>
                        <th class="px-6 py-3 text-left">Price</th>
                        <th class="px-6 py-3 text-left">Stock</th>
                        <th class="px-6 py-3 text-left">Description</th>
                        <th class="px-6 py-3 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%                                try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
                            PreparedStatement ps = conn.prepareStatement("SELECT * FROM products");
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()) {
                    %>
                    <!-- Sample product row -->
                    <tr class="hover:bg-soft-gray">
                        <td class="px-6 py-4"><%= rs.getInt("id")%></td>
                        <td class="px-6 py-4">
                            <div class="flex items-center">
                                <img src="image/<%= rs.getString("image_url")%>" class="h-12 w-12 rounded object-cover">
                            </div>
                        </td>
                        <td class="px-6 py-4"><%= rs.getString("name")%></td>
                        <td class="px-6 py-4"><%= rs.getString("category")%></td>
                        <td class="px-6 py-4">Rs.<%= rs.getString("price")%></td>
                        <td class="px-6 py-4"><%= rs.getString("stock")%></td>
                        <td class="px-6 py-4"><%= rs.getString("description")%></td>
                        <!-- Update the edit button in the table -->
                        <td class="px-6 py-4">
                            <button 
                                onclick="showEditModal('<%= rs.getInt("id")%>',
                                                    '<%= rs.getString("name").replace("'", "\\'")%>',
                                                    '<%= rs.getString("category")%>',
                                                    '<%= rs.getString("price")%>',
                                                    '<%= rs.getString("stock")%>',
                                                    '<%= rs.getString("description").replace("'", "\\'")%>')" 
                                class="text-blue-600 hover:text-blue-800 mr-3">
                                <i data-lucide="edit" class="h-5 w-5"></i>
                            </button>

                            <!-- Add this in the head section after other scripts -->
                            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                            <!-- Update the delete button in the table -->
                            <button class="text-red-600 hover:text-red-800 delete-btn" data-id="<%= rs.getInt("id")%>">
                                <i data-lucide="trash" class="h-5 w-5"></i>
                            </button>

<!-- <a href="deleteProduct?id=<%= rs.getInt("id")%>" onclick="confirmDelete(event, this);" 
    class="text-red-600 hover:text-red-800">
     <i data-lucide="trash" class="h-5 w-5"></i>
 </a> -->



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
    <!-- Add Product Modal -->
    <div id="addProductModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden overflow-y-auto h-full w-full">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3">
                <h3 class="text-lg font-medium text-gray-900 mb-4">Add New Product</h3>
                <form action="addProduct" method="POST" enctype="multipart/form-data">
                    <div class="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Product Name</label>
                            <input type="text" name="productName" required
                                   class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700">Category</label>
                            <select name="category" required
                                    class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
                                <option value="">Select Category</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
                                        Statement stmt = con.createStatement();
                                        ResultSet rs = stmt.executeQuery("SELECT * FROM categories");
                                        while (rs.next()) {
                                %>
                                <option value="<%= rs.getString("name")%>"><%= rs.getString("name")%></option>
                                <%
                                        }
                                        con.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700">Price</label>
                            <input type="number" name="price" step="0.01" required
                                   class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700">Stock</label>
                            <input type="number" name="stock" required
                                   class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700">Product Image</label>
                            <input type="file" name="image" accept="image/*" required
                                   class="mt-1 block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-wood file:text-white hover:file:bg-wood/80">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700">Description</label>
                            <textarea name="description" rows="3"
                                      class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50"></textarea>
                        </div>
                    </div>

                    <div class="mt-5 flex justify-end space-x-3">
                        <button type="button" onclick="hideAddModal()"
                                class="px-4 py-2 bg-gray-100 text-gray-700 rounded-md hover:bg-gray-200">Cancel</button>
                        <button type="submit"
                                class="px-4 py-2 bg-wood text-white rounded-md hover:opacity-90">Add Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Product Modal -->
    <div id="editProductModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden overflow-y-auto h-full w-full">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3">
                <h3 class="text-lg font-medium text-gray-900 mb-4">Edit Product</h3>
                <form action="EditProductServlet" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="productId" id="editProductId">
                    <div class="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Product Name</label>
                            <input type="text" name="productName" id="editProductName" required
                                   class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
                        </div>

                        <!-- Same fields as Add form but with id attributes -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Category</label>
                            <select name="category" required
                                    class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
                                <option value="">Select Category</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
                                        Statement stmt = con.createStatement();
                                        ResultSet rs = stmt.executeQuery("SELECT * FROM categories");
                                        while (rs.next()) {
                                %>
                                <option value="<%= rs.getString("name")%>"><%= rs.getString("name")%></option>
                                <%
                                        }
                                        con.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700">Price</label>
                            <input type="number" name="price" step="0.01" required
                                   class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700">Stock</label>
                            <input type="number" name="stock" required
                                   class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700">Product Image</label>
                            <input type="file" name="image" accept="image/*" required
                                   class="mt-1 block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-wood file:text-white hover:file:bg-wood/80">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700">Description</label>
                            <textarea name="description" rows="3"
                                      class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50"></textarea>
                        </div>
                    </div>

                    <div class="mt-5 flex justify-end space-x-3">
                        <button type="button" onclick="hideEditModal()"
                                class="px-4 py-2 bg-gray-100 text-gray-700 rounded-md hover:bg-gray-200">Cancel</button>
                        <button type="submit"
                                class="px-4 py-2 bg-wood text-white rounded-md hover:opacity-90">Update Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
                                lucide.createIcons();

                                // Enhanced Modal Functions
                                function showAddModal() {
                                    document.getElementById('addProductModal').classList.remove('hidden');
                                }

                                function hideAddModal() {
                                    document.getElementById('addProductModal').classList.add('hidden');
                                }

                                function showEditModal(productId, name, category, price, stock, description) {
                                    const modal = document.getElementById('editProductModal');
                                    // Populate the form fields
                                    document.getElementById('editProductId').value = productId;
                                    document.getElementById('editProductName').value = name;

                                    // Select the correct category option
                                    const categorySelect = modal.querySelector('select[name="category"]');
                                    categorySelect.value = category;

                                    // Set other field values
                                    modal.querySelector('input[name="price"]').value = price;
                                    modal.querySelector('input[name="stock"]').value = stock;
                                    modal.querySelector('textarea[name="description"]').value = description;

                                    // Show the modal
                                    modal.classList.remove('hidden');
                                }

                                function hideEditModal() {
                                    document.getElementById('editProductModal').classList.add('hidden');
                                }

                                // Close modals when clicking outside
                                window.onclick = function (event) {
                                    const addModal = document.getElementById('addProductModal');
                                    const editModal = document.getElementById('editProductModal');
                                    if (event.target === addModal) {
                                        hideAddModal();
                                    }
                                    if (event.target === editModal) {
                                        hideEditModal();
                                    }
                                }

                                document.querySelectorAll(".delete-btn").forEach(function (button) {
                                    button.addEventListener("click", function () {
                                        const Id = this.getAttribute("data-id");

                                        Swal.fire({
                                            title: 'Are you sure?',
                                            text: "You won't be able to revert this!",
                                            icon: 'warning',
                                            showCancelButton: true,
                                            confirmButtonColor: '#9B7E60',
                                            cancelButtonColor: '#d33',
                                            confirmButtonText: 'Yes, delete it!'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                window.location.href = "deleteProduct?id=" + Id;
                                            }
                                        });
                                    });
                                });
                                // Add this to your script section
                                // Update the form submission event listener
                                document.querySelector('form[action="addProduct"]').addEventListener('submit', function (e) {
                                    e.preventDefault();

                                    const formData = new FormData(this);

                                    fetch('addProduct', {
                                        method: 'POST',
                                        body: formData
                                    })
                                            .then(response => response.json())
                                            .then(data => {
                                                if (data.success) {
                                                    Swal.fire({
                                                        title: 'Success!',
                                                        text: data.message,
                                                        icon: 'success',
                                                        confirmButtonColor: '#9B7E60',
                                                        timer: 1500,
                                                        showConfirmButton: false
                                                    }).then(() => {
                                                        hideAddModal();
                                                        window.location.reload();
                                                    });
                                                } else {
                                                    Swal.fire({
                                                        title: 'Error!',
                                                        text: data.message || 'Failed to add product',
                                                        icon: 'error',
                                                        confirmButtonColor: '#9B7E60'
                                                    });
                                                }
                                            })
                                            .catch(error => {
                                                console.error('Error:', error);
                                                Swal.fire({
                                                    title: 'Error!',
                                                    text: 'Something went wrong. Please try again.',
                                                    icon: 'error',
                                                    confirmButtonColor: '#9B7E60'
                                                });
                                            });
                                });
                                // Add this to your script section
                                document.querySelector('form[action="updateProduct"]').addEventListener('submit', function (e) {
                                    e.preventDefault();

                                    const formData = new FormData(this);

                                    fetch(this.action, {
                                        method: 'POST',
                                        body: formData
                                    })
                                            .then(response => response.json())
                                            .then(data => {
                                                if (data.success) {
                                                    Swal.fire({
                                                        title: 'Success!',
                                                        text: data.message,
                                                        icon: 'success',
                                                        confirmButtonColor: '#9B7E60'
                                                    }).then(() => {
                                                        window.location.reload();
                                                    });
                                                } else {
                                                    Swal.fire({
                                                        title: 'Error!',
                                                        text: data.message,
                                                        icon: 'error',
                                                        confirmButtonColor: '#9B7E60'
                                                    });
                                                }
                                            })
                                            .catch(error => {
                                                Swal.fire({
                                                    title: 'Error!',
                                                    text: 'Something went wrong. Please try again.',
                                                    icon: 'error',
                                                    confirmButtonColor: '#9B7E60'
                                                });
                                            });
                                });
</script>
</body>
</html>


