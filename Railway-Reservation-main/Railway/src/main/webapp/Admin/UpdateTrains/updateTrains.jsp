<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Add new trains to Railway Reservation System">
    <title>Add Train - Railway Reservation System</title>
    
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
            <!-- Include train sidebar -->
            <div class="col-lg-3 p-0">
                <jsp:include page="/shared/sidebar.jsp">
                    <jsp:param name="sidebarTitle" value="Train Management" />
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
                                <a href="/Railway/Cur_train_sev" class="text-decoration-none">
                                    <i class="fas fa-train me-1"></i>Trains
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Add Train</li>
                        </ol>
                    </nav>

                    <!-- Page Header -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h1 class="railway-page-title">
                                <i class="fas fa-plus-circle me-2 text-railway-primary"></i>
                                Add New Train
                            </h1>
                            <p class="text-muted mb-0">
                                Add a new train route to the railway system with schedule and pricing information.
                            </p>
                        </div>
                        
                        <div class="page-actions">
                            <a href="/Railway/Cur_train_sev" class="railway-btn railway-btn-outline-primary me-2">
                                <i class="fas fa-list me-2"></i>View Trains
                            </a>
                        </div>
                    </div>

                    <!-- Add Train Form -->
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h5 mb-0">
                                        <i class="fas fa-train me-2 text-railway-primary"></i>
                                        Train Information
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <form method="post" action="/Railway/InsertTrainServlet" id="trainForm">
                                        <div class="row">
                                            <div class="col-md-12 mb-3">
                                                <label for="trainName" class="railway-form-label">
                                                    <i class="fas fa-tag me-1"></i>Train Name *
                                                </label>
                                                <input type="text" 
                                                       class="railway-form-input" 
                                                       id="trainName"
                                                       name="name" 
                                                       placeholder="Enter train name (e.g., Express 101)"
                                                       required>
                                                <div class="railway-form-feedback">
                                                    Please provide a valid train name.
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="fromStation" class="railway-form-label">
                                                    <i class="fas fa-map-marker-alt me-1"></i>Departure Station *
                                                </label>
                                                <input type="text" 
                                                       class="railway-form-input" 
                                                       id="fromStation"
                                                       name="from" 
                                                       placeholder="Enter departure station"
                                                       required>
                                                <div class="railway-form-feedback">
                                                    Please provide departure station.
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6 mb-3">
                                                <label for="toStation" class="railway-form-label">
                                                    <i class="fas fa-flag-checkered me-1"></i>Arrival Station *
                                                </label>
                                                <input type="text" 
                                                       class="railway-form-input" 
                                                       id="toStation"
                                                       name="to" 
                                                       placeholder="Enter arrival station"
                                                       required>
                                                <div class="railway-form-feedback">
                                                    Please provide arrival station.
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="ticketPrice" class="railway-form-label">
                                                    <i class="fas fa-dollar-sign me-1"></i>Ticket Price *
                                                </label>
                                                <div class="input-group">
                                                    <span class="input-group-text">$</span>
                                                    <input type="number" 
                                                           class="railway-form-input" 
                                                           id="ticketPrice"
                                                           name="price" 
                                                           placeholder="0.00"
                                                           min="0"
                                                           step="0.01"
                                                           required>
                                                </div>
                                                <div class="railway-form-feedback">
                                                    Please provide a valid price.
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-actions mt-4">
                                            <button type="submit" class="railway-btn railway-btn-primary me-3">
                                                <i class="fas fa-save me-2"></i>Add Train
                                            </button>
                                            <a href="/Railway/Cur_train_sev" class="railway-btn railway-btn-outline-secondary">
                                                <i class="fas fa-times me-2"></i>Cancel
                                            </a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Help Card -->
                        <div class="col-lg-4">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-info-circle me-2 text-railway-info"></i>
                                        Quick Tips
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="help-content">
                                        <div class="help-item mb-3">
                                            <i class="fas fa-lightbulb text-railway-warning me-2"></i>
                                            <small>Use clear, descriptive train names like "Morning Express" or "Night Special"</small>
                                        </div>
                                        <div class="help-item mb-3">
                                            <i class="fas fa-map text-railway-success me-2"></i>
                                            <small>Station names should be consistent across the system</small>
                                        </div>
                                        <div class="help-item mb-3">
                                            <i class="fas fa-money-bill text-railway-primary me-2"></i>
                                            <small>Set competitive prices based on distance and service level</small>
                                        </div>
                                        <div class="help-item">
                                            <i class="fas fa-shield-alt text-railway-danger me-2"></i>
                                            <small>All fields marked with * are required</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Recent Activity -->
                            <div class="railway-card mt-4">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-history me-2 text-railway-secondary"></i>
                                        Quick Actions
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="d-grid gap-2">
                                        <a href="/Railway/Cur_train_sev" class="railway-btn railway-btn-outline-primary">
                                            <i class="fas fa-list me-2"></i>View All Trains
                                        </a>
                                        <a href="../admin.jsp" class="railway-btn railway-btn-outline-secondary">
                                            <i class="fas fa-tachometer-alt me-2"></i>Dashboard
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
    
    <!-- Form Validation Script -->
    <script>
        // Form validation
        (function() {
            'use strict';
            var forms = document.querySelectorAll('#trainForm');
            Array.prototype.slice.call(forms)
                .forEach(function(form) {
                    form.addEventListener('submit', function(event) {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
        })();

        // Real-time validation feedback
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('.railway-form-input');
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
            });
        });
    </script>
</body>
</html>