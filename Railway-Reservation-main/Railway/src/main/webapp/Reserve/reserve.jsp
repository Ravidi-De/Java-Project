<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Make Reservation - Railway System</title>
    
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
        }
        
        .hero-section {
            background: linear-gradient(135deg, rgba(30, 64, 175, 0.95), rgba(14, 165, 233, 0.95));
            color: white;
            padding: 3rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 24px 24px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .hero-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .hero-section p {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .reservation-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            padding: 2.5rem;
            margin-bottom: 2rem;
        }
        
        .form-label {
            font-weight: 600;
            color: var(--railway-dark);
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }
        
        .form-control, .form-select {
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--railway-primary);
            box-shadow: 0 0 0 4px rgba(30, 64, 175, 0.1);
        }
        
        .input-icon {
            position: relative;
        }
        
        .input-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--railway-secondary);
        }
        
        .input-icon .form-control,
        .input-icon .form-select {
            padding-left: 45px;
        }
        
        .btn-reserve {
            background: linear-gradient(135deg, var(--railway-primary), var(--railway-accent));
            border: none;
            color: white;
            padding: 1rem 3rem;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(30, 64, 175, 0.3);
        }
        
        .btn-reserve:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(30, 64, 175, 0.4);
        }
        
        .quick-stats {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            flex: 1;
            background: linear-gradient(135deg, #f8fafc, #e2e8f0);
            border-radius: 16px;
            padding: 1.5rem;
            text-align: center;
        }
        
        .stat-card i {
            font-size: 2rem;
            color: var(--railway-primary);
            margin-bottom: 0.5rem;
        }
        
        .stat-card h4 {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--railway-dark);
            margin-bottom: 0.25rem;
        }
        
        .stat-card p {
            font-size: 0.9rem;
            color: var(--railway-secondary);
            margin: 0;
        }
        
        .contact-section {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            margin-bottom: 2rem;
        }
        
        .contact-info {
            display: flex;
            align-items: start;
            gap: 1rem;
            margin-bottom: 1.5rem;
            padding: 1rem;
            background: var(--railway-light);
            border-radius: 12px;
        }
        
        .contact-info i {
            font-size: 1.5rem;
            color: var(--railway-primary);
            margin-top: 0.25rem;
        }
        
        .section-title {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--railway-dark);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .section-title i {
            color: var(--railway-primary);
        }
        
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 1.75rem;
            }
            
            .quick-stats {
                flex-direction: column;
            }
            
            .reservation-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="/shared/header.jsp">
        <jsp:param name="pageTitle" value="Make Reservation"/>
    </jsp:include>
    
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <h1><i class="fas fa-ticket-alt me-3"></i>Book Your Journey</h1>
                    <p>Reserve your train tickets quickly and easily. Travel comfortably across Sri Lanka.</p>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <div class="d-flex align-items-center justify-content-lg-end gap-3">
                        <div>
                            <i class="fas fa-user-circle fa-3x text-white opacity-75"></i>
                        </div>
                        <div class="text-start">
                            <small class="d-block opacity-75">Welcome back,</small>
                            <strong class="fs-5"><%= Username %></strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        <!-- Quick Actions -->
        <div class="quick-stats">
            <div class="stat-card">
                <i class="fas fa-train"></i>
                <h4>50+</h4>
                <p>Available Routes</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-clock"></i>
                <h4>24/7</h4>
                <p>Online Booking</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-ticket-alt"></i>
                <h4>
                    <form action="../My_res_sv" method="post" style="display: inline;">
                        <input type="hidden" value="<%= Username %>" name="name">
                        <button type="submit" class="btn btn-link p-0 text-decoration-none text-dark">
                            View
                        </button>
                    </form>
                </h4>
                <p>My Reservations</p>
            </div>
        </div>
        
        <div class="row">
            <!-- Reservation Form -->
            <div class="col-lg-8">
                <div class="reservation-card">
                    <div class="section-title">
                        <i class="fas fa-clipboard-list"></i>
                        <span>Reservation Details</span>
                    </div>
                    
                    <form action="../insertReserve" method="post" id="reservationForm">
                        <div class="row g-4">
                            <!-- Name -->
                            <div class="col-md-6">
                                <label class="form-label">Full Name <span class="text-danger">*</span></label>
                                <div class="input-icon">
                                    <i class="fas fa-user"></i>
                                    <input type="text" class="form-control" name="uname" 
                                           value="<%= Username %>" required 
                                           placeholder="Enter your full name">
                                </div>
                            </div>
                            
                            <!-- Phone -->
                            <div class="col-md-6">
                                <label class="form-label">Phone Number <span class="text-danger">*</span></label>
                                <div class="input-icon">
                                    <i class="fas fa-phone"></i>
                                    <input type="tel" class="form-control" name="phone" required 
                                           placeholder="07X XXX XXXX" pattern="[0-9]{10}">
                                </div>
                            </div>
                            
                            <!-- Email -->
                            <div class="col-md-6">
                                <label class="form-label">Email Address <span class="text-danger">*</span></label>
                                <div class="input-icon">
                                    <i class="fas fa-envelope"></i>
                                    <input type="email" class="form-control" name="email" required 
                                           placeholder="your.email@example.com">
                                </div>
                            </div>
                            
                            <!-- Number of Passengers -->
                            <div class="col-md-6">
                                <label class="form-label">Number of Passengers <span class="text-danger">*</span></label>
                                <div class="input-icon">
                                    <i class="fas fa-users"></i>
                                    <input type="number" class="form-control" name="pax" required 
                                           min="1" max="10" placeholder="Number of passengers">
                                </div>
                            </div>
                            
                            <!-- From Station -->
                            <div class="col-md-6">
                                <label class="form-label">From Station <span class="text-danger">*</span></label>
                                <div class="input-icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <select class="form-select" name="from" required>
                                        <option value="" selected disabled>Select departure station</option>
                                        <option value="Colombo Fort">Colombo Fort</option>
                                        <option value="Anuradhapura">Anuradhapura</option>
                                        <option value="Kurunegala">Kurunegala</option>
                                        <option value="Polgahawela">Polgahawela</option>
                                        <option value="Meerigama">Meerigama</option>
                                        <option value="Pettah">Pettah</option>
                                        <option value="Nuwara Eliya">Nuwara Eliya</option>
                                        <option value="Ella">Ella</option>
                                        <option value="Kandy">Kandy</option>
                                        <option value="Galle">Galle</option>
                                        <option value="Matara">Matara</option>
                                        <option value="Jaffna">Jaffna</option>
                                        <option value="Batticaloa">Batticaloa</option>
                                        <option value="Trincomalee">Trincomalee</option>
                                    </select>
                                </div>
                            </div>
                            
                            <!-- To Station -->
                            <div class="col-md-6">
                                <label class="form-label">To Station <span class="text-danger">*</span></label>
                                <div class="input-icon">
                                    <i class="fas fa-flag-checkered"></i>
                                    <select class="form-select" name="to" required>
                                        <option value="" selected disabled>Select arrival station</option>
                                        <option value="Colombo Fort">Colombo Fort</option>
                                        <option value="Anuradhapura">Anuradhapura</option>
                                        <option value="Kurunegala">Kurunegala</option>
                                        <option value="Polgahawela">Polgahawela</option>
                                        <option value="Meerigama">Meerigama</option>
                                        <option value="Pettah">Pettah</option>
                                        <option value="Nuwara Eliya">Nuwara Eliya</option>
                                        <option value="Ella">Ella</option>
                                        <option value="Kandy">Kandy</option>
                                        <option value="Galle">Galle</option>
                                        <option value="Matara">Matara</option>
                                        <option value="Jaffna">Jaffna</option>
                                        <option value="Batticaloa">Batticaloa</option>
                                        <option value="Trincomalee">Trincomalee</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Submit Button -->
                        <div class="text-center mt-4">
                            <button type="submit" class="btn btn-reserve">
                                <i class="fas fa-ticket-alt me-2"></i>
                                Reserve Now
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- Quick Links & Info -->
            <div class="col-lg-4">
                <!-- My Reservations Card -->
                <div class="reservation-card mb-4">
                    <h5 class="fw-bold mb-3">
                        <i class="fas fa-list text-railway-primary me-2"></i>
                        Quick Actions
                    </h5>
                    <div class="d-grid gap-2">
                        <form action="../My_res_sv" method="post">
                            <input type="hidden" value="<%= Username %>" name="name">
                            <button type="submit" class="btn btn-outline-primary w-100">
                                <i class="fas fa-ticket-alt me-2"></i>
                                My Reservations
                            </button>
                        </form>
                        <a href="../Train_res" class="btn btn-outline-secondary">
                            <i class="fas fa-train me-2"></i>
                            View All Trains
                        </a>
                        <a href="../SignUp/login.jsp" class="btn btn-outline-danger">
                            <i class="fas fa-sign-out-alt me-2"></i>
                            Logout
                        </a>
                    </div>
                </div>
                
                <!-- Help Card -->
                <div class="reservation-card">
                    <h5 class="fw-bold mb-3">
                        <i class="fas fa-info-circle text-railway-accent me-2"></i>
                        Need Help?
                    </h5>
                    <p class="text-muted mb-3">
                        Have questions about your reservation? Our support team is here to help!
                    </p>
                    <a href="#contact" class="btn btn-sm btn-outline-primary w-100">
                        <i class="fas fa-headset me-2"></i>
                        Contact Support
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Contact Section -->
        <div class="row mt-4" id="contact">
            <div class="col-12">
                <div class="contact-section">
                    <div class="section-title">
                        <i class="fas fa-envelope"></i>
                        <span>Contact Us</span>
                    </div>
                    
                    <div class="row">
                        <!-- Contact Info -->
                        <div class="col-lg-5">
                            <div class="contact-info">
                                <i class="fas fa-map-marker-alt"></i>
                                <div>
                                    <strong class="d-block mb-1">Our Address</strong>
                                    <p class="text-muted mb-0">
                                        No 39, New Malkaduwawa<br>
                                        Kurunegala, Sri Lanka
                                    </p>
                                </div>
                            </div>
                            
                            <div class="contact-info">
                                <i class="fas fa-phone-alt"></i>
                                <div>
                                    <strong class="d-block mb-1">Phone Numbers</strong>
                                    <p class="text-muted mb-0">
                                        +94 76 271 200<br>
                                        +94 96 3434 5678
                                    </p>
                                </div>
                            </div>
                            
                            <div class="contact-info">
                                <i class="fas fa-envelope"></i>
                                <div>
                                    <strong class="d-block mb-1">Email</strong>
                                    <p class="text-muted mb-0">
                                        railway@contact.lk<br>
                                        support@railway.lk
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Contact Form -->
                        <div class="col-lg-7">
                            <h5 class="fw-bold mb-3">Send us a Message</h5>
                            <p class="text-muted mb-4">Have a question or concern? We'd love to hear from you!</p>
                            
                            <form>
                                <div class="mb-3">
                                    <input type="text" class="form-control" placeholder="Your Name" required>
                                </div>
                                <div class="mb-3">
                                    <input type="email" class="form-control" placeholder="Your Email" required>
                                </div>
                                <div class="mb-3">
                                    <textarea class="form-control" rows="4" placeholder="Your Message" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-paper-plane me-2"></i>
                                    Send Message
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Include Footer -->
    <jsp:include page="/shared/footer.jsp"/>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Form validation
        document.getElementById('reservationForm').addEventListener('submit', function(e) {
            const from = this.querySelector('[name="from"]').value;
            const to = this.querySelector('[name="to"]').value;
            
            if (from === to) {
                e.preventDefault();
                alert('Departure and arrival stations cannot be the same!');
            }
        });
    </script>
</body>
</html>
