<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Furniture Haven - Modern & Elegant Furniture</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Favicon -->
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

        <!-- Swiper CSS -->
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css">

        <!-- Animate.css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/layout.css">
        <link rel="stylesheet" href="css/landing-page.css">
        <link href="css/bootstrap-custom.css" rel="stylesheet">
        <link href="css/pages.css" rel="stylesheet">

        <!-- Add navbar scroll behavior -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const navbar = document.querySelector('.navbar');

                // Handle navbar scroll state
                window.addEventListener('scroll', function () {
                    if (window.scrollY > 50) {
                        navbar.classList.add('scrolled');
                    } else {
                        navbar.classList.remove('scrolled');
                    }
                });

                // Handle mobile menu
                const navbarToggler = document.querySelector('.navbar-toggler');
                const navbarCollapse = document.querySelector('.navbar-collapse');

                if (navbarToggler && navbarCollapse) {
                    document.addEventListener('click', function (event) {
                        const isClickInside = navbarToggler.contains(event.target) || navbarCollapse.contains(event.target);

                        if (!isClickInside && navbarCollapse.classList.contains('show')) {
                            navbarCollapse.classList.remove('show');
                        }
                    });
                }

                // Handle active menu item
                const currentLocation = window.location.pathname;
                const navLinks = document.querySelectorAll('.nav-link');

                navLinks.forEach(link => {
                    if (link.getAttribute('href') === currentLocation) {
                        link.classList.add('active');
                    }
                });
            });
        </script>

        <!-- Custom Styles -->
        <style>
            /* Global Styles */
            body {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            main {
                flex: 1 0 auto;
            }

            /* Animation Classes */
            .fade-up {
                opacity: 0;
                transform: translateY(20px);
                transition: all 0.6s ease;
            }

            .fade-up.active {
                opacity: 1;
                transform: translateY(0);
            }

            /* Page Header */
            .page-header {
                position: relative;
                padding: 6rem 0;
                background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), var(--header-bg);
                background-size: cover;
                background-position: center;
                color: #fff;
            }

            .breadcrumb {
                background: transparent;
            }

            .breadcrumb-item a {
                color: var(--bs-primary);
                text-decoration: none;
            }

            .breadcrumb-item.active {
                color: #fff;
            }

            /* Section Spacing */
            .py-7 {
                padding-top: 5rem;
                padding-bottom: 5rem;
            }

            /* Section Headers */
            .section-header {
                text-align: center;
                margin-bottom: 4rem;
            }

            .subtitle {
                color: var(--bs-primary);
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-bottom: 1rem;
                display: block;
            }

            .section-title {
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 1rem;
            }

            .section-line {
                width: 80px;
                height: 3px;
                background: var(--bs-primary);
                margin: 1.5rem auto;
            }
            .navbar-brand{

            }
        </style>
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg custom-navbar fixed-top">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">
                    <svg width="180" height="40" viewBox="0 0 180 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20 8h-4c-3.3 0-6 2.7-6 6v12c0 3.3 2.7 6 6 6h4c3.3 0 6-2.7 6-6V14c0-3.3-2.7-6-6-6zm0 20h-4c-1.1 0-2-.9-2-2V14c0-1.1.9-2 2-2h4c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2z" fill="#E67E22"/>
                    <path d="M45 8L35 32h6l1.5-4h9L53 32h6L49 8h-4zm-1 16l3-8 3 8h-6z" fill="#FFFFFF"/>
                    <path d="M65 8v24h14v-4H71V22h6v-4h-6v-6h8V8H65z" fill="#FFFFFF"/>
                    <path d="M90 8v24h6V8h-6z" fill="#FFFFFF"/>
                    <path d="M110 8v24h14v-4h-8V8h-6z" fill="#FFFFFF"/>
                    <text x="130" y="28" fill="#FFFFFF" font-family="Inter" font-size="10" font-weight="500">HomeHaven</text>
                    </svg>
                    <!--<img src="images/homeHaven.png" alt="HomeHaven" height="90" width="60">-->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link ${pageContext.request.servletPath == '/index.jsp' ? 'active' : ''}" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="category.jsp" data-bs-toggle="mega-menu">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${pageContext.request.servletPath == '/about.jsp' ? 'active' : ''}" href="about.jsp">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${pageContext.request.servletPath == '/contact.jsp' ? 'active' : ''}" href="contact.jsp">Contact</a>
                        </li>
                    </ul>
<!--                    <div class="nav-icons">
                        <div class="search-bar d-none d-lg-block">
                            <input type="text" class="search-input" placeholder="Search products...">
                            <button class="search-btn">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>-->
                        <%
                            String userEmail = (String) session.getAttribute("userEmail");
                            if (userEmail != null) {
                        %>
                        <a href="profile.jsp" class="nav-icon-link" title="Login">
                            <i class="bi bi-person"></i>
                        </a>
                        <%
                        } else {
                        %>
                        <a href="login.jsp" class="nav-icon-link" title="Login">
                            <i class="bi bi-person"></i>
                        </a>
                        <%
                            }
                        %>
                        <a href="cart.jsp" class="nav-icon-link" title="Shopping Cart">
                            <i class="bi bi-cart"></i>
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Mobile Search (visible only on mobile) -->
        <div class="d-lg-none">
            <div class="container py-2">
                <div class="search-bar w-100">
                    <input type="text" class="search-input w-100" placeholder="Search products...">
                    <button class="search-btn">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Main Content Wrapper -->
        <main class="main-content">
            <!-- Content from other pages will be included here -->
        </main>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Swiper JS -->
        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

        <!-- Custom JavaScript -->
        <script src="js/landing-page.js"></script>
    </body>
</html>
