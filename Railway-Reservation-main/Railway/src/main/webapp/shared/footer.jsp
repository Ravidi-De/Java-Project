<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
    java.util.Calendar cal = java.util.Calendar.getInstance();
    int currentYear = cal.get(java.util.Calendar.YEAR);
%>

<footer class="railway-footer mt-5">
    <div class="container">
        <div class="row">
            <!-- Company Information -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="footer-section">
                    <h5 class="d-flex align-items-center mb-3">
                        <i class="fas fa-train me-2 text-railway-accent"></i>
                        Railway Reservation System
                    </h5>
                    <p class="mb-3">
                        Your trusted partner for seamless railway ticket booking and reservations. 
                        Experience convenience and reliability with our modern booking platform.
                    </p>
                    <div class="social-links">
                        <a href="#" class="me-3" aria-label="Facebook">
                            <i class="fab fa-facebook-f fa-lg"></i>
                        </a>
                        <a href="#" class="me-3" aria-label="Twitter">
                            <i class="fab fa-twitter fa-lg"></i>
                        </a>
                        <a href="#" class="me-3" aria-label="Instagram">
                            <i class="fab fa-instagram fa-lg"></i>
                        </a>
                        <a href="#" aria-label="LinkedIn">
                            <i class="fab fa-linkedin-in fa-lg"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 col-md-6 mb-4">
                <div class="footer-section">
                    <h6 class="text-uppercase fw-bold mb-3">Quick Links</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a href="<%= contextPath %>/Home/home.jsp" class="footer-link">
                                <i class="fas fa-chevron-right me-2 small"></i>Home
                            </a>
                        </li>
                        <li class="mb-2">
                            <a href="<%= contextPath %>/Train_dao" class="footer-link">
                                <i class="fas fa-chevron-right me-2 small"></i>View Trains
                            </a>
                        </li>
                        <li class="mb-2">
                            <a href="<%= contextPath %>/SignUp/registration.jsp" class="footer-link">
                                <i class="fas fa-chevron-right me-2 small"></i>Register
                            </a>
                        </li>
                        <li class="mb-2">
                            <a href="<%= contextPath %>/SignUp/login.jsp" class="footer-link">
                                <i class="fas fa-chevron-right me-2 small"></i>Login
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Services -->
            <div class="col-lg-2 col-md-6 mb-4">
                <div class="footer-section">
                    <h6 class="text-uppercase fw-bold mb-3">Services</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <span class="footer-text">
                                <i class="fas fa-ticket-alt me-2 small text-railway-accent"></i>Ticket Booking
                            </span>
                        </li>
                        <li class="mb-2">
                            <span class="footer-text">
                                <i class="fas fa-calendar-check me-2 small text-railway-accent"></i>Reservations
                            </span>
                        </li>
                        <li class="mb-2">
                            <span class="footer-text">
                                <i class="fas fa-route me-2 small text-railway-accent"></i>Route Planning
                            </span>
                        </li>
                        <li class="mb-2">
                            <span class="footer-text">
                                <i class="fas fa-clock me-2 small text-railway-accent"></i>Live Tracking
                            </span>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Contact Information -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="footer-section">
                    <h6 class="text-uppercase fw-bold mb-3">Contact Information</h6>
                    <div class="contact-info">
                        <div class="contact-item mb-2">
                            <i class="fas fa-map-marker-alt me-2 text-railway-accent"></i>
                            <span>123 Railway Station Road, City Center, Country 12345</span>
                        </div>
                        <div class="contact-item mb-2">
                            <i class="fas fa-phone me-2 text-railway-accent"></i>
                            <a href="tel:+1234567890" class="footer-link">+1 (234) 567-890</a>
                        </div>
                        <div class="contact-item mb-2">
                            <i class="fas fa-envelope me-2 text-railway-accent"></i>
                            <a href="mailto:support@railwayreservation.com" class="footer-link">
                                support@railwayreservation.com
                            </a>
                        </div>
                        <div class="contact-item">
                            <i class="fas fa-clock me-2 text-railway-accent"></i>
                            <span>24/7 Customer Support</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Bottom -->
        <hr class="footer-divider my-4">
        <div class="row align-items-center">
            <div class="col-md-6">
                <p class="footer-copyright mb-0">
                    &copy; <%= currentYear %> Railway Reservation System. All rights reserved.
                </p>
            </div>
            <div class="col-md-6">
                <div class="footer-links text-md-end">
                    <a href="#" class="footer-link me-3">Privacy Policy</a>
                    <a href="#" class="footer-link me-3">Terms of Service</a>
                    <a href="#" class="footer-link">Cookie Policy</a>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Footer Custom Styles -->
<style>
.footer-link {
    color: rgba(255, 255, 255, 0.7);
    text-decoration: none;
    transition: color 0.2s ease;
}

.footer-link:hover {
    color: var(--railway-accent);
    text-decoration: none;
}

.footer-text {
    color: rgba(255, 255, 255, 0.7);
    font-size: 0.9rem;
}

.footer-divider {
    border-color: rgba(255, 255, 255, 0.2);
    border-width: 1px;
}

.footer-copyright {
    color: rgba(255, 255, 255, 0.6);
    font-size: 0.9rem;
}

.social-links a {
    color: rgba(255, 255, 255, 0.7);
    transition: color 0.2s ease, transform 0.2s ease;
    display: inline-block;
}

.social-links a:hover {
    color: var(--railway-accent);
    transform: translateY(-2px);
}

.contact-item {
    display: flex;
    align-items: flex-start;
    line-height: 1.6;
}

.contact-item i {
    margin-top: 0.1rem;
    flex-shrink: 0;
}

@media (max-width: 768px) {
    .railway-footer {
        text-align: center;
    }
    
    .footer-links {
        text-align: center !important;
        margin-top: 1rem;
    }
    
    .social-links {
        justify-content: center;
        display: flex;
    }
    
    .contact-item {
        justify-content: center;
    }
}
</style>