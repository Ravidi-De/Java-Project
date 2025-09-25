<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get current user information from session
    String currentUser = (String) session.getAttribute("user_name");
    String adminUser = (String) session.getAttribute("admin_name");
    String userRole = (adminUser != null) ? "admin" : ((currentUser != null) ? "user" : "guest");
    String displayName = (adminUser != null) ? adminUser : ((currentUser != null) ? currentUser : "Guest");
    
    // Get current page context for active navigation
    String currentPage = request.getRequestURI();
    String contextPath = request.getContextPath();
%>

<nav class="navbar navbar-expand-lg railway-navbar">
    <div class="container">
        <!-- Brand Logo -->
        <a class="navbar-brand d-flex align-items-center" href="<%= contextPath %>/Home/home.jsp">
            <i class="fas fa-train me-2"></i>
            <span>Railway Reservation</span>
        </a>

        <!-- Mobile Toggle Button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navigation Menu -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Main Navigation -->
            <ul class="navbar-nav me-auto">
                <% if ("user".equals(userRole)) { %>
                    <!-- User Navigation -->
                    <li class="nav-item">
                        <a class="nav-link <%= currentPage.contains("reserve.jsp") ? "active" : "" %>" 
                           href="<%= contextPath %>/Reserve/reserve.jsp">
                            <i class="fas fa-ticket-alt me-1"></i>Reserve
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= currentPage.contains("Trains.jsp") ? "active" : "" %>" 
                           href="<%= contextPath %>/Trains.jsp">
                            <i class="fas fa-train me-1"></i>Trains
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= currentPage.contains("myReservation.jsp") ? "active" : "" %>" 
                           href="<%= contextPath %>/My_res_sv">
                            <i class="fas fa-list me-1"></i>My Reservations
                        </a>
                    </li>
                <% } else if ("admin".equals(userRole)) { %>
                    <!-- Admin Navigation -->
                    <li class="nav-item">
                        <a class="nav-link <%= currentPage.contains("admin.jsp") ? "active" : "" %>" 
                           href="<%= contextPath %>/Admin/admin.jsp">
                            <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="manageDropdown" role="button" 
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-cogs me-1"></i>Manage
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= contextPath %>/Current_users">
                                <i class="fas fa-users me-2"></i>Users</a></li>
                            <li><a class="dropdown-item" href="<%= contextPath %>/Curent_sv">
                                <i class="fas fa-user-shield me-2"></i>Admins</a></li>
                            <li><a class="dropdown-item" href="<%= contextPath %>/Cur_train_sev">
                                <i class="fas fa-train me-2"></i>Trains</a></li>
                        </ul>
                    </li>
                <% } else { %>
                    <!-- Guest Navigation -->
                    <li class="nav-item">
                        <a class="nav-link <%= currentPage.contains("home.jsp") ? "active" : "" %>" 
                           href="<%= contextPath %>/Home/home.jsp">
                            <i class="fas fa-home me-1"></i>Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= contextPath %>/Train_dao">
                            <i class="fas fa-search me-1"></i>View Trains
                        </a>
                    </li>
                <% } %>
            </ul>

            <!-- User Account Section -->
            <ul class="navbar-nav">
                <% if (!"guest".equals(userRole)) { %>
                    <!-- Logged In User -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" 
                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="user-avatar me-2">
                                <i class="fas fa-user-circle fa-lg"></i>
                            </div>
                            <span class="d-none d-md-inline">
                                <%= displayName %> 
                                <small class="text-light">(<%= userRole %>)</small>
                            </span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                                <span class="dropdown-item-text">
                                    <strong><%= displayName %></strong><br>
                                    <small class="text-muted"><%= userRole.toUpperCase() %></small>
                                </span>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <% if ("user".equals(userRole)) { %>
                                <li><a class="dropdown-item" href="<%= contextPath %>/My_res_sv">
                                    <i class="fas fa-list me-2"></i>My Profile</a></li>
                            <% } %>
                            <li><a class="dropdown-item text-danger" href="<%= contextPath %>/SignUp/login.jsp">
                                <i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                        </ul>
                    </li>
                <% } else { %>
                    <!-- Guest User - Login/Register -->
                    <li class="nav-item me-2">
                        <a class="nav-link railway-btn railway-btn-outline-primary" 
                           href="<%= contextPath %>/SignUp/login.jsp">
                            <i class="fas fa-sign-in-alt me-1"></i>Login
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link railway-btn railway-btn-primary" 
                           href="<%= contextPath %>/SignUp/registration.jsp">
                            <i class="fas fa-user-plus me-1"></i>Register
                        </a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Add some custom styles for the header -->
<style>
.user-avatar {
    width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.dropdown-menu {
    border-radius: var(--railway-radius-sm);
    box-shadow: var(--railway-shadow-lg);
    border: 1px solid rgba(0,0,0,0.1);
}

.dropdown-item:hover {
    background-color: var(--railway-light);
}

.navbar-toggler {
    border: 2px solid rgba(255,255,255,0.3);
}

.navbar-toggler:focus {
    box-shadow: 0 0 0 3px rgba(255,255,255,0.25);
}

@media (max-width: 768px) {
    .railway-navbar .container {
        padding-left: 1rem;
        padding-right: 1rem;
    }
    
    .navbar-nav {
        padding-top: 1rem;
    }
    
    .nav-link.railway-btn {
        margin: 0.25rem 0;
        text-align: center;
    }
}
</style>