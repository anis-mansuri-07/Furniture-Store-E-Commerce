<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Furniture Haven</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>

<!-- Loading Animation -->
<div class="loading-overlay">
    <div class="loading-spinner"></div>
    <div class="loading-text">FURNITURE HAVEN</div>
</div>

<!-- Login Section -->
<section class="login-section py-7">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="login-card bg-white rounded-5 shadow-lg p-5">
                    <div class="text-center mb-5">
                        <span class="subtitle text-primary text-uppercase">Welcome Back</span>
                        <h2 class="section-title">Sign In to Your Account</h2>
                        <div class="section-line"></div>
                    </div>
                    
                    <!-- Login Form -->
                    <form action="LoginServlet" method="post" id="loginForm">
                        <div class="mb-4">
                            <label for="email" class="form-label">Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-0">
                                    <i class="bi bi-envelope"></i>
                                </span>
                                <input type="email" class="form-control form-control-lg border-0 bg-light" 
                                    id="email" name="email" placeholder="Enter your email" required>
                            </div>
                        </div>
                        
                        <div class="mb-4">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <label for="password" class="form-label mb-0">Password</label>
                                <a href="forgot-password.jsp" class="text-primary text-decoration-none small">Forgot Password?</a>
                            </div>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-0">
                                    <i class="bi bi-lock"></i>
                                </span>
                                <input type="password" class="form-control form-control-lg border-0 bg-light" 
                                    id="password" name="password" placeholder="Enter your password" required>
                                <button class="input-group-text bg-light border-0 toggle-password" type="button">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                        
                        <div class="mb-4 form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                        
                        <div class="d-grid mb-4">
                            <button type="submit" class="btn btn-primary btn-lg rounded-pill">
                                Sign In <i class="bi bi-arrow-right ms-2"></i>
                            </button>
                        </div>
                        
                        <div class="text-center">
                            <p class="mb-0">Don't have an account? <a href="register.jsp" class="text-primary">Sign Up</a></p>
                        </div>
                    </form>
                    
                    <!-- Removed social login section -->
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Login Styles -->
<style>
    .login-section {
        min-height: 100vh;
        display: flex;
        align-items: center;
        background-color: var(--light-bg);
        padding-top: 100px;
        padding-bottom: 100px;
    }
    
    .login-card {
        transition: all 0.3s ease;
    }
    
    .login-card:hover {
        transform: translateY(-5px);
    }
    
    .form-control:focus {
        box-shadow: none;
        border-color: var(--primary-color);
    }
    
    .divider {
        display: flex;
        align-items: center;
        text-align: center;
        color: #6c757d;
    }
    
    .divider::before,
    .divider::after {
        content: '';
        flex: 1;
        border-bottom: 1px solid #dee2e6;
    }
    
    .divider span {
        padding: 0 1rem;
    }
    
    .toggle-password {
        cursor: pointer;
    }
    
    .social-login .btn {
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
    }
    
    .social-login .btn:hover {
        transform: translateY(-2px);
    }
    
    @media (max-width: 768px) {
        .login-card {
            padding: 2rem !important;
        }
    }
</style>

<!-- Login Scripts -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Loading Animation
        window.addEventListener('load', function() {
            const loadingOverlay = document.querySelector('.loading-overlay');
            if (loadingOverlay) {
                setTimeout(() => {
                    loadingOverlay.style.opacity = '0';
                    setTimeout(() => {
                        loadingOverlay.style.display = 'none';
                    }, 500);
                }, 1000);
            }
        });
        
        // Toggle Password Visibility
        const togglePassword = document.querySelector('.toggle-password');
        const passwordInput = document.querySelector('#password');
        
        if (togglePassword && passwordInput) {
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                
                // Toggle eye icon
                const eyeIcon = this.querySelector('i');
                eyeIcon.classList.toggle('bi-eye');
                eyeIcon.classList.toggle('bi-eye-slash');
            });
        }
        
        // Form Validation
        const loginForm = document.getElementById('loginForm');
        
        if (loginForm) {
            loginForm.addEventListener('submit', function(event) {
                event.preventDefault();
                
                const email = document.getElementById('email').value;
                const password = document.getElementById('password').value;
                
                // Simple validation
                if (!email || !password) {
                    showNotification('Please fill in all fields', 'error');
                    return;
                }
                
                // Email validation
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    showNotification('Please enter a valid email address', 'error');
                    return;
                }
                
                // If validation passes, submit the form
                this.submit();
            });
        }
        
        // Notification function
        function showNotification(message, type = 'success') {
            const notification = document.createElement('div');
            notification.className = `notification ${type}`;
            notification.textContent = message;
            document.body.appendChild(notification);
            
            setTimeout(() => {
                notification.classList.add('show');
                setTimeout(() => {
                    notification.classList.remove('show');
                    setTimeout(() => {
                        notification.remove();
                    }, 300);
                }, 3000);
            }, 100);
        }
    });
</script>

<!-- Additional Notification Styles -->
<style>
    .notification {
        position: fixed;
        bottom: 20px;
        right: 20px;
        padding: 15px 25px;
        border-radius: 5px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.2);
        transform: translateY(100px);
        opacity: 0;
        transition: all 0.3s ease;
        z-index: 9999;
        color: white;
    }
    
    .notification.success {
        background-color: var(--primary-color);
    }
    
    .notification.error {
        background-color: #dc3545;
    }
    
    .notification.show {
        transform: translateY(0);
        opacity: 1;
    }
</style>

<%--<%@ include file="footer.jsp" %>--%>