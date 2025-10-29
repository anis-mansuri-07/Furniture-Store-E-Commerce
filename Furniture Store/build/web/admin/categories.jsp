<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

        <!-- Categories Content -->
        <div class="p-6">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-800">Categories Management</h2>
                <button onclick="showAddModal()" class="bg-wood text-white px-4 py-2 rounded-lg hover:opacity-90">
                    <i data-lucide="plus" class="h-5 w-5 inline-block mr-2"></i>Add Category
                </button>
            </div>

            <!-- Categories Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <!-- Category Card -->
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniturestore", "root", "mysql");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM categories");

                    while (rs.next()) {
                %>
                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex justify-between items-start">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-800"><%= rs.getString("name") %></h3>
                            <p class="text-gray-600 mt-1"><%= rs.getString("description") %></p>
                        </div>
                        <div class="flex space-x-2">
                            <button 
                                onclick="showEditModal('<%= rs.getInt("id") %>', '<%= rs.getString("name").replace("'", "\\'") %>', '<%= rs.getString("description").replace("'", "\\'") %>')" 
                                class="text-blue-600 hover:text-blue-800">
                                <i data-lucide="edit" class="h-5 w-5"></i>
                            </button>


                            <button class="text-red-600 hover:text-red-800 delete-btn" data-id="<%= rs.getInt("id") %>">
                                <i data-lucide="trash" class="h-5 w-5"></i>
                            </button>
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

            <!-- Add Category Modal -->
            <div id="addCategoryModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden overflow-y-auto h-full w-full">
                <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
                    <div class="mt-3">
                        <h3 class="text-lg font-medium text-gray-900 mb-4">Add New Category</h3>
                        <form action="../AddCategoryServlet" method="POST">
                            <div class="space-y-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700">Category Name</label>
                                    <input type="text" name="categoryName" required
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
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
                                        class="px-4 py-2 bg-wood text-white rounded-md hover:opacity-90">Add Category</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit Category Modal -->
            <div id="editCategoryModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden overflow-y-auto h-full w-full">
                <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
                    <div class="mt-3">
                        <h3 class="text-lg font-medium text-gray-900 mb-4">Edit Category</h3>
                        <form action="updateCategory" method="POST">
                            <input type="hidden" name="categoryId" id="editCategoryId">
                            <div class="space-y-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700">Category Name</label>
                                    <input type="text" name="categoryName" id="editCategoryName" required
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50">
                                </div>
                                
                                <div>
                                    <label class="block text-sm font-medium text-gray-700">Description</label>
                                    <textarea name="description" id="editCategoryDescription" rows="3"
                                              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-wood focus:ring focus:ring-wood focus:ring-opacity-50"></textarea>
                                </div>
                            </div>

                            <div class="mt-5 flex justify-end space-x-3">
                                <button type="button" onclick="hideEditModal()"
                                        class="px-4 py-2 bg-gray-100 text-gray-700 rounded-md hover:bg-gray-200">Cancel</button>
                                <button type="submit"
                                        class="px-4 py-2 bg-wood text-white rounded-md hover:opacity-90">Update Category</button>
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

        // Modal Functions
        function showAddModal() {
            document.getElementById('addCategoryModal').classList.remove('hidden');
        }

        function hideAddModal() {
            document.getElementById('addCategoryModal').classList.add('hidden');
        }

        function showEditModal(categoryId, name, description) {
            const modal = document.getElementById('editCategoryModal');
            
            // Populate the form fields
            document.getElementById('editCategoryId').value = categoryId;
            document.getElementById('editCategoryName').value = name;
            document.getElementById('editCategoryDescription').value = description;
            
            // Show the modal
            modal.classList.remove('hidden');
        }

        function hideEditModal() {
            document.getElementById('editCategoryModal').classList.add('hidden');
        }

        document.querySelectorAll(".delete-btn").forEach(function(button) {
        button.addEventListener("click", function() {
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
                    window.location.href = "deleteCategory?id=" + Id;
                }
            });
        });
    });

        // Close modals when clicking outside
        window.onclick = function(event) {
            const addModal = document.getElementById('addCategoryModal');
            const editModal = document.getElementById('editCategoryModal');
            if (event.target === addModal) {
                hideAddModal();
            }
            if (event.target === editModal) {
                hideEditModal();
            }
        }
    </script>
</body>
</html>