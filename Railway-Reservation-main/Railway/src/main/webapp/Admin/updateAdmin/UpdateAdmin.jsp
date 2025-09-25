<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Add new admin to Railway Reservation System">
    <title>Add Admin - Railway Reservation System</title>
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Railway Custom Theme -->
    <link href="../../css/railway-theme.css" rel="stylesheet">
</head>
<body class="bg-railway-light">
    <!-- Include unified header -->
    <jsp:include page="../../shared/header.jsp" />

    <div class="container-fluid">
        <div class="row">
            <!-- Include admin sidebar -->
            <div class="col-lg-3 p-0">
                <jsp:include page="../../shared/sidebar.jsp">
                    <jsp:param name="sidebarTitle" value="Admin Management" />
                </jsp:include>
            </div>
            
            <!-- Main Content -->
            <div class="col-lg-9">
                <div class="main-content p-4">
                    
                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb" class="mb-4">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="../admin.jsp" class="text-decoration-none">
                                    <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                                </a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/Curent_sv" class="text-decoration-none">Admin Management</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Add Admin</li>
                        </ol>
                    </nav>

                    <!-- Page Header -->
                    <div class="railway-card mb-4">
                        <div class="railway-card-header">
                            <h1 class="railway-card-title">
                                <i class="fas fa-user-plus me-2 text-railway-primary"></i>
                                Add New Administrator
                            </h1>
                        </div>
                        <p class="text-muted mb-0">
                            Create a new administrator account with system management privileges.
                        </p>
                    </div>

                    <!-- Security Notice -->
                    <div class="railway-alert railway-alert-warning mb-4">
                        <div class="d-flex align-items-start">
                            <i class="fas fa-shield-alt me-3 mt-1"></i>
                            <div>
                                <strong>Security Notice:</strong> Administrator accounts have full system access. 
                                Only create accounts for trusted personnel and ensure strong passwords are used.
                            </div>
                        </div>
                    </div>

                    <!-- Add Admin Form -->
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h5 mb-0">
                                        <i class="fas fa-user-shield me-2 text-railway-warning"></i>
                                        Administrator Details
                                    </h3>
                                </div>
                                
                                <form method="post" action="../../updateAdmins" id="addAdminForm" novalidate>
                                    <!-- Admin Name -->
                                    <div class="mb-4">
                                        <label for="adminName" class="railway-form-label required">
                                            <i class="fas fa-user me-2 text-railway-primary"></i>
                                            Administrator Name
                                        </label>
                                        <input type="text" 
                                               class="railway-form-control" 
                                               id="adminName" 
                                               name="name" 
                                               placeholder="Enter administrator username"
                                               required
                                               minlength="3"
                                               maxlength="50"
                                               autocomplete="username">
                                        <div class="invalid-feedback">
                                            Please enter a valid administrator name (3-50 characters).
                                        </div>
                                        <small class="form-text text-muted">
                                            This will be used as the login username for the administrator.
                                        </small>
                                    </div>

                                    <!-- Password -->
                                    <div class="mb-4">
                                        <label for="adminPassword" class="railway-form-label required">
                                            <i class="fas fa-key me-2 text-railway-primary"></i>
                                            Administrator Password
                                        </label>
                                        <div class="position-relative">
                                            <input type="password" 
                                                   class="railway-form-control" 
                                                   id="adminPassword" 
                                                   name="password" 
                                                   placeholder="Enter strong password"
                                                   required
                                                   minlength="6"
                                                   autocomplete="new-password">
                                            <button type="button" 
                                                    class="btn btn-link position-absolute end-0 top-50 translate-middle-y me-2"
                                                    id="togglePassword"
                                                    style="z-index: 10;">
                                                <i class="fas fa-eye text-muted"></i>
                                            </button>
                                        </div>
                                        <div class="invalid-feedback">
                                            Password must be at least 6 characters long.
                                        </div>
                                        
                                        <!-- Password Strength Indicator -->
                                        <div class="password-strength mt-2" id="passwordStrength">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <small class="text-muted">Password Strength:</small>
                                                <div class="strength-bars d-flex gap-1">
                                                    <div class="strength-bar"></div>
                                                    <div class="strength-bar"></div>
                                                    <div class="strength-bar"></div>
                                                    <div class="strength-bar"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Confirm Password -->
                                    <div class="mb-4">
                                        <label for="confirmPassword" class="railway-form-label required">
                                            <i class="fas fa-lock me-2 text-railway-primary"></i>
                                            Confirm Password
                                        </label>
                                        <div class="position-relative">
                                            <input type="password" 
                                                   class="railway-form-control" 
                                                   id="confirmPassword" 
                                                   name="repassword" 
                                                   placeholder="Re-enter password"
                                                   required
                                                   autocomplete="new-password">
                                            <button type="button" 
                                                    class="btn btn-link position-absolute end-0 top-50 translate-middle-y me-2"
                                                    id="toggleConfirmPassword"
                                                    style="z-index: 10;">
                                                <i class="fas fa-eye text-muted"></i>
                                            </button>
                                        </div>
                                        <div class="invalid-feedback">
                                            Passwords do not match.
                                        </div>
                                        <div class="password-match mt-2" id="passwordMatch"></div>
                                    </div>

                                    <!-- Admin Permissions Info -->
                                    <div class="permissions-info mb-4 p-3 bg-railway-light rounded">
                                        <h6 class="fw-bold text-railway-dark mb-3">
                                            <i class="fas fa-info-circle me-2"></i>
                                            Administrator Permissions
                                        </h6>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <ul class="list-unstyled">
                                                    <li class="mb-2">
                                                        <i class="fas fa-check text-railway-success me-2"></i>
                                                        Manage Users
                                                    </li>
                                                    <li class="mb-2">
                                                        <i class="fas fa-check text-railway-success me-2"></i>
                                                        Manage Admins
                                                    </li>
                                                    <li class="mb-2">
                                                        <i class="fas fa-check text-railway-success me-2"></i>
                                                        Train Management
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6">
                                                <ul class="list-unstyled">
                                                    <li class="mb-2">
                                                        <i class="fas fa-check text-railway-success me-2"></i>
                                                        Reservation Control
                                                    </li>
                                                    <li class="mb-2">
                                                        <i class="fas fa-check text-railway-success me-2"></i>
                                                        System Reports
                                                    </li>
                                                    <li class="mb-2">
                                                        <i class="fas fa-check text-railway-success me-2"></i>
                                                        Full System Access
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Form Actions -->
                                    <div class="d-flex justify-content-between align-items-center">
                                        <a href="/Curent_sv" class="railway-btn railway-btn-secondary">
                                            <i class="fas fa-arrow-left me-2"></i>Back to Admin List
                                        </a>
                                        
                                        <div class="form-actions">
                                            <button type="reset" class="railway-btn railway-btn-outline-primary me-2">
                                                <i class="fas fa-undo me-2"></i>Reset Form
                                            </button>
                                            <button type="submit" class="railway-btn railway-btn-primary" id="submitBtn">
                                                <i class="fas fa-user-plus me-2"></i>Create Administrator
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include unified footer -->
    <jsp:include page="../../shared/footer.jsp" />

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../js/railway-app.js"></script>

    <!-- Page-specific JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('addAdminForm');
            const passwordInput = document.getElementById('adminPassword');
            const confirmPasswordInput = document.getElementById('confirmPassword');
            const togglePassword = document.getElementById('togglePassword');
            const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
            const submitBtn = document.getElementById('submitBtn');
            const passwordStrength = document.getElementById('passwordStrength');
            const passwordMatch = document.getElementById('passwordMatch');
            
            // Password toggle functionality
            togglePassword.addEventListener('click', function() {
                togglePasswordVisibility(passwordInput, this);
            });
            
            toggleConfirmPassword.addEventListener('click', function() {
                togglePasswordVisibility(confirmPasswordInput, this);
            });
            
            function togglePasswordVisibility(input, button) {
                const type = input.type === 'password' ? 'text' : 'password';
                input.type = type;
                const icon = button.querySelector('i');
                icon.classList.toggle('fa-eye');
                icon.classList.toggle('fa-eye-slash');
            }
            
            // Password strength checker
            passwordInput.addEventListener('input', function() {
                const password = this.value;
                const strength = calculatePasswordStrength(password);
                updatePasswordStrengthDisplay(strength);
            });
            
            function calculatePasswordStrength(password) {
                let score = 0;
                if (password.length >= 8) score++;
                if (/[a-z]/.test(password)) score++;
                if (/[A-Z]/.test(password)) score++;
                if (/[0-9]/.test(password)) score++;
                if (/[^a-zA-Z0-9]/.test(password)) score++;
                return Math.min(score, 4);
            }
            
            function updatePasswordStrengthDisplay(strength) {
                const bars = passwordStrength.querySelectorAll('.strength-bar');
                const colors = ['#ef4444', '#f59e0b', '#eab308', '#22c55e'];
                const labels = ['Weak', 'Fair', 'Good', 'Strong'];
                
                bars.forEach((bar, index) => {
                    if (index < strength) {
                        bar.style.backgroundColor = colors[strength - 1];
                    } else {
                        bar.style.backgroundColor = '#e2e8f0';
                    }
                });
            }
            
            // Password match checker
            confirmPasswordInput.addEventListener('input', function() {
                const password = passwordInput.value;
                const confirmPassword = this.value;
                
                if (confirmPassword.length > 0) {
                    if (password === confirmPassword) {
                        passwordMatch.innerHTML = '<small class="text-railway-success"><i class="fas fa-check me-1"></i>Passwords match</small>';
                        this.classList.remove('is-invalid');
                        this.classList.add('is-valid');
                    } else {
                        passwordMatch.innerHTML = '<small class="text-railway-danger"><i class="fas fa-times me-1"></i>Passwords do not match</small>';
                        this.classList.remove('is-valid');
                        this.classList.add('is-invalid');
                    }
                } else {
                    passwordMatch.innerHTML = '';
                    this.classList.remove('is-valid', 'is-invalid');
                }
            });
            
            // Form validation and submission
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Get form data
                const formData = new FormData(this);
                const adminName = formData.get('name').trim();
                const password = formData.get('password');
                const confirmPassword = formData.get('repassword');
                
                // Reset validation states
                const inputs = this.querySelectorAll('.railway-form-control');
                inputs.forEach(input => {
                    input.classList.remove('is-invalid');
                });
                
                let isValid = true;
                
                // Validate admin name
                if (!adminName || adminName.length < 3) {
                    document.getElementById('adminName').classList.add('is-invalid');
                    isValid = false;
                }
                
                // Validate password
                if (!password || password.length < 6) {
                    passwordInput.classList.add('is-invalid');
                    isValid = false;
                }
                
                // Validate password match
                if (password !== confirmPassword) {
                    confirmPasswordInput.classList.add('is-invalid');
                    isValid = false;
                }
                
                if (!isValid) {
                    Railway.notifications.error('Please fix the validation errors before submitting.');
                    return;
                }
                
                // Show loading state
                const originalText = submitBtn.innerHTML;
                Railway.utils.showLoading(submitBtn, 'Creating Administrator...');
                
                // Submit form after delay (for UX)
                setTimeout(() => {
                    Railway.notifications.success('Creating administrator account...');
                    this.submit();
                }, 1000);
            });
            
            // Auto-focus admin name field
            document.getElementById('adminName').focus();
            
            // Show welcome message
            Railway.notifications.info('Fill out the form to create a new administrator account.', 3000);
        });
    </script>

    <!-- Additional Styles -->
    <style>
        .required::after {
            content: ' *';
            color: var(--railway-danger);
        }
        
        .strength-bar {
            width: 20px;
            height: 4px;
            background-color: #e2e8f0;
            border-radius: 2px;
        }
        
        .permissions-info {
            border: 2px solid rgba(30, 64, 175, 0.1);
        }
        
        .password-strength {
            font-size: 0.875rem;
        }
        
        .form-actions {
            display: flex;
            gap: 0.5rem;
        }
        
        @media (max-width: 768px) {
            .d-flex.justify-content-between {
                flex-direction: column;
                gap: 1rem;
            }
            
            .form-actions {
                width: 100%;
                justify-content: space-between;
            }
            
            .railway-btn {
                flex: 1;
            }
        }
        
        /* Animation for form validation */
        .is-invalid {
            animation: shake 0.5s ease-in-out;
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }
    </style>
</body>
</html>
