<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get user role and current page for active navigation
    String currentUser = (String) session.getAttribute("user_name");
    String adminUser = (String) session.getAttribute("admin_name");
    String userRole = (adminUser != null) ? "admin" : ((currentUser != null) ? "user" : "guest");
    String currentPage = request.getRequestURI();
    String contextPath = request.getContextPath();
    
    // Sidebar configuration
    String sidebarTitle = request.getParameter("sidebarTitle");
    if (sidebarTitle == null) {
        sidebarTitle = "admin".equals(userRole) ? "Admin Dashboard" : "User Dashboard";
    }
%>

<div class="railway-sidebar" id="railwaySidebar">
    <!-- Sidebar Header -->
    <div class="railway-sidebar-header">
        <h5 class="railway-card-title d-flex align-items-center">
            <% if ("admin".equals(userRole)) { %>
                <i class="fas fa-tachometer-alt text-railway-primary me-2"></i>
                <%= sidebarTitle %>
            <% } else if ("user".equals(userRole)) { %>
                <i class="fas fa-user text-railway-primary me-2"></i>
                <%= sidebarTitle %>
            <% } else { %>
                <i class="fas fa-home text-railway-primary me-2"></i>
                Navigation
            <% } %>
        </h5>
    </div>

    <!-- Sidebar Navigation -->
    <nav class="railway-sidebar-nav">
        <ul class="list-unstyled">
            <% if ("admin".equals(userRole)) { %>
                <!-- Admin Navigation -->
                <li>
                    <a href="<%= contextPath %>/Admin/admin.jsp" 
                       class="<%= currentPage.contains("admin.jsp") ? "active" : "" %>">
                        <i class="fas fa-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                
                <!-- User Management Section -->
                <li class="nav-section-header mt-3">
                    <small class="text-muted fw-bold">USER MANAGEMENT</small>
                </li>
                <li>
                    <a href="<%= contextPath %>/Current_users" 
                       class="<%= currentPage.contains("Current_users") ? "active" : "" %>">
                        <i class="fas fa-users"></i>
                        <span>Manage Users</span>
                        <small class="badge bg-secondary ms-auto">Users</small>
                    </a>
                </li>
                <li>
                    <a href="<%= contextPath %>/Curent_sv" 
                       class="<%= currentPage.contains("Curent_sv") ? "active" : "" %>">
                        <i class="fas fa-user-shield"></i>
                        <span>Manage Admins</span>
                        <small class="badge bg-warning ms-auto">Admin</small>
                    </a>
                </li>
                
                <!-- Train Management Section -->
                <li class="nav-section-header mt-3">
                    <small class="text-muted fw-bold">TRAIN MANAGEMENT</small>
                </li>
                <li>
                    <a href="<%= contextPath %>/Cur_train_sev" 
                       class="<%= currentPage.contains("Cur_train_sev") ? "active" : "" %>">
                        <i class="fas fa-train"></i>
                        <span>Manage Trains</span>
                        <small class="badge bg-info ms-auto">Trains</small>
                    </a>
                </li>
                <li>
                    <a href="<%= contextPath %>/Train_dao" 
                       class="<%= currentPage.contains("Train_dao") ? "active" : "" %>">
                        <i class="fas fa-list"></i>
                        <span>View All Trains</span>
                    </a>
                </li>
                
                <!-- Reservation Management Section -->
                <li class="nav-section-header mt-3">
                    <small class="text-muted fw-bold">RESERVATIONS</small>
                </li>
                <li>
                    <a href="#" onclick="Railway.notifications.info('Feature coming soon!')">
                        <i class="fas fa-ticket-alt"></i>
                        <span>All Reservations</span>
                        <small class="badge bg-success ms-auto">New</small>
                    </a>
                </li>
                <li>
                    <a href="#" onclick="Railway.notifications.info('Feature coming soon!')">
                        <i class="fas fa-chart-bar"></i>
                        <span>Reports</span>
                    </a>
                </li>
                
                <!-- System Section -->
                <li class="nav-section-header mt-3">
                    <small class="text-muted fw-bold">SYSTEM</small>
                </li>
                <li>
                    <a href="#" onclick="Railway.notifications.info('Feature coming soon!')">
                        <i class="fas fa-cog"></i>
                        <span>Settings</span>
                    </a>
                </li>
                
            <% } else if ("user".equals(userRole)) { %>
                <!-- User Navigation -->
                <li>
                    <a href="<%= contextPath %>/Reserve/reserve.jsp" 
                       class="<%= currentPage.contains("reserve.jsp") ? "active" : "" %>">
                        <i class="fas fa-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                
                <!-- Booking Section -->
                <li class="nav-section-header mt-3">
                    <small class="text-muted fw-bold">BOOKING</small>
                </li>
                <li>
                    <a href="<%= contextPath %>/Reserve/reserve.jsp" 
                       class="<%= currentPage.contains("reserve.jsp") ? "active" : "" %>">
                        <i class="fas fa-plus-circle"></i>
                        <span>New Reservation</span>
                        <small class="badge bg-primary ms-auto">Book</small>
                    </a>
                </li>
                <li>
                    <a href="<%= contextPath %>/Trains.jsp" 
                       class="<%= currentPage.contains("Trains.jsp") ? "active" : "" %>">
                        <i class="fas fa-search"></i>
                        <span>Search Trains</span>
                    </a>
                </li>
                
                <!-- My Bookings Section -->
                <li class="nav-section-header mt-3">
                    <small class="text-muted fw-bold">MY BOOKINGS</small>
                </li>
                <li>
                    <a href="<%= contextPath %>/My_res_sv" 
                       class="<%= currentPage.contains("myReservation") ? "active" : "" %>">
                        <i class="fas fa-list"></i>
                        <span>My Reservations</span>
                        <small class="badge bg-info ms-auto">Active</small>
                    </a>
                </li>
                <li>
                    <a href="#" onclick="Railway.notifications.info('Feature coming soon!')">
                        <i class="fas fa-history"></i>
                        <span>Booking History</span>
                    </a>
                </li>
                
                <!-- Account Section -->
                <li class="nav-section-header mt-3">
                    <small class="text-muted fw-bold">ACCOUNT</small>
                </li>
                <li>
                    <a href="#" onclick="Railway.notifications.info('Feature coming soon!')">
                        <i class="fas fa-user"></i>
                        <span>My Profile</span>
                    </a>
                </li>
                
            <% } else { %>
                <!-- Guest Navigation -->
                <li>
                    <a href="<%= contextPath %>/Home/home.jsp">
                        <i class="fas fa-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li>
                    <a href="<%= contextPath %>/Train_dao">
                        <i class="fas fa-train"></i>
                        <span>View Trains</span>
                    </a>
                </li>
                <li>
                    <a href="<%= contextPath %>/SignUp/login.jsp">
                        <i class="fas fa-sign-in-alt"></i>
                        <span>Login</span>
                    </a>
                </li>
                <li>
                    <a href="<%= contextPath %>/SignUp/registration.jsp">
                        <i class="fas fa-user-plus"></i>
                        <span>Register</span>
                    </a>
                </li>
            <% } %>
        </ul>
    </nav>

    <!-- Sidebar Footer -->
    <div class="sidebar-footer mt-auto">
        <% if (!"guest".equals(userRole)) { %>
            <div class="user-info p-3 mt-4" style="border-top: 2px solid var(--railway-light);">
                <div class="d-flex align-items-center mb-2">
                    <div class="user-avatar me-2">
                        <i class="fas fa-user-circle fa-2x text-railway-primary"></i>
                    </div>
                    <div class="user-details">
                        <div class="fw-semibold text-truncate" style="max-width: 120px;">
                            <%= adminUser != null ? adminUser : currentUser %>
                        </div>
                        <small class="text-muted text-uppercase">
                            <%= userRole %>
                        </small>
                    </div>
                </div>
                <a href="<%= contextPath %>/SignUp/login.jsp" 
                   class="btn btn-outline-danger btn-sm w-100">
                    <i class="fas fa-sign-out-alt me-1"></i>Logout
                </a>
            </div>
        <% } %>
    </div>
</div>

<!-- Sidebar Toggle Button for Mobile -->
<button class="btn btn-primary d-lg-none position-fixed" 
        id="sidebarToggle" 
        style="top: 85px; left: 10px; z-index: 1001; border-radius: 50%; width: 45px; height: 45px;">
    <i class="fas fa-bars"></i>
</button>

<!-- Sidebar Overlay for Mobile -->
<div class="sidebar-overlay d-lg-none" id="sidebarOverlay" 
     style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; 
            background: rgba(0,0,0,0.5); z-index: 999; display: none;"></div>

<style>
/* Additional sidebar-specific styles */
.nav-section-header {
    padding: 0.5rem 1rem;
    margin-bottom: 0.25rem;
}

.railway-sidebar-nav a {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.railway-sidebar-nav a .badge {
    font-size: 0.7rem;
    padding: 0.25rem 0.5rem;
}

.user-avatar {
    display: flex;
    align-items: center;
    justify-content: center;
}

.sidebar-footer {
    margin-top: auto;
}

/* Mobile sidebar styles */
@media (max-width: 991.98px) {
    .railway-sidebar {
        position: fixed;
        top: 76px;
        left: -280px;
        width: 280px;
        z-index: 1000;
        transition: left 0.3s ease;
        height: calc(100vh - 76px);
        overflow-y: auto;
    }
    
    .railway-sidebar.show {
        left: 0;
        box-shadow: var(--railway-shadow-lg);
    }
    
    .sidebar-overlay.show {
        display: block !important;
    }
    
    #sidebarToggle {
        box-shadow: var(--railway-shadow-md);
    }
}

/* Desktop sidebar adjustments */
@media (min-width: 992px) {
    #sidebarToggle {
        display: none !important;
    }
    
    .main-content-with-sidebar {
        margin-left: 280px;
    }
}

/* Smooth transitions */
.railway-sidebar-nav a {
    transition: all 0.2s ease;
}

.railway-sidebar-nav a:hover {
    transform: translateX(4px);
}

.railway-sidebar-nav a.active {
    background: linear-gradient(135deg, var(--railway-primary), var(--railway-accent));
    color: white;
    box-shadow: var(--railway-shadow-sm);
}

.railway-sidebar-nav a.active .badge {
    background-color: rgba(255, 255, 255, 0.2) !important;
}
</style>

<script>
// Sidebar mobile functionality
document.addEventListener('DOMContentLoaded', function() {
    const sidebar = document.getElementById('railwaySidebar');
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebarOverlay = document.getElementById('sidebarOverlay');
    
    // Toggle sidebar on mobile
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', function() {
            sidebar.classList.toggle('show');
            sidebarOverlay.classList.toggle('show');
        });
    }
    
    // Close sidebar when clicking overlay
    if (sidebarOverlay) {
        sidebarOverlay.addEventListener('click', function() {
            sidebar.classList.remove('show');
            sidebarOverlay.classList.remove('show');
        });
    }
    
    // Close sidebar on mobile when navigation link is clicked
    const sidebarLinks = sidebar.querySelectorAll('a');
    sidebarLinks.forEach(link => {
        link.addEventListener('click', function() {
            if (window.innerWidth < 992) {
                sidebar.classList.remove('show');
                sidebarOverlay.classList.remove('show');
            }
        });
    });
    
    // Handle window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth >= 992) {
            sidebar.classList.remove('show');
            sidebarOverlay.classList.remove('show');
        }
    });
});
</script>