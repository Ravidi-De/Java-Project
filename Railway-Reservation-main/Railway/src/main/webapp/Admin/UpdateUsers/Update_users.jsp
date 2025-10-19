<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userId = request.getParameter("id");
    String uname = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Update user information in Railway Reservation System">
    <title>Update User - Railway Reservation System</title>
    
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
                            <li class="breadcrumb-item active" aria-current="page">Update User</li>
                        </ol>
                    </nav>

                    <!-- Page Header -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h1 class="railway-page-title">
                                <i class="fas fa-user-edit me-2 text-railway-primary"></i>
                                Update User Information
                            </h1>
                            <p class="text-muted mb-0">
                                Modify user account details for <strong><%= uname != null ? uname : "Unknown User" %></strong>.
                            </p>
                        </div>
                        
                        <div class="page-actions">
                            <a href="/Railway/Curent_servlet" class="railway-btn railway-btn-secondary">
                                <i class="fas fa-arrow-left me-2"></i>Back to Users
                            </a>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Update User Form -->
                        <div class="col-lg-8">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h5 mb-0">
                                        <i class="fas fa-user-cog me-2 text-railway-primary"></i>
                                        Edit User Details
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <form action="/Railway/Update_suv" method="get" id="updateUserForm">
                                        
                                        <!-- User ID Field (Read-only) -->
                                        <div class="mb-4">
                                            <label for="userId" class="form-label fw-bold text-railway-dark">
                                                <i class="fas fa-hashtag me-2 text-railway-primary"></i>
                                                User ID
                                            </label>
                                            <input type="text" 
                                                   class="form-control railway-input" 
                                                   id="userId" 
                                                   name="id" 
                                                   value="<%= userId != null ? userId : "" %>"
                                                   readonly
                                                   style="background-color: #f8f9fa;">
                                            <div class="form-text">
                                                <i class="fas fa-lock me-1"></i>
                                                User ID cannot be changed after creation.
                                            </div>
                                        </div>

                                        <!-- Full Name Field -->
                                        <div class="mb-4">
                                            <label for="userName" class="form-label fw-bold text-railway-dark">
                                                <i class="fas fa-user me-2 text-railway-primary"></i>
                                                Full Name <span class="text-railway-danger">*</span>
                                            </label>
                                            <input type="text" 
                                                   class="form-control railway-input" 
                                                   id="userName" 
                                                   name="username" 
                                                   value="<%= uname != null ? uname : "" %>" 
                                                   placeholder="Enter user's full name" 
                                                   required
                                                   maxlength="100"
                                                   pattern="[A-Za-z\s]+"
                                                   title="Name should contain only letters and spaces">
                                            <div class="form-text">
                                                <i class="fas fa-info-circle me-1"></i>
                                                Update the user's complete name as it should appear in the system.
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
                                                       name="pass" 
                                                       value="<%= password != null ? password : "" %>" 
                                                       placeholder="Enter new password" 
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
                                                   value="<%= phone != null ? phone : "" %>" 
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

                                        <!-- Email Field -->
                                        <div class="mb-4">
                                            <label for="userEmail" class="form-label fw-bold text-railway-dark">
                                                <i class="fas fa-envelope me-2 text-railway-primary"></i>
                                                Email Address <span class="text-railway-danger">*</span>
                                            </label>
                                            <input type="email" 
                                                   class="form-control railway-input" 
                                                   id="userEmail" 
                                                   name="mail" 
                                                   value="<%= email != null ? email : "" %>" 
                                                   placeholder="Enter valid email address" 
                                                   required
                                                   maxlength="255">
                                            <div class="form-text">
                                                <i class="fas fa-info-circle me-1"></i>
                                                This will be used for account notifications and password recovery.
                                            </div>
                                        </div>

                                        <!-- Action Buttons -->
                                        <div class="d-flex justify-content-between align-items-center mt-5">
                                            <a href="/Railway/Curent_servlet" class="railway-btn railway-btn-secondary">
                                                <i class="fas fa-times me-2"></i>Cancel
                                            </a>
                                            <div>
                                                <button type="reset" class="railway-btn railway-btn-outline-warning me-3" id="resetForm">
                                                    <i class="fas fa-undo me-2"></i>Reset Changes
                                                </button>
                                                <button type="submit" class="railway-btn railway-btn-primary" id="submitBtn">
                                                    <i class="fas fa-save me-2"></i>Update User
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Current Information & Help Panel -->
                        <div class="col-lg-4">
                            <!-- Current Information Card -->
                            <div class="railway-card mb-4">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-info-circle me-2 text-railway-info"></i>
                                        Current Information
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="current-info">
                                        <div class="info-item mb-3">
                                            <small class="text-muted d-block">User ID</small>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-hashtag text-railway-primary me-2"></i>
                                                <span class="fw-bold"><%= userId != null ? userId : "N/A" %></span>
                                            </div>
                                        </div>
                                        <div class="info-item mb-3">
                                            <small class="text-muted d-block">Current Name</small>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-user text-railway-success me-2"></i>
                                                <span class="fw-bold"><%= uname != null ? uname : "N/A" %></span>
                                            </div>
                                        </div>
                                        <div class="info-item mb-3">
                                            <small class="text-muted d-block">Current Email</small>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-envelope text-railway-info me-2"></i>
                                                <span class="fw-bold text-break"><%= email != null ? email : "N/A" %></span>
                                            </div>
                                        </div>
                                        <div class="info-item">
                                            <small class="text-muted d-block">Current Phone</small>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-phone text-railway-warning me-2"></i>
                                                <span class="fw-bold"><%= phone != null ? phone : "N/A" %></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Update Guidelines Card -->
                            <div class="railway-card mb-4">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-lightbulb me-2 text-railway-warning"></i>
                                        Update Guidelines
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
                                                <small class="d-block text-muted">Minimum 6 characters for security</small>
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

                            <!-- Quick Actions Card -->
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-bolt me-2 text-railway-primary"></i>
                                        Quick Actions
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="alert alert-warning border-0" role="alert">
                                        <i class="fas fa-exclamation-triangle me-2"></i>
                                        <strong>Important:</strong> Changes will take effect immediately after saving.
                                    </div>
                                    
                                    <div class="d-grid gap-2">
                                        <a href="/Railway/Curent_servlet" class="railway-btn railway-btn-outline-primary btn-sm">
                                            <i class="fas fa-list me-2"></i>View All Users
                                        </a>
                                        <a href="/Railway/Admin/UpdateUsers/UpdateUsers.jsp" class="railway-btn railway-btn-outline-success btn-sm">
                                            <i class="fas fa-user-plus me-2"></i>Add New User
                                        </a>
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
            const form = document.getElementById('updateUserForm');
            const togglePassword = document.getElementById('togglePassword');
            const passwordInput = document.getElementById('userPassword');
            const submitBtn = document.getElementById('submitBtn');
            const resetFormBtn = document.getElementById('resetForm');

            // Store original values
            const originalValues = {
                username: '<%= uname != null ? uname : "" %>',
                password: '<%= password != null ? password : "" %>',
                phone: '<%= phone != null ? phone : "" %>',
                email: '<%= email != null ? email : "" %>'
            };

            // Password visibility toggle
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                
                const icon = this.querySelector('i');
                icon.classList.toggle('fa-eye');
                icon.classList.toggle('fa-eye-slash');
            });

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
                
                // Show loading state
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Updating User...';
                submitBtn.disabled = true;

                // Validate all fields
                if (this.checkValidity()) {
                    // Check if any changes were made
                    const currentValues = {
                        username: document.getElementById('userName').value,
                        password: document.getElementById('userPassword').value,
                        phone: document.getElementById('userPhone').value,
                        email: document.getElementById('userEmail').value
                    };

                    let hasChanges = false;
                    for (let key in originalValues) {
                        if (originalValues[key] !== currentValues[key]) {
                            hasChanges = true;
                            break;
                        }
                    }

                    if (!hasChanges) {
                        alert('No changes were made to update.');
                        submitBtn.innerHTML = '<i class="fas fa-save me-2"></i>Update User';
                        submitBtn.disabled = false;
                        return;
                    }

                    // Show confirmation
                    if (confirm('Are you sure you want to update this user information?')) {
                        // Submit the form
                        this.submit();
                    } else {
                        // Reset button state
                        submitBtn.innerHTML = '<i class="fas fa-save me-2"></i>Update User';
                        submitBtn.disabled = false;
                    }
                } else {
                    // Reset button state
                    submitBtn.innerHTML = '<i class="fas fa-save me-2"></i>Update User';
                    submitBtn.disabled = false;
                    
                    // Show validation errors
                    this.reportValidity();
                }
            });

            // Reset form to original values
            resetFormBtn.addEventListener('click', function(e) {
                e.preventDefault();
                
                if (confirm('Are you sure you want to reset all changes to original values?')) {
                    document.getElementById('userName').value = originalValues.username;
                    document.getElementById('userPassword').value = originalValues.password;
                    document.getElementById('userPhone').value = originalValues.phone;
                    document.getElementById('userEmail').value = originalValues.email;
                    
                    // Remove validation classes
                    const inputs = form.querySelectorAll('input');
                    inputs.forEach(input => {
                        input.classList.remove('is-valid', 'is-invalid');
                    });
                }
            });

            // Real-time validation feedback
            const inputs = form.querySelectorAll('input[required]:not([readonly])');
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