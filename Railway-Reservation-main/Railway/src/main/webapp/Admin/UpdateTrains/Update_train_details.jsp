<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<%
    String trainId = request.getParameter("id");
    String name = request.getParameter("name");
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String price = request.getParameter("price");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Update train details in Railway Reservation System">
    <title>Update Train - Railway Reservation System</title>
    
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
                            <li class="breadcrumb-item active" aria-current="page">Update Train</li>
                        </ol>
                    </nav>

                    <!-- Page Header -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h1 class="railway-page-title">
                                <i class="fas fa-edit me-2 text-railway-warning"></i>
                                Update Train Details
                            </h1>
                            <p class="text-muted mb-0">
                                Modify train information including route, schedule, and pricing details.
                            </p>
                        </div>
                        
                        <div class="page-actions">
                            <a href="/Railway/Cur_train_sev" class="railway-btn railway-btn-outline-primary me-2">
                                <i class="fas fa-arrow-left me-2"></i>Back to Trains
                            </a>
                        </div>
                    </div>

                    <!-- Update Train Form -->
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h5 mb-0">
                                        <i class="fas fa-train me-2 text-railway-warning"></i>
                                        Train Information
                                    </h3>
                                    <small class="text-muted">Train ID: #<%= trainId %></small>
                                </div>
                                <div class="railway-card-body">
                                    <div class="alert alert-info d-flex align-items-center mb-4">
                                        <i class="fas fa-info-circle me-3"></i>
                                        <div>
                                            <strong>Important:</strong> Changes to train details will affect all future reservations. Existing bookings will remain unchanged.
                                        </div>
                                    </div>

                                    <form method="get" action="/Railway/Update_trains_sev" id="updateTrainForm">
                                        <input type="hidden" name="Id" value="<%= trainId %>">
                                        
                                        <div class="row">
                                            <div class="col-md-12 mb-3">
                                                <label for="trainName" class="railway-form-label">
                                                    <i class="fas fa-tag me-1"></i>Train Name *
                                                </label>
                                                <input type="text" 
                                                       class="railway-form-input" 
                                                       id="trainName"
                                                       name="name" 
                                                       value="<%= name %>"
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
                                                       value="<%= from %>"
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
                                                       value="<%= to %>"
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
                                                           value="<%= price %>"
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
                                            <button type="submit" class="railway-btn railway-btn-warning me-3">
                                                <i class="fas fa-save me-2"></i>Update Train
                                            </button>
                                            <a href="/Railway/Cur_train_sev" class="railway-btn railway-btn-outline-secondary">
                                                <i class="fas fa-times me-2"></i>Cancel
                                            </a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Information Card -->
                        <div class="col-lg-4">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-info-circle me-2 text-railway-info"></i>
                                        Current Information
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="current-info">
                                        <div class="info-item mb-3">
                                            <small class="text-muted d-block">Train ID</small>
                                            <span class="fw-bold text-railway-primary">#<%= trainId %></span>
                                        </div>
                                        <div class="info-item mb-3">
                                            <small class="text-muted d-block">Route</small>
                                            <div class="route-display">
                                                <span class="fw-bold"><%= from %></span>
                                                <i class="fas fa-arrow-right mx-2 text-railway-primary"></i>
                                                <span class="fw-bold"><%= to %></span>
                                            </div>
                                        </div>
                                        <div class="info-item mb-3">
                                            <small class="text-muted d-block">Current Price</small>
                                            <span class="railway-badge railway-badge-primary">
                                                <i class="fas fa-dollar-sign me-1"></i>
                                                <%= price %>
                                            </span>
                                        </div>
                                        <div class="info-item">
                                            <small class="text-muted d-block">Status</small>
                                            <span class="railway-badge railway-badge-success">
                                                <i class="fas fa-check-circle me-1"></i>
                                                Active
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Update Tips -->
                            <div class="railway-card mt-4">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-lightbulb me-2 text-railway-warning"></i>
                                        Update Guidelines
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="help-content">
                                        <div class="help-item mb-3">
                                            <i class="fas fa-exclamation-circle text-railway-danger me-2"></i>
                                            <small>Price changes affect future bookings only</small>
                                        </div>
                                        <div class="help-item mb-3">
                                            <i class="fas fa-route text-railway-primary me-2"></i>
                                            <small>Route changes require admin approval</small>
                                        </div>
                                        <div class="help-item mb-3">
                                            <i class="fas fa-clock text-railway-warning me-2"></i>
                                            <small>Updates are applied immediately</small>
                                        </div>
                                        <div class="help-item">
                                            <i class="fas fa-users text-railway-success me-2"></i>
                                            <small>Passengers will be notified of changes</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Quick Actions -->
                            <div class="railway-card mt-4">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-bolt me-2 text-railway-secondary"></i>
                                        Quick Actions
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="d-grid gap-2">
                                        <a href="/Railway/Cur_train_sev" class="railway-btn railway-btn-outline-primary">
                                            <i class="fas fa-list me-2"></i>View All Trains
                                        </a>
                                        <a href="/Railway/Admin/UpdateTrains/updateTrains.jsp" class="railway-btn railway-btn-outline-success">
                                            <i class="fas fa-plus me-2"></i>Add New Train
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
        document.addEventListener('DOMContentLoaded', function() {
            // Form validation
            const form = document.getElementById('updateTrainForm');
            
            if (form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                });
            }

            // Real-time validation feedback
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
                
                // Remove validation classes on input
                input.addEventListener('input', function() {
                    this.classList.remove('is-valid', 'is-invalid');
                });
            });

            // Confirmation before updating
            form.addEventListener('submit', function(e) {
                const trainName = document.getElementById('trainName').value;
                const confirmed = confirm(`Are you sure you want to update train "${trainName}"? This action will apply the changes immediately.`);
                
                if (!confirmed) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>