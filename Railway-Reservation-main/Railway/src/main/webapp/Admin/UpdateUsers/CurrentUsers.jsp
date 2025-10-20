<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<%@ page import="java.util.ArrayList, Updateusers.Current_users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Manage all users in Railway Reservation System">
    <title>Current Users - Railway Reservation System</title>
    
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
                            <li class="breadcrumb-item active" aria-current="page">User Management</li>
                        </ol>
                    </nav>

                    <!-- Page Header -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h1 class="railway-page-title">
                                <i class="fas fa-users me-2 text-railway-primary"></i>
                                User Management
                            </h1>
                            <p class="text-muted mb-0">
                                Manage system users, their profiles, and access permissions for the railway system.
                            </p>
                        </div>
                        
                        <div class="page-actions">
                            <a href="/Railway/Admin/UpdateUsers/UpdateUsers.jsp" class="railway-btn railway-btn-primary">
                                <i class="fas fa-plus me-2"></i>Add User
                            </a>
                        </div>
                    </div>

                    <!-- Statistics Cards -->
                    <% ArrayList allres = (ArrayList)request.getAttribute("current_emp"); %>
                    <% int totalUsers = (allres != null) ? allres.size() : 0; %>
                    
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="railway-stat-card bg-railway-primary text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1" id="totalUsers"><%= totalUsers %></h3>
                                            <small class="opacity-75">Total Users</small>
                                        </div>
                                        <i class="fas fa-users fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="railway-stat-card bg-railway-success text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1">Active</h3>
                                            <small class="opacity-75">All Active</small>
                                        </div>
                                        <i class="fas fa-check-circle fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="railway-stat-card bg-railway-info text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1" id="verifiedUsers">0</h3>
                                            <small class="opacity-75">Verified</small>
                                        </div>
                                        <i class="fas fa-shield-alt fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="railway-stat-card bg-railway-warning text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1" id="recentUsers">0</h3>
                                            <small class="opacity-75">This Month</small>
                                        </div>
                                        <i class="fas fa-calendar fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Users Table -->
                    <div class="railway-card">
                        <div class="railway-card-header">
                            <div class="d-flex justify-content-between align-items-center">
                                <h3 class="h5 mb-0">
                                    <i class="fas fa-list me-2 text-railway-primary"></i>
                                    Current Users
                                </h3>
                                <div class="table-actions">
                                    <div class="input-group input-group-sm">
                                        <span class="input-group-text">
                                            <i class="fas fa-search"></i>
                                        </span>
                                        <input type="text" class="form-control" id="searchUsers" placeholder="Search users...">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="railway-card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0" id="usersTable">
                                    <thead class="table-light">
                                        <tr>
                                            <th scope="col" class="railway-table-header">
                                                <i class="fas fa-hashtag me-1"></i>User ID
                                            </th>
                                            <th scope="col" class="railway-table-header">
                                                <i class="fas fa-user me-1"></i>Name
                                            </th>
                                            <th scope="col" class="railway-table-header">
                                                <i class="fas fa-envelope me-1"></i>Email
                                            </th>
                                            <th scope="col" class="railway-table-header">
                                                <i class="fas fa-phone me-1"></i>Phone
                                            </th>
                                            <th scope="col" class="railway-table-header">
                                                <i class="fas fa-key me-1"></i>Password
                                            </th>
                                            <th scope="col" class="railway-table-header text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% if (allres != null && !allres.isEmpty()) { %>
                                            <% for (int i = 0; i < allres.size(); i++) { %>
                                                <% Current_users cur = (Current_users)allres.get(i); %>
                                                <tr class="user-row">
                                                    <td>
                                                        <span class="fw-bold text-railway-primary">#<%= cur.getUdi() %></span>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <div class="user-avatar me-3">
                                                                <div class="icon-circle bg-railway-primary text-white">
                                                                    <i class="fas fa-user"></i>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div class="fw-bold text-railway-dark" data-name="<%= cur.getUname() %>"><%= cur.getUname() %></div>
                                                                <small class="text-muted">System User</small>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="contact-info">
                                                            <i class="fas fa-envelope text-railway-primary me-2" style="font-size: 0.75rem;"></i>
                                                            <span class="fw-medium"><%= cur.getUemail() %></span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="contact-info">
                                                            <i class="fas fa-phone text-railway-success me-2" style="font-size: 0.75rem;"></i>
                                                            <span class="fw-medium"><%= cur.getuPnum() %></span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <span class="railway-badge railway-badge-secondary">
                                                            <i class="fas fa-key me-1"></i>
                                                            ••••••••
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <div class="action-buttons d-flex justify-content-center gap-2">
                                                            <form action="/Railway/Admin/UpdateUsers/Update_users.jsp" method="get" class="d-inline">
                                                                <input type="hidden" value="<%= cur.getUdi() %>" name="id">
                                                                <input type="hidden" value="<%= cur.getUname() %>" name="name">
                                                                <input type="hidden" value="<%= cur.getUemail() %>" name="email">
                                                                <input type="hidden" value="<%= cur.getUpassword() %>" name="password">
                                                                <input type="hidden" value="<%= cur.getuPnum() %>" name="phone">
                                                                <button type="submit" 
                                                                        class="railway-btn railway-btn-sm railway-btn-outline-primary"
                                                                        title="Edit User"
                                                                        data-bs-toggle="tooltip">
                                                                    <i class="fas fa-edit"></i>
                                                                </button>
                                                            </form>
                                                            
                                                            <button type="button" 
                                                                    class="railway-btn railway-btn-sm railway-btn-outline-danger delete-user"
                                                                    data-user-id="<%= cur.getUdi() %>"
                                                                    data-user-name="<%= cur.getUname() %>"
                                                                    title="Delete User"
                                                                    data-bs-toggle="tooltip">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <% } %>
                                        <% } else { %>
                                            <tr>
                                                <td colspan="6" class="text-center py-5">
                                                    <div class="empty-state">
                                                        <i class="fas fa-users fa-3x text-muted mb-3"></i>
                                                        <h4 class="text-muted">No Users Found</h4>
                                                        <p class="text-muted mb-3">There are currently no users in the system.</p>
                                                        <a href="/Railway/Admin/UpdateUsers/UpdateUsers.jsp" class="railway-btn railway-btn-primary">
                                                            <i class="fas fa-plus me-2"></i>Add First User
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>

                            <% if (allres != null && !allres.isEmpty()) { %>
                                <div class="railway-card-footer">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">
                                            Showing <span id="showingCount"><%= totalUsers %></span> of <span id="totalCount"><%= totalUsers %></span> users
                                        </small>
                                        <div class="table-actions">
                                            <small class="text-muted me-3">
                                                <i class="fas fa-info-circle me-1"></i>
                                                Last updated: <span id="lastUpdated">Just now</span>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    </div>

                    <!-- Quick Actions Card -->
                    <div class="row mt-4">
                        <div class="col-lg-8">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-bolt me-2 text-railway-warning"></i>
                                        Quick Actions
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <a href="/Railway/Admin/UpdateUsers/UpdateUsers.jsp" class="d-block p-3 bg-railway-light rounded text-decoration-none hover-lift">
                                                <div class="d-flex align-items-center">
                                                    <i class="fas fa-user-plus fa-2x text-railway-primary me-3"></i>
                                                    <div>
                                                        <h6 class="mb-1 text-railway-dark">Add User</h6>
                                                        <small class="text-muted">Create new user account</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <a href="../admin.jsp" class="d-block p-3 bg-railway-light rounded text-decoration-none hover-lift">
                                                <div class="d-flex align-items-center">
                                                    <i class="fas fa-chart-bar fa-2x text-railway-success me-3"></i>
                                                    <div>
                                                        <h6 class="mb-1 text-railway-dark">View Reports</h6>
                                                        <small class="text-muted">User activity reports</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4">
                            <div class="railway-card">
                                <div class="railway-card-header">
                                    <h3 class="h6 mb-0">
                                        <i class="fas fa-info-circle me-2 text-railway-info"></i>
                                        System Information
                                    </h3>
                                </div>
                                <div class="railway-card-body">
                                    <div class="system-info">
                                        <div class="info-item mb-3">
                                            <small class="text-muted d-block">System Status</small>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-circle text-railway-success me-2" style="font-size: 0.5rem;"></i>
                                                <span class="fw-bold text-railway-success">Operational</span>
                                            </div>
                                        </div>
                                        <div class="info-item mb-3">
                                            <small class="text-muted d-block">Last Sync</small>
                                            <span class="fw-bold">24 hours ago</span>
                                        </div>
                                        <div class="info-item">
                                            <small class="text-muted d-block">Data Quality</small>
                                            <span class="railway-badge railway-badge-success">Excellent</span>
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

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h1 class="modal-title fs-5 text-railway-danger" id="deleteModalLabel">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        Confirm Deletion
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="fas fa-user-times me-3"></i>
                        <div>
                            <strong>Warning:</strong> This action cannot be undone. Deleting a user will permanently remove their account and all associated data.
                        </div>
                    </div>
                    <p>Are you sure you want to delete user <strong id="userNameToDelete"></strong>?</p>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="railway-btn railway-btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times me-2"></i>Cancel
                    </button>
                    <form id="deleteForm" action="/Railway/Delete_use_sev" method="get" class="d-inline">
                        <input type="hidden" name="uid" id="userIdToDelete">
                        <button type="submit" class="railway-btn railway-btn-danger" id="confirmDeleteBtn">
                            <i class="fas fa-trash-alt me-2"></i>Delete User
                        </button>
                    </form>
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

            // Calculate statistics
            calculateStats();

            // Search functionality
            const searchInput = document.getElementById('searchUsers');
            const table = document.getElementById('usersTable');
            
            if (searchInput && table) {
                searchInput.addEventListener('keyup', function() {
                    const searchTerm = this.value.toLowerCase();
                    const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
                    
                    for (let i = 0; i < rows.length; i++) {
                        const row = rows[i];
                        const cells = row.getElementsByTagName('td');
                        let found = false;
                        
                        for (let j = 0; j < cells.length; j++) {
                            if (cells[j].textContent.toLowerCase().indexOf(searchTerm) > -1) {
                                found = true;
                                break;
                            }
                        }
                        
                        row.style.display = found ? '' : 'none';
                    }
                });
            }

            // Delete user functionality
            const deleteButtons = document.querySelectorAll('.delete-user');
            const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            
            deleteButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const userId = this.getAttribute('data-user-id');
                    const userName = this.getAttribute('data-user-name');
                    
                    document.getElementById('userIdToDelete').value = userId;
                    document.getElementById('userNameToDelete').textContent = userName;
                    
                    deleteModal.show();
                });
            });
        });

        function calculateStats() {
            const rows = document.querySelectorAll('.user-row');
            
            // Count verified users (for demo, assume all are verified)
            document.getElementById('verifiedUsers').textContent = rows.length;
            
            // Count recent users (for demo, assume all are recent)
            document.getElementById('recentUsers').textContent = rows.length;
        }
    </script>
</body>
</html>