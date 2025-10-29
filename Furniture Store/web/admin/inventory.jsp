<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

        <!-- Inventory Content -->
        <div class="p-6">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-800">Inventory Management</h2>
                <div class="flex space-x-4">
                    <button class="bg-wood text-white px-4 py-2 rounded-lg hover:opacity-90">
                        <i data-lucide="refresh-cw" class="h-5 w-5 inline-block mr-2"></i>Update Stock
                    </button>
                </div>
            </div>

            <!-- Stock Alerts -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                <div class="bg-red-50 rounded-lg p-4 border border-red-200">
                    <div class="flex items-center">
                        <i data-lucide="alert-circle" class="h-8 w-8 text-red-500 mr-3"></i>
                        <div>
                            <h3 class="font-semibold text-red-700">Low Stock Items</h3>
                            <p class="text-red-600">5 items below threshold</p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-yellow-50 rounded-lg p-4 border border-yellow-200">
                    <div class="flex items-center">
                        <i data-lucide="alert-triangle" class="h-8 w-8 text-yellow-500 mr-3"></i>
                        <div>
                            <h3 class="font-semibold text-yellow-700">Pending Orders</h3>
                            <p class="text-yellow-600">8 orders need stock</p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-green-50 rounded-lg p-4 border border-green-200">
                    <div class="flex items-center">
                        <i data-lucide="check-circle" class="h-8 w-8 text-green-500 mr-3"></i>
                        <div>
                            <h3 class="font-semibold text-green-700">In Stock</h3>
                            <p class="text-green-600">45 items available</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Inventory Table -->
            <div class="bg-white rounded-lg shadow">
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-soft-gray">
                            <tr>
                                <th class="px-6 py-3 text-left">Product</th>
                                <th class="px-6 py-3 text-left">SKU</th>
                                <th class="px-6 py-3 text-left">In Stock</th>
                                <th class="px-6 py-3 text-left">Reserved</th>
                                <th class="px-6 py-3 text-left">Status</th>
                                <th class="px-6 py-3 text-left">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200">
                            <tr class="hover:bg-soft-gray">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <img src="images/products/sofa-1.jpg" alt="Product" class="h-12 w-12 rounded object-cover">
                                        <div class="ml-3">Modern Sofa</div>
                                    </div>
                                </td>
                                <td class="px-6 py-4">MS-001</td>
                                <td class="px-6 py-4">15</td>
                                <td class="px-6 py-4">3</td>
                                <td class="px-6 py-4">
                                    <span class="px-2 py-1 text-sm rounded-full bg-green-100 text-green-800">In Stock</span>
                                </td>
                                <td class="px-6 py-4">
                                    <button class="text-blue-600 hover:text-blue-800">
                                        <i data-lucide="edit" class="h-5 w-5"></i>
                                    </button>
                                </td>
                            </tr>
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