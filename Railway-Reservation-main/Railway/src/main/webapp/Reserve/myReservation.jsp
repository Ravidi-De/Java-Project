<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, Reservation.My_current_res" %>
<%
String Username = (String)session.getAttribute("user_name");
if(Username == null) {
    response.sendRedirect("../SignUp/login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Reservations - Railway System</title>
    
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Railway Theme CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/railway-theme.css">
    
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding-top: 76px;
            padding-bottom: 3rem;
        }
        
        .page-header {
            background: linear-gradient(135deg, rgba(30, 64, 175, 0.95), rgba(14, 165, 233, 0.95));
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 24px 24px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .page-header h1 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .stats-row {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .stat-box {
            flex: 1;
            background: white;
            border-radius: 16px;
            padding: 1.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        .stat-box i {
            font-size: 2.5rem;
            color: var(--railway-primary);
            margin-bottom: 0.5rem;
        }
        
        .stat-box h3 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--railway-dark);
            margin-bottom: 0.25rem;
        }
        
        .stat-box p {
            color: var(--railway-secondary);
            margin: 0;
            font-size: 0.9rem;
        }
        
        .reservations-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            overflow: hidden;
        }
        
        .card-header-custom {
            background: linear-gradient(135deg, var(--railway-primary), var(--railway-accent));
            color: white;
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .card-header-custom h4 {
            margin: 0;
            font-weight: 600;
            font-size: 1.5rem;
        }
        
        .table-container {
            padding: 2rem;
        }
        
        .reservation-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
        }
        
        .reservation-table thead th {
            background: var(--railway-light);
            color: var(--railway-dark);
            font-weight: 600;
            padding: 1rem;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            border: none;
        }
        
        .reservation-table thead th:first-child {
            border-radius: 12px 0 0 12px;
        }
        
        .reservation-table thead th:last-child {
            border-radius: 0 12px 12px 0;
        }
        
        .reservation-table tbody tr {
            background: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }
        
        .reservation-table tbody tr:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            transform: translateY(-2px);
        }
        
        .reservation-table tbody td {
            padding: 1.25rem 1rem;
            border: none;
            vertical-align: middle;
        }
        
        .reservation-table tbody td:first-child {
            border-radius: 12px 0 0 12px;
        }
        
        .reservation-table tbody td:last-child {
            border-radius: 0 12px 12px 0;
        }
        
        .route-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            background: var(--railway-light);
            border-radius: 20px;
            font-weight: 500;
        }
        
        .route-badge i {
            color: var(--railway-primary);
        }
        
        .btn-action {
            border-radius: 10px;
            padding: 0.5rem 1rem;
            font-weight: 500;
            border: none;
            transition: all 0.3s ease;
        }
        
        .btn-update {
            background: linear-gradient(135deg, #22c55e, #16a34a);
            color: white;
        }
        
        .btn-update:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 197, 94, 0.4);
            color: white;
        }
        
        .btn-delete {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
        }
        
        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.4);
            color: white;
        }
        
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
        }
        
        .empty-state i {
            font-size: 5rem;
            color: var(--railway-secondary);
            opacity: 0.3;
            margin-bottom: 1rem;
        }
        
        .empty-state h4 {
            color: var(--railway-dark);
            margin-bottom: 0.5rem;
        }
        
        .empty-state p {
            color: var(--railway-secondary);
            margin-bottom: 1.5rem;
        }
        
        @media (max-width: 768px) {
            .stats-row {
                flex-direction: column;
            }
            
            .table-container {
                padding: 1rem;
                overflow-x: auto;
            }
            
            .reservation-table {
                min-width: 800px;
            }
        }
    </style>
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="/shared/header.jsp">
        <jsp:param name="pageTitle" value="My Reservations"/>
    </jsp:include>
    
    <!-- Page Header -->
    <div class="page-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <h1><i class="fas fa-list-alt me-3"></i>My Reservations</h1>
                    <p class="mb-0">Manage your train bookings and reservations</p>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a href="reserve.jsp" class="btn btn-light btn-lg">
                        <i class="fas fa-plus-circle me-2"></i>
                        New Reservation
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        <% 
        ArrayList allres = (ArrayList)request.getAttribute("My_current_res");
        int totalReservations = (allres != null) ? allres.size() : 0;
        %>
        
        <!-- Statistics -->
        <div class="stats-row">
            <div class="stat-box">
                <i class="fas fa-ticket-alt"></i>
                <h3><%= totalReservations %></h3>
                <p>Active Reservations</p>
            </div>
            <div class="stat-box">
                <i class="fas fa-user-circle"></i>
                <h3>1</h3>
                <p>Account</p>
            </div>
            <div class="stat-box">
                <i class="fas fa-train"></i>
                <h3>50+</h3>
                <p>Available Routes</p>
            </div>
        </div>
        
        <!-- Reservations Table -->
        <div class="reservations-card">
            <div class="card-header-custom">
                <h4><i class="fas fa-clipboard-list me-2"></i>Your Bookings</h4>
                <span class="badge bg-white text-primary fs-6"><%= totalReservations %> Total</span>
            </div>
            
            <div class="table-container">
                <% if (allres != null && allres.size() > 0) { %>
                    <table class="reservation-table">
                        <thead>
                            <tr>
                                <th><i class="fas fa-user me-2"></i>Name</th>
                                <th><i class="fas fa-envelope me-2"></i>Email</th>
                                <th><i class="fas fa-phone me-2"></i>Phone</th>
                                <th><i class="fas fa-route me-2"></i>Route</th>
                                <th><i class="fas fa-users me-2"></i>PAX</th>
                                <th class="text-center"><i class="fas fa-cog me-2"></i>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(int i = 0; i < allres.size(); i++) { 
                                My_current_res my_c = (My_current_res)allres.get(i);
                            %>
                            <tr>
                                <td>
                                    <strong><%= my_c.getRname() %></strong>
                                </td>
                                <td>
                                    <small class="text-muted"><%= my_c.getRemail() %></small>
                                </td>
                                <td>
                                    <span class="badge bg-primary"><%= my_c.getRphone() %></span>
                                </td>
                                <td>
                                    <div class="route-badge">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <%= my_c.getRfrom() %>
                                        <i class="fas fa-arrow-right"></i>
                                        <%= my_c.getRto() %>
                                    </div>
                                </td>
                                <td>
                                    <span class="badge bg-info"><%= my_c.getRpax() %> passengers</span>
                                </td>
                                <td>
                                    <div class="d-flex gap-2 justify-content-center">
                                        <form action="UpdateReservation.jsp" method="get" style="display: inline;">
                                            <input type="hidden" value="<%= my_c.getRid() %>" name="id">
                                            <input type="hidden" value="<%= my_c.getRname() %>" name="name">
                                            <input type="hidden" value="<%= my_c.getRphone() %>" name="phone">
                                            <input type="hidden" value="<%= my_c.getRfrom() %>" name="from">
                                            <input type="hidden" value="<%= my_c.getRto() %>" name="to">
                                            <input type="hidden" value="<%= my_c.getRemail() %>" name="mail">
                                            <input type="hidden" value="<%= my_c.getRpax() %>" name="pax">
                                            <button type="submit" class="btn btn-update btn-sm" title="Update Reservation">
                                                <i class="fas fa-edit me-1"></i>Edit
                                            </button>
                                        </form>
                                        
                                        <form action="../Del_reser_sev" method="get" style="display: inline;" 
                                              onsubmit="return confirm('Are you sure you want to cancel this reservation?');">
                                            <input type="hidden" value="<%= my_c.getRid() %>" name="id">
                                            <button type="submit" class="btn btn-delete btn-sm" title="Delete Reservation">
                                                <i class="fas fa-trash-alt me-1"></i>Delete
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } else { %>
                    <!-- Empty State -->
                    <div class="empty-state">
                        <i class="fas fa-ticket-alt"></i>
                        <h4>No Reservations Found</h4>
                        <p class="text-muted">You haven't made any reservations yet.</p>
                        <a href="reserve.jsp" class="btn btn-primary btn-lg">
                            <i class="fas fa-plus-circle me-2"></i>
                            Make Your First Reservation
                        </a>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
    
    <!-- Include Footer -->
    <jsp:include page="/shared/footer.jsp"/>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
