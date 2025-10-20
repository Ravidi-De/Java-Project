<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<%
    String adminId = request.getParameter("adi");
    String uname = request.getParameter("aname");
    String password = request.getParameter("apss");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Update administrator details in Railway Reservation System">
    <title>Update Administrator - Railway Reservation System</title>
    
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
            <!-- Include admin sidebar -->
            <div class="col-lg-3 p-0">
                <jsp:include page="/shared/sidebar.jsp">
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
                            <li class="breadcrumb-item active" aria-current="page">Update Administrator</li>
                        </ol>
                    </nav>

                    <!-- Page Header -->
                    <div class="railway-card mb-4">
                        <div class="railway-card-header">
                            <h1 class="railway-card-title">
                                <i class="fas fa-user-edit me-2 text-railway-primary"></i>
                                Update Administrator Details
                            </h1>
                        </div>
                        <p class="text-muted mb-0">
                            Modify administrator information and credentials. All changes will be applied immediately.
                        </p>
                    </div>

                    <!-- Security Notice -->
                    <div class="railway-alert railway-alert-info mb-4">
                        <div class="d-flex align-items-start">
                            <i class="fas fa-info-circle me-3 mt-1"></i>
                            <div>
                                <strong>Update Policy:</strong> Changes to administrator credentials require immediate re-authentication. 
                                The administrator will need to log in again after password changes.
                            </div>
                        </div>
                    </div>

                    <!-- Current Admin Info Card -->
                    <div class="railway-card mb-4">
                        <div class="railway-card-header">
                            <h3 class="h6 mb-0">
                                <i class="fas fa-user-circle me-2 text-railway-info"></i>
                                Current Administrator Information
                            </h3>
                        </div>
                        <div class="railway-card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="info-group mb-3">
                                        <label class="text-muted small">Administrator ID</label>
                                        <div class="fw-bold text-railway-primary">#<%= adminId %></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info-group mb-3">
                                        <label class="text-muted small">Current Username</label>
                                        <div class="fw-bold text-railway-dark"><%= uname %></div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <div class="admin-avatar me-3">
                                    <div class="avatar-circle bg-railway-primary text-white">
                                        <%= uname.substring(0,1).toUpperCase() %>
                                    </div>
                                </div>
                                <div>
                                    <div class="fw-bold">System Administrator</div>
                                    <small class="text-muted">Super Admin Privileges</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Update Admin Form -->
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h5 mb-0">
                                        <i class="fas fa-edit me-2 text-railway-warning"></i>
                                        Update Administrator Details
                                    </h3>
                                </div>
                                
                                <form method="get" action="../../Update_admin_data_sev" id="updateAdminForm" novalidate>
                                    
                                    <!-- Admin ID (Hidden) -->
                                    <input type="hidden" name="Id" value="<%= adminId %>">
                                    
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
                                               value="<%= uname %>"
                                               placeholder="Enter administrator username"
                                               required
                                               minlength="3"
                                               maxlength="50"
                                               autocomplete="username">
                                        <div class="invalid-feedback">
                                            Please enter a valid administrator name (3-50 characters).
                                        </div>
                                        <small class="form-text text-muted">
                                            This will be the new login username for the administrator.
                                        </small>
                                    </div>

                                    <!-- Current Password Display -->
                                    <div class="mb-4">
                                        <label class="railway-form-label">
                                            <i class="fas fa-lock me-2 text-railway-secondary"></i>
                                            Current Password
                                        </label>
                                        <div class="current-password-display p-3 bg-railway-light rounded">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span class="password-hidden font-monospace">••••••••</span>
                                                <button type="button" 
                                                        class="btn btn-link btn-sm p-0 toggle-current-password"
                                                        data-password="<%= password %>">
                                                    <i class="fas fa-eye text-muted"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <small class="form-text text-muted">
                                            Current password is shown for reference. You can change it below.
                                        </small>
                                    </div>

                                    <!-- New Password -->
                                    <div class="mb-4">
                                        <label for="adminPassword" class="railway-form-label required">
                                            <i class="fas fa-key me-2 text-railway-primary"></i>
                                            Administrator Password
                                        </label>
                                        <div class="position-relative">
                                            <input type="text" 
                                                   class="railway-form-control" 
                                                   id="adminPassword" 
                                                   name="password" 
                                                   value="<%= password %>"
                                                   placeholder="Enter administrator password"
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

                                    <!-- Change Summary -->
                                    <div class="change-summary p-3 bg-railway-light rounded mb-4">
                                        <h6 class="fw-bold text-railway-dark mb-3">
                                            <i class="fas fa-clipboard-list me-2"></i>
                                            Update Summary
                                        </h6>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <small class="text-muted d-block">Changes to Username</small>
                                                <div id="usernameChange" class="fw-bold">No changes</div>
                                            </div>
                                            <div class="col-md-6">
                                                <small class="text-muted d-block">Password Status</small>
                                                <div id="passwordChange" class="fw-bold">No changes</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Form Actions -->
                                    <div class="d-flex justify-content-between align-items-center">
                                        <a href="/Railway/Curent_sv" class="railway-btn railway-btn-secondary">
                                            <i class="fas fa-arrow-left me-2"></i>Back to Admin List
                                        </a>
                                        
                                        <div class="form-actions">
                                            <button type="button" class="railway-btn railway-btn-outline-primary me-2" id="resetBtn">
                                                <i class="fas fa-undo me-2"></i>Reset Changes
                                            </button>
                                            <button type="submit" class="railway-btn railway-btn-warning" id="submitBtn">
                                                <i class="fas fa-save me-2"></i>Update Administrator
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Important Notes -->
                    <div class="row mt-4">
                        <div class="col-lg-12">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-exclamation-triangle me-2 text-railway-warning"></i>
                                        Important Notes
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <div class="note-item">
                                                <i class="fas fa-shield-alt text-railway-primary me-2"></i>
                                                <strong>Security:</strong> Password changes take effect immediately.
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class="note-item">
                                                <i class="fas fa-clock text-railway-info me-2"></i>
                                                <strong>Session:</strong> Admin will need to re-login after password update.
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class="note-item">
                                                <i class="fas fa-database text-railway-success me-2"></i>
                                                <strong>Backup:</strong> All changes are logged for security auditing.
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class="note-item">
                                                <i class="fas fa-users text-railway-warning me-2"></i>
                                                <strong>Access:</strong> Admin privileges remain unchanged.
                                            </div>
                                        </div>
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

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/Railway/js/railway-app.js"></script>

    <!-- Page-specific JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('updateAdminForm');
            const adminNameInput = document.getElementById('adminName');
            const passwordInput = document.getElementById('adminPassword');
            const togglePassword = document.getElementById('togglePassword');
            const toggleCurrentPassword = document.querySelector('.toggle-current-password');
            const submitBtn = document.getElementById('submitBtn');
            const resetBtn = document.getElementById('resetBtn');
            const passwordStrength = document.getElementById('passwordStrength');
            const usernameChange = document.getElementById('usernameChange');
            const passwordChange = document.getElementById('passwordChange');
            
            // Original values for reset
            const originalName = '<%= uname %>';
            const originalPassword = '<%= password %>';
            
            // Password toggle functionality
            togglePassword.addEventListener('click', function() {
                togglePasswordVisibility(passwordInput, this);
            });
            
            toggleCurrentPassword.addEventListener('click', function() {
                const passwordSpan = this.closest('.current-password-display').querySelector('.password-hidden');
                const icon = this.querySelector('i');
                const actualPassword = this.getAttribute('data-password');
                
                if (passwordSpan.textContent === '••••••••') {
                    passwordSpan.textContent = actualPassword;
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    passwordSpan.textContent = '••••••••';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
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
                updateChangeSummary();
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
            
            // Username change detector
            adminNameInput.addEventListener('input', updateChangeSummary);
            
            function updateChangeSummary() {
                const currentName = adminNameInput.value.trim();
                const currentPassword = passwordInput.value;
                
                // Username change
                if (currentName === originalName) {
                    usernameChange.innerHTML = '<span class="text-muted">No changes</span>';
                } else {
                    usernameChange.innerHTML = '<span class="text-railway-warning">Will change to: <strong>' + currentName + '</strong></span>';
                }
                
                // Password change
                if (currentPassword === originalPassword) {
                    passwordChange.innerHTML = '<span class="text-muted">No changes</span>';
                } else {
                    passwordChange.innerHTML = '<span class="text-railway-warning">Will be updated</span>';
                }
            }
            
            // Reset functionality
            resetBtn.addEventListener('click', function() {
                adminNameInput.value = originalName;
                passwordInput.value = originalPassword;
                
                // Clear validation states
                const inputs = form.querySelectorAll('.railway-form-control');
                inputs.forEach(input => {
                    input.classList.remove('is-valid', 'is-invalid');
                });
                
                updateChangeSummary();
                updatePasswordStrengthDisplay(calculatePasswordStrength(originalPassword));
                
                Railway.notifications.success('Form reset to original values.');
            });
            
            // Form validation and submission
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Get form data
                const formData = new FormData(this);
                const adminName = formData.get('name').trim();
                const password = formData.get('password');
                
                // Reset validation states
                const inputs = this.querySelectorAll('.railway-form-control');
                inputs.forEach(input => {
                    input.classList.remove('is-invalid');
                });
                
                let isValid = true;
                
                // Validate admin name
                if (!adminName || adminName.length < 3) {
                    adminNameInput.classList.add('is-invalid');
                    isValid = false;
                }
                
                // Validate password
                if (!password || password.length < 6) {
                    passwordInput.classList.add('is-invalid');
                    isValid = false;
                }
                
                if (!isValid) {
                    Railway.notifications.error('Please fix the validation errors before submitting.');
                    return;
                }
                
                // Check if there are any changes
                if (adminName === originalName && password === originalPassword) {
                    Railway.notifications.warning('No changes detected. Please modify the administrator details to update.');
                    return;
                }
                
                // Show loading state
                const originalText = submitBtn.innerHTML;
                Railway.utils.showLoading(submitBtn, 'Updating Administrator...');
                
                // Submit form after delay (for UX)
                setTimeout(() => {
                    Railway.notifications.success('Updating administrator details...');
                    this.submit();
                }, 1000);
            });
            
            // Initialize form
            updateChangeSummary();
            updatePasswordStrengthDisplay(calculatePasswordStrength(originalPassword));
            
            // Auto-focus admin name field
            adminNameInput.focus();
            adminNameInput.select();
            
            // Show welcome message
            Railway.notifications.info('Editing administrator: ' + originalName, 3000);
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
        
        .admin-avatar .avatar-circle {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 1.25rem;
        }
        
        .current-password-display {
            border: 2px dashed rgba(30, 64, 175, 0.2);
        }
        
        .password-hidden {
            font-family: 'Courier New', monospace;
            font-size: 1rem;
            color: var(--railway-primary);
        }
        
        .change-summary {
            border: 2px solid rgba(30, 64, 175, 0.1);
        }
        
        .note-item {
            display: flex;
            align-items: flex-start;
            font-size: 0.9rem;
        }
        
        .note-item i {
            margin-top: 0.1rem;
            flex-shrink: 0;
        }
        
        .info-group label {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
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
        
        /* Highlight changed values */
        .text-railway-warning strong {
            padding: 0.1rem 0.25rem;
            background-color: rgba(255, 193, 7, 0.1);
            border-radius: 0.25rem;
        }
    </style>
</body>
</html>