<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Design System Demo - Railway Reservation</title>
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Railway Custom Theme -->
    <link href="css/railway-theme.css" rel="stylesheet">
</head>
<body class="bg-railway-light">
    <!-- Include unified header -->
    <jsp:include page="shared/header.jsp" />

    <div class="container-fluid">
        <div class="row">
            <!-- Include sidebar -->
            <div class="col-lg-3 p-0">
                <jsp:include page="shared/sidebar.jsp" />
            </div>
            
            <!-- Main Content -->
            <div class="col-lg-9">
                <div class="main-content p-4">
                    <!-- Page Header -->
                    <div class="railway-card mb-4">
                        <div class="railway-card-header">
                            <h1 class="railway-card-title">
                                <i class="fas fa-palette me-2 text-railway-primary"></i>
                                Railway Design System Demo
                            </h1>
                        </div>
                        <p class="text-muted">
                            Showcase of unified design components used throughout the Railway Reservation System
                        </p>
                    </div>

                    <!-- Color Palette -->
                    <div class="railway-card mb-4">
                        <h3 class="h5 fw-bold mb-4">Color Palette</h3>
                        <div class="row g-3">
                            <div class="col-md-2">
                                <div class="color-swatch bg-railway-primary text-white p-3 rounded text-center">
                                    <div class="fw-bold">Primary</div>
                                    <small>#1e40af</small>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="color-swatch bg-railway-secondary text-white p-3 rounded text-center">
                                    <div class="fw-bold">Secondary</div>
                                    <small>#64748b</small>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="color-swatch bg-railway-accent text-white p-3 rounded text-center">
                                    <div class="fw-bold">Accent</div>
                                    <small>#0ea5e9</small>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="color-swatch bg-railway-success text-white p-3 rounded text-center">
                                    <div class="fw-bold">Success</div>
                                    <small>#22c55e</small>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="color-swatch bg-railway-warning text-dark p-3 rounded text-center">
                                    <div class="fw-bold">Warning</div>
                                    <small>#f59e0b</small>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="color-swatch bg-railway-danger text-white p-3 rounded text-center">
                                    <div class="fw-bold">Danger</div>
                                    <small>#ef4444</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Buttons Demo -->
                    <div class="railway-card mb-4">
                        <h3 class="h5 fw-bold mb-4">Button Components</h3>
                        <div class="row g-3">
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-primary">
                                    <i class="fas fa-check me-2"></i>Primary Button
                                </button>
                            </div>
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-secondary">
                                    <i class="fas fa-cog me-2"></i>Secondary
                                </button>
                            </div>
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-success">
                                    <i class="fas fa-save me-2"></i>Success
                                </button>
                            </div>
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-warning">
                                    <i class="fas fa-exclamation me-2"></i>Warning
                                </button>
                            </div>
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-danger">
                                    <i class="fas fa-trash me-2"></i>Danger
                                </button>
                            </div>
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-outline-primary">
                                    <i class="fas fa-outline me-2"></i>Outline
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Form Components -->
                    <div class="railway-card mb-4">
                        <h3 class="h5 fw-bold mb-4">Form Components</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="railway-form-label">Text Input</label>
                                    <input type="text" class="railway-form-control" placeholder="Enter text here">
                                </div>
                                <div class="mb-3">
                                    <label class="railway-form-label">Email Input</label>
                                    <input type="email" class="railway-form-control" placeholder="Enter email">
                                </div>
                                <div class="mb-3">
                                    <label class="railway-form-label">Select Dropdown</label>
                                    <select class="railway-form-control">
                                        <option>Choose option</option>
                                        <option>Option 1</option>
                                        <option>Option 2</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="railway-form-label">Password Input</label>
                                    <input type="password" class="railway-form-control" placeholder="Enter password">
                                </div>
                                <div class="mb-3">
                                    <label class="railway-form-label">Textarea</label>
                                    <textarea class="railway-form-control" rows="3" placeholder="Enter your message"></textarea>
                                </div>
                                <div class="mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="demoCheck">
                                        <label class="form-check-label" for="demoCheck">
                                            I agree to the terms and conditions
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Alert Components -->
                    <div class="railway-card mb-4">
                        <h3 class="h5 fw-bold mb-4">Alert Components</h3>
                        <div class="railway-alert railway-alert-success">
                            <i class="fas fa-check-circle me-2"></i>
                            This is a success alert with an icon!
                        </div>
                        <div class="railway-alert railway-alert-warning">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            This is a warning alert with an icon!
                        </div>
                        <div class="railway-alert railway-alert-danger">
                            <i class="fas fa-exclamation-circle me-2"></i>
                            This is a danger alert with an icon!
                        </div>
                    </div>

                    <!-- Table Component -->
                    <div class="railway-card mb-4">
                        <h3 class="h5 fw-bold mb-4">Table Component</h3>
                        <div class="table-responsive">
                            <table class="railway-table table">
                                <thead>
                                    <tr>
                                        <th>Train Name</th>
                                        <th>Route</th>
                                        <th>Departure</th>
                                        <th>Arrival</th>
                                        <th>Price</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><strong>Express 101</strong></td>
                                        <td>Colombo to Kandy</td>
                                        <td>08:00 AM</td>
                                        <td>11:30 AM</td>
                                        <td><span class="badge bg-railway-success">$25.00</span></td>
                                        <td>
                                            <button class="btn btn-sm railway-btn-primary me-1">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm railway-btn-warning me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm railway-btn-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Rapid 202</strong></td>
                                        <td>Kandy to Galle</td>
                                        <td>02:00 PM</td>
                                        <td>06:45 PM</td>
                                        <td><span class="badge bg-railway-primary">$35.00</span></td>
                                        <td>
                                            <button class="btn btn-sm railway-btn-primary me-1">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm railway-btn-warning me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm railway-btn-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Local 303</strong></td>
                                        <td>Galle to Matara</td>
                                        <td>07:30 PM</td>
                                        <td>09:00 PM</td>
                                        <td><span class="badge bg-railway-accent">$15.00</span></td>
                                        <td>
                                            <button class="btn btn-sm railway-btn-primary me-1">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm railway-btn-warning me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm railway-btn-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Notification Demo -->
                    <div class="railway-card mb-4">
                        <h3 class="h5 fw-bold mb-4">Notification System</h3>
                        <p class="text-muted mb-3">Click the buttons below to test our notification system:</p>
                        <div class="row g-2">
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-success" onclick="Railway.notifications.success('Success! Operation completed successfully.')">
                                    <i class="fas fa-check me-2"></i>Success Toast
                                </button>
                            </div>
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-primary" onclick="Railway.notifications.info('Information: This is an informational message.')">
                                    <i class="fas fa-info me-2"></i>Info Toast
                                </button>
                            </div>
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-warning" onclick="Railway.notifications.warning('Warning: Please check your input.')">
                                    <i class="fas fa-exclamation me-2"></i>Warning Toast
                                </button>
                            </div>
                            <div class="col-auto">
                                <button class="railway-btn railway-btn-danger" onclick="Railway.notifications.error('Error: Something went wrong.')">
                                    <i class="fas fa-times me-2"></i>Error Toast
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Cards Gallery -->
                    <div class="railway-card mb-4">
                        <h3 class="h5 fw-bold mb-4">Card Components</h3>
                        <div class="row g-4">
                            <div class="col-md-4">
                                <div class="railway-card text-center">
                                    <div class="mb-3">
                                        <i class="fas fa-train fa-3x text-railway-primary"></i>
                                    </div>
                                    <h5 class="fw-bold">Train Bookings</h5>
                                    <p class="text-muted mb-3">Book your train tickets online with ease</p>
                                    <button class="railway-btn railway-btn-primary">
                                        Book Now
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="railway-card text-center">
                                    <div class="mb-3">
                                        <i class="fas fa-ticket-alt fa-3x text-railway-success"></i>
                                    </div>
                                    <h5 class="fw-bold">My Tickets</h5>
                                    <p class="text-muted mb-3">View and manage your booked tickets</p>
                                    <button class="railway-btn railway-btn-success">
                                        View Tickets
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="railway-card text-center">
                                    <div class="mb-3">
                                        <i class="fas fa-headset fa-3x text-railway-accent"></i>
                                    </div>
                                    <h5 class="fw-bold">Support</h5>
                                    <p class="text-muted mb-3">Get help from our 24/7 support team</p>
                                    <button class="railway-btn railway-btn-outline-primary">
                                        Contact Support
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- Include unified footer -->
    <jsp:include page="shared/footer.jsp" />

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/railway-app.js"></script>

    <style>
        .color-swatch {
            transition: transform 0.2s ease;
        }
        
        .color-swatch:hover {
            transform: scale(1.05);
        }
        
        .main-content-with-sidebar {
            margin-left: 0;
        }
        
        @media (min-width: 992px) {
            .main-content-with-sidebar {
                margin-left: 280px;
            }
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            Railway.notifications.info('Design System Demo loaded successfully!', 3000);
        });
    </script>
</body>
</html>