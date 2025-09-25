<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Railway Reservation System - Administrator Dashboard">
    <title>Admin Dashboard - Railway Reservation System</title>
    
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

    <div class="container-fluid">
        <div class="row">
            <!-- Include admin sidebar -->
            <div class="col-lg-3 p-0">
                <jsp:include page="../shared/sidebar.jsp">
                    <jsp:param name="sidebarTitle" value="Admin Dashboard" />
                </jsp:include>
            </div>
            
            <!-- Main Content -->
            <div class="col-lg-9">
                <div class="main-content p-4">
                    
                    <!-- Welcome Header -->
                    <div class="welcome-section mb-5">
                        <div class="railway-card gradient-card">
                            <div class="railway-card-body">
                                <div class="row align-items-center">
                                    <div class="col-lg-8">
                                        <div class="welcome-content">
                                            <h1 class="display-5 fw-bold text-white mb-3">
                                                <i class="fas fa-tachometer-alt me-3"></i>
                                                Administrator Dashboard
                                            </h1>
                                            <p class="lead text-white opacity-90 mb-0">
                                                Welcome to the Railway Reservation System control center. 
                                                Manage all system components from this comprehensive dashboard.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 text-center">
                                        <div class="dashboard-icon">
                                            <i class="fas fa-user-shield fa-5x text-white opacity-75"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Stats -->
                    <div class="row mb-5">
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="railway-stat-card bg-railway-primary text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1">24</h3>
                                            <small class="opacity-75">Total Admins</small>
                                        </div>
                                        <i class="fas fa-users-cog fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="railway-stat-card bg-railway-success text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1">1,247</h3>
                                            <small class="opacity-75">Registered Users</small>
                                        </div>
                                        <i class="fas fa-users fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="railway-stat-card bg-railway-info text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1">156</h3>
                                            <small class="opacity-75">Active Trains</small>
                                        </div>
                                        <i class="fas fa-train fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="railway-stat-card bg-railway-warning text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1">892</h3>
                                            <small class="opacity-75">Reservations Today</small>
                                        </div>
                                        <i class="fas fa-ticket-alt fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Management Sections -->
                    <div class="row">
                        <div class="col-12 mb-4">
                            <h2 class="railway-section-title">
                                <i class="fas fa-cogs me-2 text-railway-primary"></i>
                                System Management
                            </h2>
                            <p class="text-muted mb-4">
                                Access different management sections to control various aspects of the railway reservation system.
                            </p>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Admin Management -->
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="management-card railway-card h-100" onclick="location.href='/Railway/Curent_sv'" style="cursor: pointer;">
                                <div class="railway-card-body text-center">
                                    <div class="management-icon mb-4">
                                        <div class="icon-circle bg-railway-primary">
                                            <i class="fas fa-users-cog fa-3x text-white"></i>
                                        </div>
                                    </div>
                                    <h4 class="railway-card-title mb-3">Administrator Management</h4>
                                    <p class="text-muted mb-4">
                                        Add, edit, and manage system administrators. Control access levels and security settings.
                                    </p>
                                    <div class="management-features mb-4">
                                        <div class="feature-item">
                                            <i class="fas fa-check text-railway-success me-2"></i>
                                            <small>Add/Remove Admins</small>
                                        </div>
                                        <div class="feature-item">
                                            <i class="fas fa-check text-railway-success me-2"></i>
                                            <small>Update Credentials</small>
                                        </div>
                                        <div class="feature-item">
                                            <i class="fas fa-check text-railway-success me-2"></i>
                                            <small>Security Management</small>
                                        </div>
                                    </div>
                                    <div class="railway-btn railway-btn-primary w-100">
                                        <i class="fas fa-arrow-right me-2"></i>Manage Admins
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- User Management -->
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="management-card railway-card h-100" onclick="location.href='./UpdateUsers/UpdateUsers.jsp'" style="cursor: pointer;">
                                <div class="railway-card-body text-center">
                                    <div class="management-icon mb-4">
                                        <div class="icon-circle bg-railway-success">
                                            <i class="fas fa-users fa-3x text-white"></i>
                                        </div>
                                    </div>
                                    <h4 class="railway-card-title mb-3">User Management</h4>
                                    <p class="text-muted mb-4">
                                        Manage customer accounts, view user activity, and handle user-related operations.
                                    </p>
                                    <div class="management-features mb-4">
                                        <div class="feature-item">
                                            <i class="fas fa-check text-railway-success me-2"></i>
                                            <small>User Registration</small>
                                        </div>
                                        <div class="feature-item">
                                            <i class="fas fa-check text-railway-success me-2"></i>
                                            <small>Account Management</small>
                                        </div>
                                        <div class="feature-item">
                                            <i class="fas fa-check text-railway-success me-2"></i>
                                            <small>User Activity Logs</small>
                                        </div>
                                    </div>
                                    <div class="railway-btn railway-btn-success w-100">
                                        <i class="fas fa-arrow-right me-2"></i>Manage Users
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Train Management -->
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="management-card railway-card h-100" onclick="location.href='./UpdateTrains/updateTrains.jsp'" style="cursor: pointer;">
                                <div class="railway-card-body text-center">
                                    <div class="management-icon mb-4">
                                        <div class="icon-circle bg-railway-info">
                                            <i class="fas fa-train fa-3x text-white"></i>
                                        </div>
                                    </div>
                                    <h4 class="railway-card-title mb-3">Train Management</h4>
                                    <p class="text-muted mb-4">
                                        Add new trains, update schedules, manage routes, and control train availability.
                                    </p>
                                    <div class="management-features mb-4">
                                        <div class="feature-item">
                                            <i class="fas fa-check text-railway-success me-2"></i>
                                            <small>Add/Edit Trains</small>
                                        </div>
                                        <div class="feature-item">
                                            <i class="fas fa-check text-railway-success me-2"></i>
                                            <small>Schedule Management</small>
                                        </div>
                                        <div class="feature-item">
                                            <i class="fas fa-check text-railway-success me-2"></i>
                                            <small>Route Planning</small>
                                        </div>
                                    </div>
                                    <div class="railway-btn railway-btn-info w-100">
                                        <i class="fas fa-arrow-right me-2"></i>Manage Trains
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Actions -->
                    <div class="row mt-5">
                        <div class="col-12">
                            <h2 class="railway-section-title">
                                <i class="fas fa-bolt me-2 text-railway-warning"></i>
                                Quick Actions
                            </h2>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="quick-action-card" onclick="location.href='./updateAdmin/UpdateAdmin.jsp'">
                                <div class="quick-action-icon">
                                    <i class="fas fa-user-plus text-railway-primary"></i>
                                </div>
                                <div class="quick-action-content">
                                    <h6 class="mb-1">Add New Admin</h6>
                                    <small class="text-muted">Create administrator account</small>
                                </div>
                                <i class="fas fa-chevron-right text-muted"></i>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="quick-action-card" onclick="location.href='./UpdateTrains/updateTrains.jsp'">
                                <div class="quick-action-icon">
                                    <i class="fas fa-plus-circle text-railway-success"></i>
                                </div>
                                <div class="quick-action-content">
                                    <h6 class="mb-1">Add New Train</h6>
                                    <small class="text-muted">Register new train service</small>
                                </div>
                                <i class="fas fa-chevron-right text-muted"></i>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="quick-action-card" onclick="alert('Feature coming soon!')">
                                <div class="quick-action-icon">
                                    <i class="fas fa-chart-bar text-railway-info"></i>
                                </div>
                                <div class="quick-action-content">
                                    <h6 class="mb-1">View Reports</h6>
                                    <small class="text-muted">System analytics</small>
                                </div>
                                <i class="fas fa-chevron-right text-muted"></i>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="quick-action-card" onclick="alert('Feature coming soon!')">
                                <div class="quick-action-icon">
                                    <i class="fas fa-cog text-railway-warning"></i>
                                </div>
                                <div class="quick-action-content">
                                    <h6 class="mb-1">System Settings</h6>
                                    <small class="text-muted">Configure system</small>
                                </div>
                                <i class="fas fa-chevron-right text-muted"></i>
                            </div>
                        </div>
                    </div>

                    <!-- System Status -->
                    <div class="row mt-5">
                        <div class="col-lg-8">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h5 mb-0">
                                        <i class="fas fa-server me-2 text-railway-primary"></i>
                                        System Status
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <div class="status-item">
                                                <div class="d-flex align-items-center mb-2">
                                                    <i class="fas fa-circle text-railway-success me-2" style="font-size: 0.5rem;"></i>
                                                    <span class="fw-bold">Database</span>
                                                </div>
                                                <small class="text-muted">Connected and operational</small>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <div class="status-item">
                                                <div class="d-flex align-items-center mb-2">
                                                    <i class="fas fa-circle text-railway-success me-2" style="font-size: 0.5rem;"></i>
                                                    <span class="fw-bold">Web Server</span>
                                                </div>
                                                <small class="text-muted">Running smoothly</small>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <div class="status-item">
                                                <div class="d-flex align-items-center mb-2">
                                                    <i class="fas fa-circle text-railway-success me-2" style="font-size: 0.5rem;"></i>
                                                    <span class="fw-bold">Security</span>
                                                </div>
                                                <small class="text-muted">All systems secure</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-clock me-2 text-railway-info"></i>
                                        Recent Activity
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="activity-item">
                                        <i class="fas fa-user-plus text-railway-primary me-2"></i>
                                        <div>
                                            <small class="text-muted d-block">2 minutes ago</small>
                                            <span class="small">New user registered</span>
                                        </div>
                                    </div>
                                    <div class="activity-item">
                                        <i class="fas fa-ticket-alt text-railway-success me-2"></i>
                                        <div>
                                            <small class="text-muted d-block">5 minutes ago</small>
                                            <span class="small">Ticket booked</span>
                                        </div>
                                    </div>
                                    <div class="activity-item">
                                        <i class="fas fa-train text-railway-info me-2"></i>
                                        <div>
                                            <small class="text-muted d-block">10 minutes ago</small>
                                            <span class="small">Train schedule updated</span>
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
    <jsp:include page="../shared/footer.jsp" />

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/railway-app.js"></script>

    <!-- Page-specific JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add hover effects to management cards
            const managementCards = document.querySelectorAll('.management-card');
            managementCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-5px)';
                    this.style.boxShadow = '0 8px 25px rgba(0, 0, 0, 0.15)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                    this.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.1)';
                });
            });

            // Add hover effects to quick action cards
            const quickActionCards = document.querySelectorAll('.quick-action-card');
            quickActionCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.backgroundColor = '#f8f9ff';
                    this.style.borderColor = 'var(--railway-primary)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.backgroundColor = '#ffffff';
                    this.style.borderColor = '#e2e8f0';
                });
            });

            // Show welcome message
            Railway.notifications.success('Welcome to the Administrator Dashboard!', 5000);

            // Simulate real-time updates
            setInterval(updateStats, 30000); // Update every 30 seconds
            
            function updateStats() {
                // This could be connected to real backend data
                console.log('Stats updated');
            }
        });
    </script>

    <!-- Additional Styles -->
    <style>
        .gradient-card {
            background: linear-gradient(135deg, var(--railway-primary), var(--railway-secondary));
            border: none;
            color: white;
        }
        
        .management-card {
            transition: all 0.3s ease;
            border: 2px solid transparent;
            cursor: pointer;
        }
        
        .management-card:hover {
            border-color: var(--railway-primary);
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .icon-circle {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
        }
        
        .management-features {
            text-align: left;
        }
        
        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
        }
        
        .quick-action-card {
            display: flex;
            align-items: center;
            padding: 1rem;
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .quick-action-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(30, 64, 175, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
        }
        
        .quick-action-icon i {
            font-size: 1.25rem;
        }
        
        .quick-action-content {
            flex: 1;
        }
        
        .status-item {
            padding: 0.75rem;
            background: rgba(30, 64, 175, 0.05);
            border-radius: 0.5rem;
        }
        
        .activity-item {
            display: flex;
            align-items: flex-start;
            padding: 0.75rem 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-item i {
            margin-top: 0.25rem;
            width: 20px;
        }
        
        .dashboard-icon {
            opacity: 0.8;
        }
        
        @media (max-width: 768px) {
            .management-card {
                margin-bottom: 2rem;
            }
            
            .quick-action-card {
                margin-bottom: 1rem;
            }
            
            .icon-circle {
                width: 60px;
                height: 60px;
            }
            
            .icon-circle i {
                font-size: 2rem;
            }
        }
        
        /* Animation for stat cards */
        .railway-stat-card {
            animation: fadeInUp 0.6s ease forwards;
        }
        
        .railway-stat-card:nth-child(2) { animation-delay: 0.1s; }
        .railway-stat-card:nth-child(3) { animation-delay: 0.2s; }
        .railway-stat-card:nth-child(4) { animation-delay: 0.3s; }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Management cards animation */
        .management-card {
            animation: slideInFromBottom 0.8s ease forwards;
        }
        
        .management-card:nth-child(2) { animation-delay: 0.2s; }
        .management-card:nth-child(3) { animation-delay: 0.4s; }
        
        @keyframes slideInFromBottom {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</body>
</html>