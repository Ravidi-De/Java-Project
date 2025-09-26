<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<%@ page import="java.util.ArrayList, UpdateAdmin.Current_users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Manage all administrators in Railway Reservation System">
    <title>Current Administrators - Railway Reservation System</title>
    
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
                            <li class="breadcrumb-item active" aria-current="page">Administrator Management</li>
                        </ol>
                    </nav>

                    <!-- Page Header -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h1 class="railway-page-title">
                                <i class="fas fa-users-cog me-2 text-railway-primary"></i>
                                Administrator Management
                            </h1>
                            <p class="text-muted mb-0">
                                Manage system administrators, add new admins, and control access privileges.
                            </p>
                        </div>
                        
                        <div class="page-actions">
                            <a href="/Railway/Admin/updateAdmin/UpdateAdmin.jsp" class="railway-btn railway-btn-primary">
                                <i class="fas fa-user-plus me-2"></i>Add Administrator
                            </a>
                        </div>
                    </div>

                    <!-- Statistics Cards -->
                    <% ArrayList allres = (ArrayList)request.getAttribute("current_emp"); %>
                    <% int totalAdmins = (allres != null) ? allres.size() : 0; %>
                    
                    <div class="row mb-4">
                        <div class="col-md-4">
                            <div class="railway-stat-card bg-railway-primary text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1" id="totalAdmins"><%= totalAdmins %></h3>
                                            <small class="opacity-75">Total Administrators</small>
                                        </div>
                                        <i class="fas fa-user-shield fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
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
                        <div class="col-md-4">
                            <div class="railway-stat-card bg-railway-info text-white">
                                <div class="railway-stat-card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h3 class="mb-1">Full Access</h3>
                                            <small class="opacity-75">Admin Privileges</small>
                                        </div>
                                        <i class="fas fa-key fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Search and Filter Section -->
                    <div class="railway-card mb-4">
                        <div class="railway-card-body">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <div class="search-container position-relative">
                                        <input type="text" 
                                               class="railway-form-control ps-5" 
                                               id="adminSearch" 
                                               placeholder="Search administrators by name..."
                                               autocomplete="off">
                                        <i class="fas fa-search position-absolute top-50 start-0 translate-middle-y ms-3 text-muted"></i>
                                    </div>
                                </div>
                                <div class="col-md-6 text-md-end mt-3 mt-md-0">
                                    <div class="d-flex justify-content-md-end gap-2">
                                        <button class="railway-btn railway-btn-outline-primary" id="refreshBtn">
                                            <i class="fas fa-sync-alt me-2"></i>Refresh
                                        </button>
                                        <div class="dropdown">
                                            <button class="railway-btn railway-btn-outline-secondary dropdown-toggle" 
                                                    type="button" 
                                                    id="sortDropdown" 
                                                    data-bs-toggle="dropdown">
                                                <i class="fas fa-sort me-2"></i>Sort By
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#" data-sort="name">Name (A-Z)</a></li>
                                                <li><a class="dropdown-item" href="#" data-sort="name-desc">Name (Z-A)</a></li>
                                                <li><a class="dropdown-item" href="#" data-sort="id">ID (Low to High)</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Administrators Table -->
                    <div class="railway-card">
                        <div class="railway-card-header">
                            <h3 class="h5 mb-0">
                                <i class="fas fa-list me-2 text-railway-primary"></i>
                                Administrator List
                            </h3>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="railway-table" id="adminsTable">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-hashtag me-2 text-muted"></i>
                                                Admin ID
                                            </div>
                                        </th>
                                        <th scope="col">
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-user me-2 text-muted"></i>
                                                Administrator Name
                                            </div>
                                        </th>
                                        <th scope="col">
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-key me-2 text-muted"></i>
                                                Password
                                            </div>
                                        </th>
                                        <th scope="col">
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-shield-alt me-2 text-muted"></i>
                                                Role
                                            </div>
                                        </th>
                                        <th scope="col" class="text-center">
                                            <div class="d-flex align-items-center justify-content-center">
                                                <i class="fas fa-cogs me-2 text-muted"></i>
                                                Actions
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (allres != null && !allres.isEmpty()) { %>
                                        <% for (int i = 0; i < allres.size(); i++) { %>
                                            <% Current_users cur = (Current_users)allres.get(i); %>
                                            <tr class="admin-row">
                                                <td>
                                                    <span class="fw-bold text-railway-primary">#<%= cur.getUdi() %></span>
                                                </td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <div class="admin-avatar me-3">
                                                            <div class="avatar-circle bg-railway-primary text-white">
                                                                <%= cur.getUname().substring(0,1).toUpperCase() %>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="fw-bold text-railway-dark" data-name="<%= cur.getUname() %>"><%= cur.getUname() %></div>
                                                            <small class="text-muted">System Administrator</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="password-display">
                                                        <span class="password-hidden">••••••••</span>
                                                        <button type="button" 
                                                                class="btn btn-link btn-sm p-0 ms-2 toggle-password"
                                                                data-password="<%= cur.getUpassword() %>"
                                                                title="Show/Hide Password">
                                                            <i class="fas fa-eye text-muted"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                                <td>
                                                    <span class="railway-badge railway-badge-warning">
                                                        <i class="fas fa-crown me-1"></i>
                                                        Super Admin
                                                    </span>
                                                </td>
                                                <td>
                                                    <div class="action-buttons d-flex justify-content-center gap-2">
                                                        <form action="Update_admin_details.jsp" method="get" class="d-inline">
                                                            <input type="hidden" value="<%= cur.getUdi() %>" name="adi">
                                                            <input type="hidden" value="<%= cur.getUname() %>" name="aname">
                                                            <input type="hidden" value="<%= cur.getUpassword() %>" name="apss">
                                                            <button type="submit" 
                                                                    class="railway-btn railway-btn-sm railway-btn-outline-primary"
                                                                    title="Edit Administrator"
                                                                    data-bs-toggle="tooltip">
                                                                <i class="fas fa-edit"></i>
                                                            </button>
                                                        </form>
                                                        
                                                        <button type="button" 
                                                                class="railway-btn railway-btn-sm railway-btn-outline-danger delete-admin"
                                                                data-admin-id="<%= cur.getUdi() %>"
                                                                data-admin-name="<%= cur.getUname() %>"
                                                                title="Delete Administrator"
                                                                data-bs-toggle="tooltip">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        <% } %>
                                    <% } else { %>
                                        <tr>
                                            <td colspan="5" class="text-center py-5">
                                                <div class="empty-state">
                                                    <i class="fas fa-users fa-3x text-muted mb-3"></i>
                                                    <h4 class="text-muted">No Administrators Found</h4>
                                                    <p class="text-muted mb-3">There are currently no administrators in the system.</p>
                                                    <a href="/Railway/Admin/updateAdmin/UpdateAdmin.jsp" class="railway-btn railway-btn-primary">
                                                        <i class="fas fa-user-plus me-2"></i>Add First Administrator
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
                                        Showing <span id="showingCount"><%= totalAdmins %></span> of <span id="totalCount"><%= totalAdmins %></span> administrators
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
                                            <a href="/Railway/Admin/updateAdmin/UpdateAdmin.jsp" class="d-block p-3 bg-railway-light rounded text-decoration-none hover-lift">
                                                <div class="d-flex align-items-center">
                                                    <i class="fas fa-user-plus fa-2x text-railway-primary me-3"></i>
                                                    <div>
                                                        <h6 class="mb-1 text-railway-dark">Add Administrator</h6>
                                                        <small class="text-muted">Create new admin account</small>
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
                                                        <small class="text-muted">System activity reports</small>
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
                                            <small class="text-muted d-block">Last Backup</small>
                                            <span class="fw-bold">24 hours ago</span>
                                        </div>
                                        <div class="info-item">
                                            <small class="text-muted d-block">Security Level</small>
                                            <span class="railway-badge railway-badge-success">High</span>
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
                        <i class="fas fa-shield-alt me-3"></i>
                        <div>
                            <strong>Warning:</strong> This action cannot be undone. Deleting an administrator will permanently remove their access to the system.
                        </div>
                    </div>
                    <p>Are you sure you want to delete administrator <strong id="adminNameToDelete"></strong>?</p>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="railway-btn railway-btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times me-2"></i>Cancel
                    </button>
                    <form id="deleteForm" action="../../Del_admin_suv" method="get" class="d-inline">
                        <input type="hidden" name="adminId" id="adminIdToDelete">
                        <button type="submit" class="railway-btn railway-btn-danger" id="confirmDeleteBtn">
                            <i class="fas fa-trash-alt me-2"></i>Delete Administrator
                        </button>
                    </form>
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
            const adminSearch = document.getElementById('adminSearch');
            const adminRows = document.querySelectorAll('.admin-row');
            const deleteButtons = document.querySelectorAll('.delete-admin');
            const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            const togglePasswordBtns = document.querySelectorAll('.toggle-password');
            const refreshBtn = document.getElementById('refreshBtn');
            const sortButtons = document.querySelectorAll('[data-sort]');
            
            // Initialize tooltips
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
            
            // Search functionality
            adminSearch.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase().trim();
                let visibleCount = 0;
                
                adminRows.forEach(row => {
                    const adminName = row.querySelector('[data-name]').getAttribute('data-name').toLowerCase();
                    const shouldShow = adminName.includes(searchTerm);
                    
                    if (shouldShow) {
                        row.style.display = '';
                        visibleCount++;
                        // Highlight search term
                        if (searchTerm) {
                            highlightSearchTerm(row, searchTerm);
                        } else {
                            removeHighlight(row);
                        }
                    } else {
                        row.style.display = 'none';
                    }
                });
                
                // Update showing count
                document.getElementById('showingCount').textContent = visibleCount;
                
                // Show no results message
                if (visibleCount === 0 && adminRows.length > 0) {
                    showNoResults();
                } else {
                    hideNoResults();
                }
            });
            
            function highlightSearchTerm(row, searchTerm) {
                const nameElement = row.querySelector('.fw-bold.text-railway-dark');
                const originalText = nameElement.getAttribute('data-original-text') || nameElement.textContent;
                nameElement.setAttribute('data-original-text', originalText);
                
                const regex = new RegExp('(' + escapeRegex(searchTerm) + ')', 'gi');
                const highlightedText = originalText.replace(regex, '<mark class="bg-railway-warning text-railway-dark">$1</mark>');
                nameElement.innerHTML = highlightedText;
            }
            
            function removeHighlight(row) {
                const nameElement = row.querySelector('.fw-bold.text-railway-dark');
                const originalText = nameElement.getAttribute('data-original-text');
                if (originalText) {
                    nameElement.textContent = originalText;
                    nameElement.removeAttribute('data-original-text');
                }
            }
            
            function escapeRegex(string) {
                var regexPattern = '[.*+?^$' + '{}' + '()|[\\]\\\\]';
                return string.replace(new RegExp(regexPattern, 'g'), '\\$&');
            }
            
            function showNoResults() {
                if (!document.querySelector('.search-no-results')) {
                    const tbody = document.querySelector('#adminsTable tbody');
                    const noResultsRow = document.createElement('tr');
                    noResultsRow.className = 'search-no-results';
                    noResultsRow.innerHTML = `
                        <td colspan="5" class="text-center py-5">
                            <div class="empty-state">
                                <i class="fas fa-search fa-3x text-muted mb-3"></i>
                                <h4 class="text-muted">No administrators match your search</h4>
                                <p class="text-muted mb-3">Try adjusting your search criteria or clear the search to view all administrators.</p>
                                <button class="railway-btn railway-btn-primary" onclick="document.getElementById('adminSearch').value=''; document.getElementById('adminSearch').dispatchEvent(new Event('input'));">
                                    <i class="fas fa-times me-2"></i>Clear Search
                                </button>
                            </div>
                        </td>
                    `;
                    tbody.appendChild(noResultsRow);
                }
            }
            
            function hideNoResults() {
                const noResultsRow = document.querySelector('.search-no-results');
                if (noResultsRow) {
                    noResultsRow.remove();
                }
            }
            
            // Password toggle functionality
            togglePasswordBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    const passwordSpan = this.closest('.password-display').querySelector('.password-hidden');
                    const icon = this.querySelector('i');
                    const actualPassword = this.getAttribute('data-password');
                    
                    if (passwordSpan.textContent === '••••••••') {
                        passwordSpan.textContent = actualPassword;
                        icon.classList.remove('fa-eye');
                        icon.classList.add('fa-eye-slash');
                        this.title = 'Hide Password';
                    } else {
                        passwordSpan.textContent = '••••••••';
                        icon.classList.remove('fa-eye-slash');
                        icon.classList.add('fa-eye');
                        this.title = 'Show Password';
                    }
                });
            });
            
            // Delete functionality
            deleteButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const adminId = this.getAttribute('data-admin-id');
                    const adminName = this.getAttribute('data-admin-name');
                    
                    document.getElementById('adminNameToDelete').textContent = adminName;
                    document.getElementById('adminIdToDelete').value = adminId;
                    deleteModal.show();
                });
            });
            
            // Refresh functionality
            refreshBtn.addEventListener('click', function() {
                const originalContent = this.innerHTML;
                Railway.utils.showLoading(this, 'Refreshing...');
                
                setTimeout(() => {
                    location.reload();
                }, 1000);
            });
            
            // Sort functionality
            sortButtons.forEach(button => {
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    const sortType = this.getAttribute('data-sort');
                    sortAdmins(sortType);
                    
                    // Update dropdown text
                    document.getElementById('sortDropdown').innerHTML = '<i class="fas fa-sort me-2"></i>' + this.textContent;
                });
            });
            
            function sortAdmins(sortType) {
                const tbody = document.querySelector('#adminsTable tbody');
                const rows = Array.from(adminRows);
                
                rows.sort((a, b) => {
                    const nameA = a.querySelector('[data-name]').getAttribute('data-name');
                    const nameB = b.querySelector('[data-name]').getAttribute('data-name');
                    const idA = parseInt(a.querySelector('.text-railway-primary').textContent.replace('#', ''));
                    const idB = parseInt(b.querySelector('.text-railway-primary').textContent.replace('#', ''));
                    
                    switch(sortType) {
                        case 'name':
                            return nameA.localeCompare(nameB);
                        case 'name-desc':
                            return nameB.localeCompare(nameA);
                        case 'id':
                            return idA - idB;
                        default:
                            return 0;
                    }
                });
                
                // Re-append sorted rows
                rows.forEach(row => tbody.appendChild(row));
                
                Railway.notifications.success('Administrators sorted by ' + sortType.replace('-desc', ' (descending)') + '.');
            }
            
            // Update last updated time
            function updateLastUpdatedTime() {
                const now = new Date();
                const timeString = now.toLocaleTimeString();
                const lastUpdatedElement = document.getElementById('lastUpdated');
                if (lastUpdatedElement) {
                    lastUpdatedElement.textContent = timeString;
                }
            }
            
            // Update time every minute
            setInterval(updateLastUpdatedTime, 60000);
            
            // Show welcome message if administrators exist
            if (adminRows.length > 0) {
                Railway.notifications.info('Loaded ' + adminRows.length + ' administrator' + (adminRows.length === 1 ? '' : 's') + '.', 3000);
            }
        });
    </script>

    <!-- Additional Styles -->
    <style>
        .admin-avatar .avatar-circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 1rem;
        }
        
        .hover-lift {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        
        .hover-lift:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .action-buttons .railway-btn {
            transition: all 0.2s ease;
        }
        
        .action-buttons .railway-btn:hover {
            transform: scale(1.05);
        }
        
        .search-container input:focus {
            box-shadow: 0 0 0 0.2rem rgba(30, 64, 175, 0.25);
            border-color: var(--railway-primary);
        }
        
        .empty-state i {
            opacity: 0.5;
        }
        
        .info-item:not(:last-child) {
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            padding-bottom: 0.75rem;
        }
        
        .password-display {
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
        }
        
        .password-hidden {
            color: var(--railway-primary);
            font-weight: 500;
        }
        
        .toggle-password {
            border: none !important;
            background: none !important;
        }
        
        .toggle-password:hover i {
            color: var(--railway-primary) !important;
        }
        
        mark {
            padding: 0.1em 0.2em;
            border-radius: 0.25rem;
        }
        
        @media (max-width: 768px) {
            .page-actions {
                margin-top: 1rem;
            }
            
            .d-flex.justify-content-md-end {
                justify-content: center !important;
            }
            
            .table-responsive {
                border-radius: 0.5rem;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 0.25rem !important;
            }
        }
    </style>
</body>
</html>