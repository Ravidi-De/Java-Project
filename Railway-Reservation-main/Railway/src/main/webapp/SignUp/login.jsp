<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Login to Railway Reservation System - Book your train tickets easily">
    <title>Login - Railway Reservation System</title>
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Railway Custom Theme -->
    <link href="../css/railway-theme.css" rel="stylesheet">
</head>
<body class="bg-railway-light">
    <!-- Include unified header -->
    <jsp:include page="../shared/header.jsp" />

    <!-- Main Login Section -->
    <main class="main-content py-5">
        <div class="container">
            <div class="row justify-content-center align-items-center" style="min-height: calc(100vh - 200px);">
                <div class="col-lg-10 col-xl-8">
                    <div class="row railway-card p-0 overflow-hidden">
                        <!-- Left Side - Login Form -->
                        <div class="col-lg-6 p-5">
                            <div class="login-form">
                                <!-- Logo and Title -->
                                <div class="text-center mb-4">
                                    <div class="logo mb-3">
                                        <i class="fas fa-train fa-3x text-railway-primary"></i>
                                    </div>
                                    <h2 class="h3 fw-bold text-railway-dark mb-2">Welcome Back</h2>
                                    <p class="text-muted">Sign in to your account to continue</p>
                                </div>

                                <!-- Login Form -->
                                <form method="post" action="../LoginServlet" id="loginForm" novalidate>
                                    <!-- Username Field -->
                                    <div class="mb-3">
                                        <label for="username" class="railway-form-label">
                                            <i class="fas fa-user me-2 text-railway-primary"></i>Username
                                        </label>
                                        <input type="text" 
                                               class="railway-form-control" 
                                               id="username" 
                                               name="username" 
                                               placeholder="Enter your username"
                                               required
                                               autocomplete="username">
                                        <div class="invalid-feedback">
                                            Please enter your username.
                                        </div>
                                    </div>

                                    <!-- Password Field -->
                                    <div class="mb-4">
                                        <label for="password" class="railway-form-label">
                                            <i class="fas fa-lock me-2 text-railway-primary"></i>Password
                                        </label>
                                        <div class="position-relative">
                                            <input type="password" 
                                                   class="railway-form-control" 
                                                   id="password" 
                                                   name="password" 
                                                   placeholder="Enter your password"
                                                   required
                                                   autocomplete="current-password">
                                            <button type="button" 
                                                    class="btn btn-link position-absolute end-0 top-50 translate-middle-y me-2"
                                                    id="togglePassword"
                                                    style="z-index: 10;">
                                                <i class="fas fa-eye text-muted"></i>
                                            </button>
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter your password.
                                        </div>
                                    </div>

                                    <!-- Remember Me & Forgot Password -->
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="rememberMe">
                                                <label class="form-check-label" for="rememberMe">
                                                    Remember me
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col text-end">
                                            <a href="#" class="text-decoration-none text-railway-primary">
                                                Forgot password?
                                            </a>
                                        </div>
                                    </div>

                                    <!-- Submit Button -->
                                    <button type="submit" 
                                            class="railway-btn railway-btn-primary w-100 mb-3"
                                            id="loginBtn">
                                        <i class="fas fa-sign-in-alt me-2"></i>Sign In
                                    </button>
                                </form>

                                <!-- Divider -->
                                <div class="divider my-4">
                                    <div class="divider-text">
                                        <span class="bg-white px-3 text-muted">New to Railway System?</span>
                                    </div>
                                </div>

                                <!-- Register Links -->
                                <div class="text-center">
                                    <a href="registration.jsp" class="railway-btn railway-btn-outline-primary me-2">
                                        <i class="fas fa-user-plus me-2"></i>Create Account
                                    </a>
                                    <a href="../Admin/AdminLogin.jsp" class="railway-btn railway-btn-secondary">
                                        <i class="fas fa-user-shield me-2"></i>Admin Login
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Right Side - Image and Info -->
                        <div class="col-lg-6 bg-railway-primary d-flex align-items-center justify-content-center position-relative overflow-hidden">
                            <div class="text-center text-white p-4">
                                <div class="hero-image mb-4">
                                    <i class="fas fa-train fa-5x mb-4" style="opacity: 0.9;"></i>
                                </div>
                                <h3 class="h4 mb-3">Start Your Journey</h3>
                                <p class="mb-4 opacity-90">
                                    Book train tickets, manage reservations, and enjoy seamless travel 
                                    with our modern railway reservation system.
                                </p>
                                
                                <!-- Features List -->
                                <div class="features-list text-start">
                                    <div class="feature-item mb-2">
                                        <i class="fas fa-check-circle me-2"></i>
                                        Easy online booking
                                    </div>
                                    <div class="feature-item mb-2">
                                        <i class="fas fa-check-circle me-2"></i>
                                        Real-time seat availability
                                    </div>
                                    <div class="feature-item mb-2">
                                        <i class="fas fa-check-circle me-2"></i>
                                        Secure payment gateway
                                    </div>
                                    <div class="feature-item">
                                        <i class="fas fa-check-circle me-2"></i>
                                        24/7 customer support
                                    </div>
                                </div>
                            </div>

                            <!-- Background Pattern -->
                            <div class="position-absolute top-0 start-0 w-100 h-100" 
                                 style="background: linear-gradient(135deg, 
                                        rgba(30, 64, 175, 0.9) 0%, 
                                        rgba(14, 165, 233, 0.8) 100%), 
                                        url('data:image/svg+xml,<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 100\"><circle cx=\"50\" cy=\"50\" r=\"2\" fill=\"%23ffffff\" opacity=\"0.1\"/></svg>') repeat;
                                        background-size: 50px 50px; z-index: -1;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Include unified footer -->
    <jsp:include page="../shared/footer.jsp" />

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/railway-app.js"></script>

    <!-- Page-specific JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const loginForm = document.getElementById('loginForm');
            const loginBtn = document.getElementById('loginBtn');
            const togglePassword = document.getElementById('togglePassword');
            const passwordInput = document.getElementById('password');
            
            // Password toggle functionality
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.type === 'password' ? 'text' : 'password';
                passwordInput.type = type;
                const icon = this.querySelector('i');
                icon.classList.toggle('fa-eye');
                icon.classList.toggle('fa-eye-slash');
            });
            
            // Form validation and submission
            loginForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Get form data
                const formData = new FormData(this);
                const username = formData.get('username').trim();
                const password = formData.get('password').trim();
                
                // Basic validation
                let isValid = true;
                
                if (!username) {
                    document.getElementById('username').classList.add('is-invalid');
                    isValid = false;
                } else {
                    document.getElementById('username').classList.remove('is-invalid');
                }
                
                if (!password) {
                    document.getElementById('password').classList.add('is-invalid');
                    isValid = false;
                } else {
                    document.getElementById('password').classList.remove('is-invalid');
                }
                
                if (!isValid) {
                    Railway.notifications.error('Please fill in all required fields.');
                    return;
                }
                
                // Show loading state
                const originalText = loginBtn.innerHTML;
                Railway.utils.showLoading(loginBtn);
                
                // Submit form
                setTimeout(() => {
                    this.submit();
                }, 1000);
            });
            
            // Auto-focus username field
            document.getElementById('username').focus();
            
            // Welcome message
            Railway.notifications.info('Welcome! Please sign in to continue.', 3000);
        });
    </script>

    <!-- Additional Styles -->
    <style>
        .divider {
            position: relative;
            text-align: center;
        }
        
        .divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background: #e2e8f0;
        }
        
        .divider-text {
            position: relative;
            z-index: 1;
        }
        
        .feature-item {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
        }
        
        .login-form {
            max-width: 400px;
            margin: 0 auto;
        }
        
        /* Responsive adjustments */
        @media (max-width: 991.98px) {
            .row.railway-card .col-lg-6:last-child {
                display: none;
            }
            
            .main-content {
                padding-top: 2rem !important;
                padding-bottom: 2rem !important;
            }
        }
        
        /* Animation for the hero section */
        .hero-image i {
            animation: float 3s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
    </style>
</body>
</html>