<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Admin Login - Railway Reservation System Administration Panel">
    <title>Admin Login - Railway Reservation System</title>
    
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

    <!-- Main Admin Login Section -->
    <main class="main-content py-5">
        <div class="container">
            <div class="row justify-content-center align-items-center" style="min-height: calc(100vh - 200px);">
                <div class="col-lg-10 col-xl-8">
                    <div class="row railway-card p-0 overflow-hidden">
                        <!-- Left Side - Admin Login Form -->
                        <div class="col-lg-6 p-5">
                            <div class="login-form">
                                <!-- Admin Logo and Title -->
                                <div class="text-center mb-4">
                                    <div class="logo mb-3">
                                        <div class="admin-logo-wrapper">
                                            <i class="fas fa-shield-alt fa-3x text-railway-warning"></i>
                                            <i class="fas fa-user fa-lg position-absolute" style="top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
                                        </div>
                                    </div>
                                    <h2 class="h3 fw-bold text-railway-dark mb-2">Admin Access</h2>
                                    <p class="text-muted">Secure administrator login panel</p>
                                    
                                    <!-- Security Badge -->
                                    <div class="security-badge mb-3">
                                        <span class="badge bg-railway-warning text-dark">
                                            <i class="fas fa-lock me-1"></i>Restricted Access
                                        </span>
                                    </div>
                                </div>

                                <!-- Admin Login Form -->
                                <form method="post" action="../LOGINADMIN" id="adminLoginForm" novalidate>
                                    <!-- Admin Username Field -->
                                    <div class="mb-3">
                                        <label for="adminname" class="railway-form-label">
                                            <i class="fas fa-user-shield me-2 text-railway-warning"></i>Admin Username
                                        </label>
                                        <input type="text" 
                                               class="railway-form-control" 
                                               id="adminname" 
                                               name="adminname" 
                                               placeholder="Enter admin username"
                                               required
                                               autocomplete="username">
                                        <div class="invalid-feedback">
                                            Please enter your admin username.
                                        </div>
                                    </div>

                                    <!-- Admin Password Field -->
                                    <div class="mb-4">
                                        <label for="adminpassword" class="railway-form-label">
                                            <i class="fas fa-key me-2 text-railway-warning"></i>Admin Password
                                        </label>
                                        <div class="position-relative">
                                            <input type="password" 
                                                   class="railway-form-control" 
                                                   id="adminpassword" 
                                                   name="adminpassword" 
                                                   placeholder="Enter admin password"
                                                   required
                                                   autocomplete="current-password">
                                            <button type="button" 
                                                    class="btn btn-link position-absolute end-0 top-50 translate-middle-y me-2"
                                                    id="toggleAdminPassword"
                                                    style="z-index: 10;">
                                                <i class="fas fa-eye text-muted"></i>
                                            </button>
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter your admin password.
                                        </div>
                                    </div>

                                    <!-- Security Notice -->
                                    <div class="alert alert-warning border-0 mb-4" role="alert">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-exclamation-triangle me-2"></i>
                                            <small>This is a secure area. All login attempts are monitored.</small>
                                        </div>
                                    </div>

                                    <!-- Submit Button -->
                                    <button type="submit" 
                                            class="railway-btn railway-btn-warning w-100 mb-3 text-dark fw-semibold"
                                            id="adminLoginBtn">
                                        <i class="fas fa-sign-in-alt me-2"></i>Admin Sign In
                                    </button>
                                </form>

                                <!-- Divider -->
                                <div class="divider my-4">
                                    <div class="divider-text">
                                        <span class="bg-white px-3 text-muted">Need regular access?</span>
                                    </div>
                                </div>

                                <!-- User Login Links -->
                                <div class="text-center">
                                    <a href="../SignUp/login.jsp" class="railway-btn railway-btn-outline-primary me-2">
                                        <i class="fas fa-user me-2"></i>User Login
                                    </a>
                                    <a href="../Home/home.jsp" class="railway-btn railway-btn-secondary">
                                        <i class="fas fa-home me-2"></i>Homepage
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Right Side - Admin Features -->
                        <div class="col-lg-6 d-flex align-items-center justify-content-center position-relative overflow-hidden"
                             style="background: linear-gradient(135deg, var(--railway-warning) 0%, #f59e0b 100%);">
                            <div class="text-center text-dark p-4">
                                <div class="hero-image mb-4">
                                    <i class="fas fa-cogs fa-5x mb-4" style="opacity: 0.9;"></i>
                                </div>
                                <h3 class="h4 mb-3 fw-bold">Admin Dashboard</h3>
                                <p class="mb-4" style="opacity: 0.9;">
                                    Manage users, trains, reservations and system settings 
                                    with our comprehensive admin control panel.
                                </p>
                                
                                <!-- Admin Features List -->
                                <div class="features-list text-start">
                                    <div class="feature-item mb-2">
                                        <i class="fas fa-users me-2"></i>
                                        User Management
                                    </div>
                                    <div class="feature-item mb-2">
                                        <i class="fas fa-train me-2"></i>
                                        Train Management
                                    </div>
                                    <div class="feature-item mb-2">
                                        <i class="fas fa-ticket-alt me-2"></i>
                                        Reservation Control
                                    </div>
                                    <div class="feature-item mb-2">
                                        <i class="fas fa-chart-line me-2"></i>
                                        Analytics & Reports
                                    </div>
                                    <div class="feature-item">
                                        <i class="fas fa-shield-alt me-2"></i>
                                        System Security
                                    </div>
                                </div>
                            </div>

                            <!-- Background Pattern -->
                            <div class="position-absolute top-0 start-0 w-100 h-100" 
                                 style="background: url('data:image/svg+xml,<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 100\"><polygon points=\"50,25 25,75 75,75\" fill=\"%23000000\" opacity=\"0.05\"/></svg>') repeat;
                                        background-size: 80px 80px; z-index: -1;"></div>
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
            const adminLoginForm = document.getElementById('adminLoginForm');
            const adminLoginBtn = document.getElementById('adminLoginBtn');
            const togglePassword = document.getElementById('toggleAdminPassword');
            const passwordInput = document.getElementById('adminpassword');
            
            // Password toggle functionality
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.type === 'password' ? 'text' : 'password';
                passwordInput.type = type;
                const icon = this.querySelector('i');
                icon.classList.toggle('fa-eye');
                icon.classList.toggle('fa-eye-slash');
            });
            
            // Form validation and submission
            adminLoginForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Get form data
                const formData = new FormData(this);
                const adminname = formData.get('adminname').trim();
                const adminpassword = formData.get('adminpassword').trim();
                
                // Basic validation
                let isValid = true;
                
                if (!adminname) {
                    document.getElementById('adminname').classList.add('is-invalid');
                    isValid = false;
                } else {
                    document.getElementById('adminname').classList.remove('is-invalid');
                }
                
                if (!adminpassword) {
                    document.getElementById('adminpassword').classList.add('is-invalid');
                    isValid = false;
                } else {
                    document.getElementById('adminpassword').classList.remove('is-invalid');
                }
                
                if (!isValid) {
                    Railway.notifications.error('Please fill in all required fields.');
                    return;
                }
                
                // Show loading state
                const originalText = adminLoginBtn.innerHTML;
                Railway.utils.showLoading(adminLoginBtn);
                
                // Submit form
                setTimeout(() => {
                    this.submit();
                }, 1000);
            });
            
            // Auto-focus admin username field
            document.getElementById('adminname').focus();
            
            // Admin warning message
            Railway.notifications.warning('Admin area - Authorized personnel only.', 4000);
        });
    </script>

    <!-- Additional Styles -->
    <style>
        .admin-logo-wrapper {
            position: relative;
            display: inline-block;
        }
        
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
        
        .security-badge .badge {
            border: 2px solid rgba(245, 158, 11, 0.3);
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
        
        /* Animation for the admin hero section */
        .hero-image i {
            animation: pulse 2s ease-in-out infinite;
        }
        
        @keyframes pulse {
            0%, 100% { opacity: 0.9; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.05); }
        }
        
        /* Admin-specific styling */
        .railway-btn-warning:hover {
            background-color: #d97706;
            border-color: #d97706;
            color: white;
        }
        
        .alert-warning {
            background-color: rgba(245, 158, 11, 0.1);
            border-left: 4px solid var(--railway-warning);
        }
    </style>
</body>
</html>