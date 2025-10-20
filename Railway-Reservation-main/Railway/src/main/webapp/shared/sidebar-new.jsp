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

<!-- Modern Sidebar Component -->
<aside class="modern-sidebar" id="modernSidebar" data-collapsed="false">
    <!-- Toggle Button -->
    <button class="sidebar-toggle" id="sidebarToggleBtn" type="button" aria-label="Toggle Sidebar">
        <i class="fas fa-chevron-left"></i>
    </button>
    
    <!-- Sidebar Header -->
    <div class="sidebar-header">
        <div class="sidebar-logo">
            <i class="fas fa-train sidebar-icon"></i>
            <span class="sidebar-text">Railway System</span>
        </div>
        <div class="sidebar-subtitle">
            <% if ("admin".equals(userRole)) { %>
                <i class="fas fa-shield-alt sidebar-icon-sm"></i>
                <span class="sidebar-text">Admin Panel</span>
            <% } else if ("user".equals(userRole)) { %>
                <i class="fas fa-user sidebar-icon-sm"></i>
                <span class="sidebar-text">User Portal</span>
            <% } %>
        </div>
    </div>
    
    <!-- Sidebar Navigation -->
    <nav class="sidebar-nav">
        <% if ("admin".equals(userRole)) { %>
            <!-- Admin Navigation -->
            <div class="nav-section">
                <div class="nav-section-title">
                    <span class="sidebar-text">Dashboard</span>
                </div>
                <a href="<%= contextPath %>/Admin/admin.jsp" 
                   class="nav-item <%= currentPage.contains("admin.jsp") ? "active" : "" %>"
                   data-tooltip="Dashboard">
                    <i class="fas fa-home nav-icon"></i>
                    <span class="nav-text">Dashboard</span>
                </a>
            </div>
            
            <div class="nav-section">
                <div class="nav-section-title">
                    <span class="sidebar-text">User Management</span>
                </div>
                <a href="<%= contextPath %>/Curent_servlet" 
                   class="nav-item <%= currentPage.contains("CurrentUsers") || currentPage.contains("Curent_servlet") ? "active" : "" %>"
                   data-tooltip="Manage Users">
                    <i class="fas fa-users nav-icon"></i>
                    <span class="nav-text">Manage Users</span>
                    <span class="nav-badge">Users</span>
                </a>
                <a href="<%= contextPath %>/Curent_sv" 
                   class="nav-item <%= currentPage.contains("Curent_sv") ? "active" : "" %>"
                   data-tooltip="Manage Admins">
                    <i class="fas fa-user-shield nav-icon"></i>
                    <span class="nav-text">Manage Admins</span>
                    <span class="nav-badge badge-warning">Admin</span>
                </a>
            </div>
            
            <div class="nav-section">
                <div class="nav-section-title">
                    <span class="sidebar-text">Train Management</span>
                </div>
                <a href="<%= contextPath %>/Cur_train_sev" 
                   class="nav-item <%= currentPage.contains("Currenttrains") || currentPage.contains("Cur_train_sev") ? "active" : "" %>"
                   data-tooltip="Manage Trains">
                    <i class="fas fa-train nav-icon"></i>
                    <span class="nav-text">Manage Trains</span>
                    <span class="nav-badge badge-info">Trains</span>
                </a>
                <a href="<%= contextPath %>/Train_res" 
                   class="nav-item <%= currentPage.contains("Train_res") || currentPage.contains("Trains.jsp") ? "active" : "" %>"
                   data-tooltip="All Trains">
                    <i class="fas fa-list nav-icon"></i>
                    <span class="nav-text">View All Trains</span>
                </a>
            </div>
            
            <div class="nav-section">
                <div class="nav-section-title">
                    <span class="sidebar-text">Reservations</span>
                </div>
                <a href="#" class="nav-item" data-tooltip="All Reservations"
                   onclick="alert('Feature coming soon!'); return false;">
                    <i class="fas fa-ticket-alt nav-icon"></i>
                    <span class="nav-text">All Reservations</span>
                    <span class="nav-badge badge-success">New</span>
                </a>
                <a href="#" class="nav-item" data-tooltip="Reports"
                   onclick="alert('Feature coming soon!'); return false;">
                    <i class="fas fa-chart-bar nav-icon"></i>
                    <span class="nav-text">Reports</span>
                </a>
            </div>
            
            <div class="nav-section">
                <div class="nav-section-title">
                    <span class="sidebar-text">System</span>
                </div>
                <a href="#" class="nav-item" data-tooltip="Settings"
                   onclick="alert('Feature coming soon!'); return false;">
                    <i class="fas fa-cog nav-icon"></i>
                    <span class="nav-text">Settings</span>
                </a>
            </div>
            
        <% } else if ("user".equals(userRole)) { %>
            <!-- User Navigation -->
            <div class="nav-section">
                <div class="nav-section-title">
                    <span class="sidebar-text">Dashboard</span>
                </div>
                <a href="<%= contextPath %>/Reserve/reserve.jsp" 
                   class="nav-item <%= currentPage.contains("reserve.jsp") ? "active" : "" %>"
                   data-tooltip="Dashboard">
                    <i class="fas fa-home nav-icon"></i>
                    <span class="nav-text">Dashboard</span>
                </a>
            </div>
            
            <div class="nav-section">
                <div class="nav-section-title">
                    <span class="sidebar-text">Booking</span>
                </div>
                <a href="<%= contextPath %>/Reserve/reserve.jsp" 
                   class="nav-item <%= currentPage.contains("reserve.jsp") ? "active" : "" %>"
                   data-tooltip="New Reservation">
                    <i class="fas fa-plus-circle nav-icon"></i>
                    <span class="nav-text">New Reservation</span>
                    <span class="nav-badge badge-primary">Book</span>
                </a>
                <a href="<%= contextPath %>/Trains.jsp" 
                   class="nav-item <%= currentPage.contains("Trains.jsp") ? "active" : "" %>"
                   data-tooltip="Search Trains">
                    <i class="fas fa-search nav-icon"></i>
                    <span class="nav-text">Search Trains</span>
                </a>
            </div>
            
            <div class="nav-section">
                <div class="nav-section-title">
                    <span class="sidebar-text">My Bookings</span>
                </div>
                <a href="<%= contextPath %>/My_res_sv" 
                   class="nav-item <%= currentPage.contains("myReservation") ? "active" : "" %>"
                   data-tooltip="My Reservations">
                    <i class="fas fa-list nav-icon"></i>
                    <span class="nav-text">My Reservations</span>
                    <span class="nav-badge badge-info">Active</span>
                </a>
                <a href="#" class="nav-item" data-tooltip="Booking History"
                   onclick="alert('Feature coming soon!'); return false;">
                    <i class="fas fa-history nav-icon"></i>
                    <span class="nav-text">Booking History</span>
                </a>
            </div>
            
            <div class="nav-section">
                <div class="nav-section-title">
                    <span class="sidebar-text">Account</span>
                </div>
                <a href="#" class="nav-item" data-tooltip="My Profile"
                   onclick="alert('Feature coming soon!'); return false;">
                    <i class="fas fa-user nav-icon"></i>
                    <span class="nav-text">My Profile</span>
                </a>
            </div>
            
        <% } else { %>
            <!-- Guest Navigation -->
            <div class="nav-section">
                <a href="<%= contextPath %>/Home/home.jsp" 
                   class="nav-item"
                   data-tooltip="Home">
                    <i class="fas fa-home nav-icon"></i>
                    <span class="nav-text">Home</span>
                </a>
                <a href="<%= contextPath %>/Train_dao" 
                   class="nav-item"
                   data-tooltip="View Trains">
                    <i class="fas fa-train nav-icon"></i>
                    <span class="nav-text">View Trains</span>
                </a>
                <a href="<%= contextPath %>/SignUp/login.jsp" 
                   class="nav-item"
                   data-tooltip="Login">
                    <i class="fas fa-sign-in-alt nav-icon"></i>
                    <span class="nav-text">Login</span>
                </a>
                <a href="<%= contextPath %>/SignUp/registration.jsp" 
                   class="nav-item"
                   data-tooltip="Register">
                    <i class="fas fa-user-plus nav-icon"></i>
                    <span class="nav-text">Register</span>
                </a>
            </div>
        <% } %>
    </nav>
    
    <!-- Sidebar Footer -->
    <% if (!"guest".equals(userRole)) { %>
    <div class="sidebar-footer">
        <div class="user-profile">
            <div class="user-avatar">
                <i class="fas fa-user-circle"></i>
            </div>
            <div class="user-info">
                <div class="user-name"><%= adminUser != null ? adminUser : currentUser %></div>
                <div class="user-role"><%= userRole.toUpperCase() %></div>
            </div>
        </div>
        <a href="<%= contextPath %>/SignUp/login.jsp" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i>
            <span class="sidebar-text">Logout</span>
        </a>
    </div>
    <% } %>
</aside>

<!-- Mobile Toggle Button -->
<button class="mobile-toggle-btn" id="mobileToggleBtn" type="button" aria-label="Open Menu">
    <i class="fas fa-bars"></i>
</button>

<!-- Sidebar Overlay for Mobile -->
<div class="sidebar-overlay" id="sidebarOverlay"></div>

<!-- Modern Sidebar Styles -->
<style>
:root {
    --sidebar-width: 280px;
    --sidebar-collapsed-width: 70px;
    --sidebar-bg: #1e293b;
    --sidebar-text: #cbd5e1;
    --sidebar-text-hover: #ffffff;
    --sidebar-active-bg: #3b82f6;
    --sidebar-hover-bg: #334155;
    --sidebar-border: #334155;
    --sidebar-transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

/* Sidebar Container */
.modern-sidebar {
    position: fixed;
    top: 76px;
    left: 0;
    width: var(--sidebar-width);
    height: calc(100vh - 76px);
    background: var(--sidebar-bg);
    color: var(--sidebar-text);
    overflow-y: auto;
    overflow-x: hidden;
    transition: width var(--sidebar-transition);
    z-index: 1000;
    display: flex;
    flex-direction: column;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
}

/* Collapsed State */
.modern-sidebar[data-collapsed="true"] {
    width: var(--sidebar-collapsed-width);
}

.modern-sidebar[data-collapsed="true"] .sidebar-text,
.modern-sidebar[data-collapsed="true"] .nav-text,
.modern-sidebar[data-collapsed="true"] .nav-badge,
.modern-sidebar[data-collapsed="true"] .nav-section-title,
.modern-sidebar[data-collapsed="true"] .user-info,
.modern-sidebar[data-collapsed="true"] .sidebar-subtitle {
    opacity: 0;
    width: 0;
    overflow: hidden;
}

.modern-sidebar[data-collapsed="true"] .sidebar-header {
    padding: 1rem 0.5rem;
}

.modern-sidebar[data-collapsed="true"] .sidebar-logo {
    justify-content: center;
}

.modern-sidebar[data-collapsed="true"] .nav-item {
    justify-content: center;
    padding: 0.75rem 0.5rem;
}

.modern-sidebar[data-collapsed="true"] .nav-icon {
    margin-right: 0;
    font-size: 1.5rem;
}

.modern-sidebar[data-collapsed="true"] .user-profile {
    flex-direction: column;
    align-items: center;
}

.modern-sidebar[data-collapsed="true"] .logout-btn {
    justify-content: center;
}

/* Custom Scrollbar */
.modern-sidebar::-webkit-scrollbar {
    width: 6px;
}

.modern-sidebar::-webkit-scrollbar-track {
    background: var(--sidebar-bg);
}

.modern-sidebar::-webkit-scrollbar-thumb {
    background: var(--sidebar-border);
    border-radius: 3px;
}

.modern-sidebar::-webkit-scrollbar-thumb:hover {
    background: #475569;
}

/* Toggle Button */
.sidebar-toggle {
    position: absolute;
    top: 20px;
    right: -15px;
    width: 30px;
    height: 30px;
    background: var(--sidebar-active-bg);
    color: white;
    border: 3px solid var(--sidebar-bg);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    z-index: 1001;
    transition: all 0.3s ease;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.sidebar-toggle:hover {
    background: #2563eb;
    transform: scale(1.1);
}

.sidebar-toggle i {
    font-size: 0.875rem;
    transition: transform 0.3s ease;
}

.modern-sidebar[data-collapsed="true"] .sidebar-toggle i {
    transform: rotate(180deg);
}

/* Sidebar Header */
.sidebar-header {
    padding: 1.5rem 1rem;
    border-bottom: 1px solid var(--sidebar-border);
    flex-shrink: 0;
}

.sidebar-logo {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    margin-bottom: 0.5rem;
}

.sidebar-icon {
    font-size: 1.75rem;
    color: var(--sidebar-active-bg);
    flex-shrink: 0;
}

.sidebar-icon-sm {
    font-size: 0.875rem;
    flex-shrink: 0;
}

.sidebar-text {
    font-weight: 600;
    font-size: 1.125rem;
    white-space: nowrap;
    transition: opacity 0.3s ease;
}

.sidebar-subtitle {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.875rem;
    color: #94a3b8;
    margin-top: 0.25rem;
}

.sidebar-subtitle .sidebar-text {
    font-size: 0.875rem;
    font-weight: 400;
}

/* Navigation */
.sidebar-nav {
    flex: 1;
    padding: 1rem 0;
    overflow-y: auto;
}

.nav-section {
    margin-bottom: 1.5rem;
}

.nav-section-title {
    padding: 0.5rem 1rem;
    font-size: 0.75rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    color: #64748b;
    white-space: nowrap;
    transition: opacity 0.3s ease;
}

.nav-item {
    display: flex;
    align-items: center;
    padding: 0.75rem 1rem;
    color: var(--sidebar-text);
    text-decoration: none;
    transition: all 0.2s ease;
    cursor: pointer;
    position: relative;
}

.nav-item:hover {
    background: var(--sidebar-hover-bg);
    color: var(--sidebar-text-hover);
}

.nav-item.active {
    background: var(--sidebar-active-bg);
    color: white;
}

.nav-item.active::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 4px;
    background: white;
}

.nav-icon {
    width: 1.25rem;
    font-size: 1.25rem;
    margin-right: 0.75rem;
    flex-shrink: 0;
    transition: all 0.3s ease;
}

.nav-text {
    flex: 1;
    white-space: nowrap;
    transition: opacity 0.3s ease;
}

.nav-badge {
    font-size: 0.625rem;
    padding: 0.25rem 0.5rem;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 10px;
    white-space: nowrap;
    transition: opacity 0.3s ease;
    margin-left: auto;
}

.nav-badge.badge-primary {
    background: #3b82f6;
}

.nav-badge.badge-warning {
    background: #f59e0b;
}

.nav-badge.badge-info {
    background: #06b6d4;
}

.nav-badge.badge-success {
    background: #10b981;
}

/* Sidebar Footer */
.sidebar-footer {
    padding: 1rem;
    border-top: 1px solid var(--sidebar-border);
    flex-shrink: 0;
}

.user-profile {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    margin-bottom: 0.75rem;
    padding: 0.5rem;
    background: var(--sidebar-hover-bg);
    border-radius: 8px;
}

.user-avatar i {
    font-size: 2rem;
    color: var(--sidebar-active-bg);
}

.user-info {
    flex: 1;
    min-width: 0;
    transition: opacity 0.3s ease, width 0.3s ease;
}

.user-name {
    font-weight: 600;
    font-size: 0.875rem;
    color: white;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.user-role {
    font-size: 0.75rem;
    color: #94a3b8;
}

.logout-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    padding: 0.625rem;
    background: #dc2626;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-size: 0.875rem;
    font-weight: 500;
    transition: all 0.2s ease;
}

.logout-btn:hover {
    background: #b91c1c;
    color: white;
}

/* Mobile Toggle Button */
.mobile-toggle-btn {
    display: none;
    position: fixed;
    top: 85px;
    left: 15px;
    width: 45px;
    height: 45px;
    background: var(--sidebar-active-bg);
    color: white;
    border: none;
    border-radius: 50%;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    z-index: 1002;
    cursor: pointer;
    align-items: center;
    justify-content: center;
}

.mobile-toggle-btn:hover {
    background: #2563eb;
}

.mobile-toggle-btn i {
    font-size: 1.25rem;
}

/* Sidebar Overlay */
.sidebar-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 999;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.sidebar-overlay.show {
    display: block;
    opacity: 1;
}

/* Tooltip for Collapsed State */
.modern-sidebar[data-collapsed="true"] .nav-item:hover::after {
    content: attr(data-tooltip);
    position: absolute;
    left: calc(100% + 10px);
    top: 50%;
    transform: translateY(-50%);
    background: #1f2937;
    color: white;
    padding: 0.5rem 0.75rem;
    border-radius: 6px;
    font-size: 0.875rem;
    white-space: nowrap;
    z-index: 1002;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    pointer-events: none;
}

.modern-sidebar[data-collapsed="true"] .nav-item:hover::before {
    content: '';
    position: absolute;
    left: 100%;
    top: 50%;
    transform: translateY(-50%);
    width: 0;
    height: 0;
    border-style: solid;
    border-width: 6px 6px 6px 0;
    border-color: transparent #1f2937 transparent transparent;
    z-index: 1003;
}

/* Responsive Design */
@media (max-width: 991px) {
    .modern-sidebar {
        left: -280px;
        width: 280px !important;
    }
    
    .modern-sidebar.show {
        left: 0;
    }
    
    .modern-sidebar[data-collapsed="true"] {
        left: -280px;
    }
    
    .modern-sidebar[data-collapsed="true"] .sidebar-text,
    .modern-sidebar[data-collapsed="true"] .nav-text,
    .modern-sidebar[data-collapsed="true"] .nav-badge,
    .modern-sidebar[data-collapsed="true"] .nav-section-title,
    .modern-sidebar[data-collapsed="true"] .user-info,
    .modern-sidebar[data-collapsed="true"] .sidebar-subtitle {
        opacity: 1;
        width: auto;
    }
    
    .sidebar-toggle {
        display: none !important;
    }
    
    .mobile-toggle-btn {
        display: flex;
    }
}

@media (min-width: 992px) {
    body {
        padding-left: var(--sidebar-width);
        transition: padding-left var(--sidebar-transition);
    }
    
    body.sidebar-collapsed {
        padding-left: var(--sidebar-collapsed-width);
    }
    
    .mobile-toggle-btn {
        display: none !important;
    }
}
</style>

<!-- Modern Sidebar JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const sidebar = document.getElementById('modernSidebar');
    const toggleBtn = document.getElementById('sidebarToggleBtn');
    const mobileToggleBtn = document.getElementById('mobileToggleBtn');
    const overlay = document.getElementById('sidebarOverlay');
    
    // Load saved state
    const savedState = localStorage.getItem('modernSidebarCollapsed');
    if (savedState === 'true' && window.innerWidth >= 992) {
        sidebar.setAttribute('data-collapsed', 'true');
        document.body.classList.add('sidebar-collapsed');
    }
    
    // Desktop Toggle
    if (toggleBtn) {
        toggleBtn.addEventListener('click', function() {
            const isCollapsed = sidebar.getAttribute('data-collapsed') === 'true';
            sidebar.setAttribute('data-collapsed', !isCollapsed);
            document.body.classList.toggle('sidebar-collapsed', !isCollapsed);
            localStorage.setItem('modernSidebarCollapsed', !isCollapsed);
        });
    }
    
    // Mobile Toggle
    if (mobileToggleBtn) {
        mobileToggleBtn.addEventListener('click', function() {
            sidebar.classList.add('show');
            overlay.classList.add('show');
        });
    }
    
    // Close on Overlay Click
    if (overlay) {
        overlay.addEventListener('click', function() {
            sidebar.classList.remove('show');
            overlay.classList.remove('show');
        });
    }
    
    // Close on Link Click (Mobile)
    const navLinks = sidebar.querySelectorAll('.nav-item');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            if (window.innerWidth < 992) {
                sidebar.classList.remove('show');
                overlay.classList.remove('show');
            }
        });
    });
    
    // Handle Resize
    window.addEventListener('resize', function() {
        if (window.innerWidth >= 992) {
            sidebar.classList.remove('show');
            overlay.classList.remove('show');
            // Restore saved state
            const isCollapsed = localStorage.getItem('modernSidebarCollapsed') === 'true';
            sidebar.setAttribute('data-collapsed', isCollapsed);
            document.body.classList.toggle('sidebar-collapsed', isCollapsed);
        } else {
            sidebar.setAttribute('data-collapsed', 'false');
            document.body.classList.remove('sidebar-collapsed');
        }
    });
});
</script>
