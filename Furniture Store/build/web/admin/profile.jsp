<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

        <!-- Profile Content -->
        <div class="p-6">
            <div class="max-w-4xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                    <!-- Profile Header -->
                    <div class="bg-wood text-white p-6">
                        <div class="flex items-center space-x-4">
                            <img src="https://ui-avatars.com/api/?name=<%= adminName %>&background=9B7E60&color=fff" 
                                 alt="<%= adminName %>" 
                                 class="h-24 w-24 rounded-full border-4 border-white">
                            <div>
                                <h1 class="text-2xl font-semibold"><%= adminName %></h1>
                            </div>
                        </div>
                    </div>

                    <!-- Profile Form -->
                    <div class="p-6">
                        <form action="../UpdateProfileServlet" method="POST" class="space-y-6" id="profileForm">
                            <input type="hidden" name="adminId" value="${sessionScope.adminId}">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">First Name</label>
                                    <input type="text" 
                                           name="firstName" 
                                           value="<%= adminName %>" 
                                           class="w-full px-4 py-2 border rounded-lg focus:ring-wood focus:border-wood">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                                    <input type="email" 
                                           name="email" 
                                           value="<%= adminEmail %>" 
                                           class="w-full px-4 py-2 border rounded-lg focus:ring-wood focus:border-wood"
                                           readonly>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>