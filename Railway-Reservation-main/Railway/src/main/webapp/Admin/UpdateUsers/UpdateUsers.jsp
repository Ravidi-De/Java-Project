<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Add new user to Railway Reservation System">
    <title>Add New User - Railway Reservation System</title>
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Railway Custom Theme -->
    <link href="/Railway/css/railway-theme.css" rel="stylesheet">
</head>
<body class="bg-railway-light">
    <!-- Include unified header -->
    <jsp:include page="/shared/header.jsp" />

    <div class="container-fluid">
        <div class="row">
            <!-- Include user sidebar -->
            <div class="col-lg-3 p-0">
                <jsp:include page="/shared/sidebar.jsp">
                    <jsp:param name="sidebarTitle" value="User Management" />
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
                                <a href="/Railway/Curent_servlet" class="text-decoration-none">User Management</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Add User</li>
                        </ol>
                    </nav>

                    <!-- Page Header -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h1 class="railway-page-title">
                                <i class="fas fa-user-plus me-2 text-railway-primary"></i>
                                Add New User
                            </h1>
                            <p class="text-muted mb-0">
                                Create a new user account for the Railway Reservation System. Fill out all required fields below.
                            </p>
                        </div>
                        
                        <div class="page-actions">
                            <a href="/Railway/Curent_servlet" class="railway-btn railway-btn-secondary">
                                <i class="fas fa-arrow-left me-2"></i>Back to Users
                            </a>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Add User Form -->
                        <div class="col-lg-8">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h5 mb-0">
                                        <i class="fas fa-user-edit me-2 text-railway-primary"></i>
                                        User Information
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <form action="/Railway/AddUser_servlet" method="post" id="addUserForm">

                                        <!-- Full Name Field -->
                                        <div class="mb-4">
                                            <label for="userName" class="form-label fw-bold text-railway-dark">
                                                <i class="fas fa-user me-2 text-railway-primary"></i>
                                                Full Name <span class="text-railway-danger">*</span>
                                            </label>
                                            <input type="text" 
                                                   class="form-control railway-input" 
                                                   id="userName" 
                                                   name="name" 
                                                   placeholder="Enter user's full name" 
                                                   required
                                                   maxlength="100"
                                                   pattern="[A-Za-z\s]+"
                                                   title="Name should contain only letters and spaces">
                                            <div class="form-text">
                                                <i class="fas fa-info-circle me-1"></i>
                                                Enter the user's complete name as it should appear in the system.
                                            </div>
                                        </div>

                                        <!-- Password Field -->
                                        <div class="mb-4">
                                            <label for="userPassword" class="form-label fw-bold text-railway-dark">
                                                <i class="fas fa-key me-2 text-railway-primary"></i>
                                                Password <span class="text-railway-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <input type="password" 
                                                       class="form-control railway-input" 
                                                       id="userPassword" 
                                                       name="password" 
                                                       placeholder="Create secure password" 
                                                       required
                                                       minlength="6"
                                                       maxlength="100">
                                                <button class="btn btn-outline-secondary" 
                                                        type="button" 
                                                        id="togglePassword"
                                                        title="Toggle password visibility"
                                                        data-bs-toggle="tooltip">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                            <div class="form-text">
                                                <i class="fas fa-shield-alt me-1"></i>
                                                Password must be at least 6 characters long.
                                            </div>
                                        </div>

                                        <!-- Confirm Password Field -->
                                        <div class="mb-4">
                                            <label for="confirmPassword" class="form-label fw-bold text-railway-dark">
                                                <i class="fas fa-lock me-2 text-railway-primary"></i>
                                                Confirm Password <span class="text-railway-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <input type="password" 
                                                       class="form-control railway-input" 
                                                       id="confirmPassword" 
                                                       name="repassword" 
                                                       placeholder="Confirm your password" 
                                                       required
                                                       minlength="6"
                                                       maxlength="100">
                                                <button class="btn btn-outline-secondary" 
                                                        type="button" 
                                                        id="toggleConfirmPassword"
                                                        title="Toggle password visibility"
                                                        data-bs-toggle="tooltip">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                            <div class="form-text" id="passwordMatch">
                                                <i class="fas fa-info-circle me-1"></i>
                                                Please confirm your password by typing it again.
                                            </div>
                                        </div>

                                        <!-- Email Field -->
                                        <div class="mb-4">
                                            <label for="userEmail" class="form-label fw-bold text-railway-dark">
                                                <i class="fas fa-envelope me-2 text-railway-primary"></i>
                                                Email Address <span class="text-railway-danger">*</span>
                                            </label>
                                            <input type="email" 
                                                   class="form-control railway-input" 
                                                   id="userEmail" 
                                                   name="email" 
                                                   placeholder="Enter valid email address" 
                                                   required
                                                   maxlength="255">
                                            <div class="form-text">
                                                <i class="fas fa-info-circle me-1"></i>
                                                This will be used for account notifications and password recovery.
                                            </div>
                                        </div>

                                        <!-- Phone Number Field -->
                                        <div class="mb-4">
                                            <label for="userPhone" class="form-label fw-bold text-railway-dark">
                                                <i class="fas fa-phone me-2 text-railway-primary"></i>
                                                Phone Number <span class="text-railway-danger">*</span>
                                            </label>
                                            <input type="tel" 
                                                   class="form-control railway-input" 
                                                   id="userPhone" 
                                                   name="phone" 
                                                   placeholder="Enter 10-digit phone number" 
                                                   required
                                                   pattern="[0-9]{10}"
                                                   title="Please enter a 10-digit phone number"
                                                   maxlength="10">
                                            <div class="form-text">
                                                <i class="fas fa-info-circle me-1"></i>
                                                Enter a 10-digit phone number for contact purposes.
                                            </div>
                                        </div>

                                        <!-- Action Buttons -->
                                        <div class="d-flex justify-content-between align-items-center mt-5">
                                            <a href="/Railway/Curent_servlet" class="railway-btn railway-btn-secondary">
                                                <i class="fas fa-times me-2"></i>Cancel
                                            </a>
                                            <div>
                                                <button type="reset" class="railway-btn railway-btn-outline-warning me-3" id="clearForm">
                                                    <i class="fas fa-eraser me-2"></i>Clear Form
                                                </button>
                                                <button type="submit" class="railway-btn railway-btn-primary" id="submitBtn">
                                                    <i class="fas fa-user-plus me-2"></i>Add User
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Help & Guidelines Panel -->
                        <div class="col-lg-4">
                            <!-- Guidelines Card -->
                            <div class="railway-card mb-4">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-lightbulb me-2 text-railway-warning"></i>
                                        User Creation Guidelines
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="guideline-list">
                                        <div class="guideline-item mb-3">
                                            <i class="fas fa-check-circle text-railway-success me-2"></i>
                                            <div>
                                                <strong>Name:</strong>
                                                <small class="d-block text-muted">Only letters and spaces allowed</small>
                                            </div>
                                        </div>
                                        <div class="guideline-item mb-3">
                                            <i class="fas fa-check-circle text-railway-success me-2"></i>
                                            <div>
                                                <strong>Password:</strong>
                                                <small class="d-block text-muted">Minimum 6 characters, must match confirmation</small>
                                            </div>
                                        </div>
                                        <div class="guideline-item mb-3">
                                            <i class="fas fa-check-circle text-railway-success me-2"></i>
                                            <div>
                                                <strong>Email:</strong>
                                                <small class="d-block text-muted">Valid email format required</small>
                                            </div>
                                        </div>
                                        <div class="guideline-item">
                                            <i class="fas fa-check-circle text-railway-success me-2"></i>
                                            <div>
                                                <strong>Phone:</strong>
                                                <small class="d-block text-muted">Exactly 10 digits</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Quick Tips Card -->
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-tips me-2 text-railway-info"></i>
                                        Quick Tips
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="alert alert-info border-0" role="alert">
                                        <i class="fas fa-info-circle me-2"></i>
                                        <strong>Pro Tip:</strong> Make sure passwords are strong and email addresses are valid for the best security.
                                    </div>
                                    
                                    <div class="tip-item mb-3">
                                        <i class="fas fa-user-shield text-railway-primary me-2"></i>
                                        <small>Users will need their credentials to log in</small>
                                    </div>
                                    
                                    <div class="tip-item mb-3">
                                        <i class="fas fa-envelope text-railway-success me-2"></i>
                                        <small>Email will be used for system notifications</small>
                                    </div>
                                    
                                    <div class="tip-item">
                                        <i class="fas fa-mobile-alt text-railway-warning me-2"></i>
                                        <small>Phone number may be used for booking confirmations</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include unified footer -->
    <jsp:include page="/shared/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize tooltips
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });

            // Form elements
            const form = document.getElementById('addUserForm');
            const togglePassword = document.getElementById('togglePassword');
            const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
            const passwordInput = document.getElementById('userPassword');
            const confirmPasswordInput = document.getElementById('confirmPassword');
            const submitBtn = document.getElementById('submitBtn');
            const clearFormBtn = document.getElementById('clearForm');
            const passwordMatchDiv = document.getElementById('passwordMatch');

            // Password visibility toggles
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                
                const icon = this.querySelector('i');
                icon.classList.toggle('fa-eye');
                icon.classList.toggle('fa-eye-slash');
            });

            toggleConfirmPassword.addEventListener('click', function() {
                const type = confirmPasswordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                confirmPasswordInput.setAttribute('type', type);
                
                const icon = this.querySelector('i');
                icon.classList.toggle('fa-eye');
                icon.classList.toggle('fa-eye-slash');
            });

            // Password matching validation
            function checkPasswordMatch() {
                const password = passwordInput.value;
                const confirmPassword = confirmPasswordInput.value;
                
                if (confirmPassword.length > 0) {
                    if (password === confirmPassword) {
                        confirmPasswordInput.classList.remove('is-invalid');
                        confirmPasswordInput.classList.add('is-valid');
                        passwordMatchDiv.innerHTML = '<i class="fas fa-check-circle text-railway-success me-1"></i>Passwords match!';
                        passwordMatchDiv.className = 'form-text text-railway-success';
                        return true;
                    } else {
                        confirmPasswordInput.classList.remove('is-valid');
                        confirmPasswordInput.classList.add('is-invalid');
                        passwordMatchDiv.innerHTML = '<i class="fas fa-times-circle text-railway-danger me-1"></i>Passwords do not match!';
                        passwordMatchDiv.className = 'form-text text-railway-danger';
                        return false;
                    }
                } else {
                    confirmPasswordInput.classList.remove('is-valid', 'is-invalid');
                    passwordMatchDiv.innerHTML = '<i class="fas fa-info-circle me-1"></i>Please confirm your password by typing it again.';
                    passwordMatchDiv.className = 'form-text';
                    return false;
                }
            }

            passwordInput.addEventListener('input', checkPasswordMatch);
            confirmPasswordInput.addEventListener('input', checkPasswordMatch);

            // Phone number formatting
            const phoneInput = document.getElementById('userPhone');
            phoneInput.addEventListener('input', function(e) {
                // Remove non-numeric characters
                this.value = this.value.replace(/\D/g, '');
                
                // Limit to 10 digits
                if (this.value.length > 10) {
                    this.value = this.value.slice(0, 10);
                }
            });

            // Name validation
            const nameInput = document.getElementById('userName');
            nameInput.addEventListener('input', function() {
                // Remove numbers and special characters
                this.value = this.value.replace(/[^A-Za-z\s]/g, '');
                
                // Capitalize first letter of each word
                this.value = this.value.replace(/\b\w/g, function(l) {
                    return l.toUpperCase();
                });
            });

            // Form submission
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Check password match before submission
                if (!checkPasswordMatch()) {
                    alert('Please make sure passwords match before submitting.');
                    return false;
                }

                // Show loading state
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Creating User...';
                submitBtn.disabled = true;

                // Validate all fields
                if (this.checkValidity()) {
                    // Show confirmation
                    if (confirm('Are you sure you want to create this user account?')) {
                        // Submit the form
                        this.submit();
                    } else {
                        // Reset button state
                        submitBtn.innerHTML = '<i class="fas fa-user-plus me-2"></i>Add User';
                        submitBtn.disabled = false;
                    }
                } else {
                    // Reset button state
                    submitBtn.innerHTML = '<i class="fas fa-user-plus me-2"></i>Add User';
                    submitBtn.disabled = false;
                    
                    // Show validation errors
                    this.reportValidity();
                }
            });

            // Clear form confirmation
            clearFormBtn.addEventListener('click', function(e) {
                if (form.querySelector('input[value!=""]')) {
                    if (!confirm('Are you sure you want to clear all form data?')) {
                        e.preventDefault();
                    } else {
                        // Reset password match validation
                        passwordMatchDiv.innerHTML = '<i class="fas fa-info-circle me-1"></i>Please confirm your password by typing it again.';
                        passwordMatchDiv.className = 'form-text';
                        confirmPasswordInput.classList.remove('is-valid', 'is-invalid');
                    }
                }
            });

            // Real-time validation feedback
            const inputs = form.querySelectorAll('input[required]');
            inputs.forEach(input => {
                input.addEventListener('blur', function() {
                    if (this.checkValidity()) {
                        this.classList.remove('is-invalid');
                        this.classList.add('is-valid');
                    } else {
                        this.classList.remove('is-valid');
                        this.classList.add('is-invalid');
                    }
                });

                input.addEventListener('input', function() {
                    if (this.classList.contains('is-invalid') && this.checkValidity()) {
                        this.classList.remove('is-invalid');
                        this.classList.add('is-valid');
                    }
                });
            });
        });
    </script>
</body>
</html>