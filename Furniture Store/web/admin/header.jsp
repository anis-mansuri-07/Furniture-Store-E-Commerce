<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if admin is logged in
    String adminEmail = (String) session.getAttribute("adminEmail");
    String adminName = (String) session.getAttribute("adminName");
    String adminRole = (String) session.getAttribute("adminRole");
    
    if (adminEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Furniture Haven</title>
    
    <!-- Include Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Include Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
    
    <!-- Chart.js for analytics -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'wood': '#9B7E60',
                        'beige': '#F5F5DC',
                        'soft-gray': '#F8F9FA'
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-soft-gray">
    <!-- Sidebar -->
    <aside class="fixed left-0 top-0 h-screen w-64 bg-white shadow-lg transition-transform duration-300 ease-in-out">
        <div class="p-4 flex items-center justify-center">
            <svg width="180" height="40" viewBox="0 0 180 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M20 8h-4c-3.3 0-6 2.7-6 6v12c0 3.3 2.7 6 6 6h4c3.3 0 6-2.7 6-6V14c0-3.3-2.7-6-6-6zm0 20h-4c-1.1 0-2-.9-2-2V14c0-1.1.9-2 2-2h4c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2z" fill="#E67E22"/>
                <path d="M45 8L35 32h6l1.5-4h9L53 32h6L49 8h-4zm-1 16l3-8 3 8h-6z" fill="#E67E22"/>
                <path d="M65 8v24h14v-4H71V22h6v-4h-6v-6h8V8H65z" fill="#E67E22"/>
                <path d="M90 8v24h6V8h-6z" fill="#E67E22"/>
                <path d="M110 8v24h14v-4h-8V8h-6z" fill="#E67E22"/>
                <!-- <text x="130" y="28" fill="#E67E22" font-family="Inter" font-size="12" font-weight="500">FURNITURE</text> -->
            </svg>
        </div>
        
        <nav class="mt-8">
            <div class="px-6 py-4 border-b border-gray-200">
                <p class="text-sm text-gray-500">Welcome,</p>
                <p class="font-medium text-wood"><%= adminName %></p>
                <p class="text-sm text-gray-500"><%= adminRole %></p>
            </div>
            
            <a href="index.jsp" class="flex items-center px-6 py-3 text-gray-700 hover:bg-beige hover:text-wood">
                <i data-lucide="layout-dashboard" class="h-5 w-5 mr-3"></i>
                Dashboard
            </a>
            <a href="products.jsp" class="flex items-center px-6 py-3 text-gray-700 hover:bg-beige hover:text-wood">
                <i data-lucide="box" class="h-5 w-5 mr-3"></i>
                Products
            </a>
            <a href="categories.jsp" class="flex items-center px-6 py-3 text-gray-700 hover:bg-beige hover:text-wood">
                <i data-lucide="list" class="h-5 w-5 mr-3"></i>
                Categories
            </a>
            <a href="orders.jsp" class="flex items-center px-6 py-3 text-gray-700 hover:bg-beige hover:text-wood">
                <i data-lucide="shopping-cart" class="h-5 w-5 mr-3"></i>
                Orders
            </a>
            <a href="customers.jsp" class="flex items-center px-6 py-3 text-gray-700 hover:bg-beige hover:text-wood">
                <i data-lucide="users" class="h-5 w-5 mr-3"></i>
                Customers
            </a>
            <a href="inventory.jsp" class="flex items-center px-6 py-3 text-gray-700 hover:bg-beige hover:text-wood">
                <i data-lucide="package" class="h-5 w-5 mr-3"></i>
                Inventory
            </a>
            <a href="profile.jsp" class="flex items-center px-6 py-3 text-gray-700 hover:bg-beige hover:text-wood">
                <i data-lucide="user" class="h-5 w-5 mr-3"></i>
                Profile
            </a>
            <a href="../AdminLogoutServlet" class="flex items-center px-6 py-3 text-gray-700 hover:bg-beige hover:text-wood mt-auto">
                <i data-lucide="log-out" class="h-5 w-5 mr-3"></i>
                Logout
            </a>
        </nav>
    </aside>

    <!-- Main Content -->
    <div class="ml-64 min-h-screen">
        <!-- Top Navbar -->
        <nav class="bg-white shadow-sm p-4">
            <div class="flex items-center justify-between">
                <div class="flex items-center rounded-lg bg-soft-gray px-4 py-2 w-96">
                    <i data-lucide="search" class="h-5 w-5 text-gray-400"></i>
                    <input type="text" placeholder="Search..." class="ml-2 bg-transparent focus:outline-none w-full">
                </div>
                <!-- Add admin profile dropdown
                <div class="relative">
                    <button class="flex items-center space-x-2 text-gray-700 hover:text-wood focus:outline-none">
                        <span><%= adminName %></span>
                        <i data-lucide="chevron-down" class="h-4 w-4"></i>
                    </button>
                </div> -->
            </div>
        </nav>