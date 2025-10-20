<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get page parameters
    String pageTitle = request.getParameter("title");
    String contentPage = request.getParameter("contentPage");
    String additionalCSS = request.getParameter("additionalCSS");
    String additionalJS = request.getParameter("additionalJS");
    String pageDescription = request.getParameter("description");
    String bodyClass = request.getParameter("bodyClass");
    
    // Set defaults
    if (pageTitle == null) pageTitle = "Railway Reservation System";
    if (pageDescription == null) pageDescription = "Modern railway ticket booking and reservation system";
    if (bodyClass == null) bodyClass = "";
    
    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="<%= pageDescription %>">
    <meta name="keywords" content="railway, reservation, booking, train, tickets, travel">
    <meta name="author" content="Railway Reservation System">
    
    <title><%= pageTitle %></title>
    
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<%= contextPath %>/images/favicon.ico">
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    
    <!-- Font Awesome 6.4.0 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" 
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" 
          crossorigin="anonymous" referrerpolicy="no-referrer">
    
    <!-- Google Fonts - Inter & Roboto -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- Railway Custom Theme -->
    <link href="<%= contextPath %>/css/railway-theme.css" rel="stylesheet">
    
    <!-- Additional CSS if specified -->
    <% if (additionalCSS != null && !additionalCSS.trim().isEmpty()) { %>
        <link href="<%= contextPath %>/<%= additionalCSS %>" rel="stylesheet">
    <% } %>
    
    <!-- Page-specific meta tags for better SEO -->
    <meta property="og:title" content="<%= pageTitle %>">
    <meta property="og:description" content="<%= pageDescription %>">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Railway Reservation System">
    
    <!-- Structured Data for SEO -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "WebApplication",
        "name": "Railway Reservation System",
        "description": "<%= pageDescription %>",
        "applicationCategory": "TravelApplication",
        "operatingSystem": "Web Browser"
    }
    </script>
</head>
<body class="<%= bodyClass %> railway-fade-in">
    <!-- Skip to main content link for accessibility -->
    <a href="#main-content" class="visually-hidden-focusable btn btn-primary position-absolute" 
       style="top: 10px; left: 10px; z-index: 9999;">
        Skip to main content
    </a>

    <!-- Global Loading Indicator -->
    <div id="loading-indicator" class="d-none position-fixed top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center" 
         style="background: rgba(255,255,255,0.9); z-index: 9998;">
        <div class="spinner-border text-railway-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <!-- Include unified header -->
    <jsp:include page="/shared/header.jsp" />

    <!-- Main content wrapper -->
    <div class="main-wrapper" style="min-height: calc(100vh - 76px);">
        <!-- Breadcrumb navigation (optional) -->
        <% if (request.getParameter("showBreadcrumb") != null) { %>
            <div class="container mt-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<%= contextPath %>/Home/home.jsp">Home</a></li>
                        <!-- Dynamic breadcrumb items can be added here -->
                        <li class="breadcrumb-item active" aria-current="page"><%= pageTitle %></li>
                    </ol>
                </nav>
            </div>
        <% } %>

        <!-- Main content area -->
        <main id="main-content" class="main-content" role="main">
            <% if (contentPage != null && !contentPage.trim().isEmpty()) { %>
                <!-- Include the specified content page -->
                <jsp:include page="<%= contentPage %>" />
            <% } else { %>
                <!-- Default content when no contentPage is specified -->
                <div class="container my-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 text-center">
                            <div class="railway-card">
                                <i class="fas fa-exclamation-triangle fa-3x text-railway-warning mb-3"></i>
                                <h2 class="h4 text-railway-dark mb-3">No Content Specified</h2>
                                <p class="text-muted mb-4">
                                    Please specify a content page to display using the 'contentPage' parameter.
                                </p>
                                <a href="<%= contextPath %>/Home/home.jsp" class="railway-btn railway-btn-primary">
                                    <i class="fas fa-home me-2"></i>Go to Homepage
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </main>
    </div>

    <!-- Include unified footer -->
    <jsp:include page="/shared/footer.jsp" />

    <!-- Essential JavaScript Libraries -->
    
    <!-- Bootstrap 5.3 JavaScript Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" 
            crossorigin="anonymous"></script>
    
    <!-- Railway Custom JavaScript -->
    <script src="<%= contextPath %>/js/railway-app.js"></script>
    
    <!-- Additional JavaScript if specified -->
    <% if (additionalJS != null && !additionalJS.trim().isEmpty()) { %>
        <script src="<%= contextPath %>/<%= additionalJS %>"></script>
    <% } %>
    
    <!-- Global Error Handler -->
    <script>
        // Global error handling
        window.addEventListener('error', function(e) {
            console.error('Global error:', e.error);
            // You can implement user-friendly error reporting here
        });
        
        // Loading indicator functions
        window.showLoading = function() {
            document.getElementById('loading-indicator').classList.remove('d-none');
        };
        
        window.hideLoading = function() {
            document.getElementById('loading-indicator').classList.add('d-none');
        };
        
        // Auto-hide loading on page load
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(hideLoading, 500);
        });
    </script>
</body>
</html>