<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Railway Reservation System - Book train tickets online easily and securely">
    <meta name="keywords" content="railway, train booking, reservation, tickets, travel">
    <title>Home - Railway Reservation System</title>
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Railway Custom Theme -->
    <link href="../css/railway-theme.css" rel="stylesheet">
    
    <!-- AOS Animation Library -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>
<body class="bg-railway-light">
    <!-- Include unified header -->
    <jsp:include page="../shared/header.jsp" />

    <!-- Hero Section -->
    <section class="hero-section position-relative overflow-hidden">
        <div class="hero-background"></div>
        <div class="container">
            <div class="row align-items-center min-vh-100">
                <div class="col-lg-6" data-aos="fade-right">
                    <div class="hero-content">
                        <h1 class="display-4 fw-bold text-white mb-4">
                            Your Journey Starts Here
                        </h1>
                        <p class="lead text-white mb-5">
                            Book train tickets seamlessly with our modern railway reservation system. 
                            Fast, secure, and reliable - travel made easy.
                        </p>
                        
                        <!-- CTA Buttons -->
                        <div class="hero-actions">
                            <a href="../SignUp/registration.jsp" class="railway-btn railway-btn-primary me-3 mb-2">
                                <i class="fas fa-user-plus me-2"></i>Get Started
                            </a>
                            <a href="../Train_dao" class="railway-btn railway-btn-outline-primary mb-2">
                                <i class="fas fa-search me-2"></i>View Trains
                            </a>
                        </div>
                        
                        <!-- Stats -->
                        <div class="hero-stats mt-5">
                            <div class="row">
                                <div class="col-4">
                                    <div class="stat-item text-center">
                                        <div class="stat-number text-white fw-bold">1000+</div>
                                        <div class="stat-label text-white-50">Happy Users</div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="stat-item text-center">
                                        <div class="stat-number text-white fw-bold">50+</div>
                                        <div class="stat-label text-white-50">Train Routes</div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="stat-item text-center">
                                        <div class="stat-number text-white fw-bold">24/7</div>
                                        <div class="stat-label text-white-50">Support</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Hero Image -->
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="hero-image text-center">
                        <div class="train-illustration">
                            <i class="fas fa-train fa-10x text-white" style="opacity: 0.9;"></i>
                            <div class="floating-elements">
                                <div class="floating-icon" style="top: 20%; left: 10%;">
                                    <i class="fas fa-ticket-alt text-railway-accent fa-2x"></i>
                                </div>
                                <div class="floating-icon" style="top: 60%; right: 10%;">
                                    <i class="fas fa-clock text-railway-warning fa-2x"></i>
                                </div>
                                <div class="floating-icon" style="bottom: 30%; left: 20%;">
                                    <i class="fas fa-map-marked-alt text-railway-success fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Scroll Indicator -->
        <div class="scroll-indicator text-center position-absolute bottom-0 start-50 translate-middle-x mb-4">
            <a href="#features" class="text-white text-decoration-none">
                <i class="fas fa-chevron-down fa-2x" style="animation: bounce 2s infinite;"></i>
            </a>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="features-section py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5" data-aos="fade-up">
                    <h2 class="h1 fw-bold text-railway-dark mb-3">Why Choose Our Service?</h2>
                    <p class="lead text-muted">Experience the best in railway reservation technology</p>
                </div>
            </div>
            
            <div class="row g-4">
                <!-- Feature 1 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                    <div class="railway-card text-center h-100">
                        <div class="feature-icon mb-4">
                            <i class="fas fa-bolt fa-3x text-railway-primary"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Lightning Fast</h4>
                        <p class="text-muted">
                            Book your tickets in seconds with our optimized booking system. 
                            No more waiting in long queues.
                        </p>
                    </div>
                </div>
                
                <!-- Feature 2 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="railway-card text-center h-100">
                        <div class="feature-icon mb-4">
                            <i class="fas fa-shield-alt fa-3x text-railway-success"></i>
                        </div>
                        <h4 class="fw-bold mb-3">100% Secure</h4>
                        <p class="text-muted">
                            Your personal and payment information is protected with 
                            bank-level security encryption.
                        </p>
                    </div>
                </div>
                
                <!-- Feature 3 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="railway-card text-center h-100">
                        <div class="feature-icon mb-4">
                            <i class="fas fa-mobile-alt fa-3x text-railway-accent"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Mobile Friendly</h4>
                        <p class="text-muted">
                            Access our platform from any device. Fully responsive 
                            design for seamless mobile experience.
                        </p>
                    </div>
                </div>
                
                <!-- Feature 4 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
                    <div class="railway-card text-center h-100">
                        <div class="feature-icon mb-4">
                            <i class="fas fa-headset fa-3x text-railway-warning"></i>
                        </div>
                        <h4 class="fw-bold mb-3">24/7 Support</h4>
                        <p class="text-muted">
                            Our dedicated support team is available round the clock 
                            to assist you with any queries.
                        </p>
                    </div>
                </div>
                
                <!-- Feature 5 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
                    <div class="railway-card text-center h-100">
                        <div class="feature-icon mb-4">
                            <i class="fas fa-chart-line fa-3x text-railway-primary"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Real-time Updates</h4>
                        <p class="text-muted">
                            Get instant notifications about train schedules, delays, 
                            and platform changes.
                        </p>
                    </div>
                </div>
                
                <!-- Feature 6 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="600">
                    <div class="railway-card text-center h-100">
                        <div class="feature-icon mb-4">
                            <i class="fas fa-coins fa-3x text-railway-success"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Best Prices</h4>
                        <p class="text-muted">
                            Compare prices across different trains and classes to 
                            find the best deals for your journey.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works-section py-5 bg-railway-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5" data-aos="fade-up">
                    <h2 class="h1 fw-bold text-railway-dark mb-3">How It Works</h2>
                    <p class="lead text-muted">Simple steps to book your train tickets</p>
                </div>
            </div>
            
            <div class="row g-4">
                <!-- Step 1 -->
                <div class="col-lg-3 col-md-6 text-center" data-aos="zoom-in" data-aos-delay="100">
                    <div class="step-item">
                        <div class="step-number mb-4">
                            <span class="badge bg-railway-primary rounded-circle p-3 fs-4">1</span>
                        </div>
                        <div class="step-icon mb-3">
                            <i class="fas fa-user-plus fa-3x text-railway-primary"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Create Account</h5>
                        <p class="text-muted">
                            Sign up for a free account to get started with your bookings.
                        </p>
                    </div>
                </div>
                
                <!-- Step 2 -->
                <div class="col-lg-3 col-md-6 text-center" data-aos="zoom-in" data-aos-delay="200">
                    <div class="step-item">
                        <div class="step-number mb-4">
                            <span class="badge bg-railway-accent rounded-circle p-3 fs-4">2</span>
                        </div>
                        <div class="step-icon mb-3">
                            <i class="fas fa-search fa-3x text-railway-accent"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Search Trains</h5>
                        <p class="text-muted">
                            Find trains by route, date, and time to plan your perfect journey.
                        </p>
                    </div>
                </div>
                
                <!-- Step 3 -->
                <div class="col-lg-3 col-md-6 text-center" data-aos="zoom-in" data-aos-delay="300">
                    <div class="step-item">
                        <div class="step-number mb-4">
                            <span class="badge bg-railway-success rounded-circle p-3 fs-4">3</span>
                        </div>
                        <div class="step-icon mb-3">
                            <i class="fas fa-credit-card fa-3x text-railway-success"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Book & Pay</h5>
                        <p class="text-muted">
                            Select your seats and make secure payment to confirm booking.
                        </p>
                    </div>
                </div>
                
                <!-- Step 4 -->
                <div class="col-lg-3 col-md-6 text-center" data-aos="zoom-in" data-aos-delay="400">
                    <div class="step-item">
                        <div class="step-number mb-4">
                            <span class="badge bg-railway-warning rounded-circle p-3 fs-4">4</span>
                        </div>
                        <div class="step-icon mb-3">
                            <i class="fas fa-train fa-3x text-railway-warning"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Travel</h5>
                        <p class="text-muted">
                            Show your e-ticket and enjoy a comfortable journey.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section py-5 bg-railway-primary">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8" data-aos="fade-right">
                    <h3 class="h2 text-white fw-bold mb-3">Ready to Start Your Journey?</h3>
                    <p class="text-white mb-0">
                        Join thousands of satisfied customers who trust us for their travel needs.
                    </p>
                </div>
                <div class="col-lg-4 text-lg-end" data-aos="fade-left">
                    <a href="../SignUp/registration.jsp" class="railway-btn railway-btn-warning me-2 mb-2">
                        <i class="fas fa-rocket me-2"></i>Get Started
                    </a>
                    <a href="../SignUp/login.jsp" class="railway-btn railway-btn-outline-primary mb-2 text-white border-white">
                        <i class="fas fa-sign-in-alt me-2"></i>Sign In
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Include unified footer -->
    <jsp:include page="../shared/footer.jsp" />

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/railway-app.js"></script>
    
    <!-- AOS Animation Script -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!-- Page-specific JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize AOS animations
            AOS.init({
                duration: 800,
                easing: 'ease-in-out',
                once: true,
                mirror: false
            });
            
            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });
            
            // Parallax effect for hero section
            window.addEventListener('scroll', function() {
                const scrolled = window.pageYOffset;
                const heroBackground = document.querySelector('.hero-background');
                if (heroBackground) {
                    heroBackground.style.transform = `translateY(${scrolled * 0.5}px)`;
                }
            });
        });
    </script>

    <!-- Additional Styles -->
    <style>
        /* Hero Section Styles */
        .hero-section {
            background: linear-gradient(135deg, var(--railway-primary) 0%, var(--railway-accent) 100%);
            position: relative;
            overflow: hidden;
        }
        
        .hero-background {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="1" fill="%23ffffff" opacity="0.1"/></svg>') repeat;
            background-size: 100px 100px;
            z-index: -1;
        }
        
        .train-illustration {
            position: relative;
        }
        
        .floating-elements {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        
        .floating-icon {
            position: absolute;
            animation: float 3s ease-in-out infinite;
        }
        
        .floating-icon:nth-child(2) {
            animation-delay: 1s;
        }
        
        .floating-icon:nth-child(3) {
            animation-delay: 2s;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }
        
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-10px); }
            60% { transform: translateY(-5px); }
        }
        
        /* Stats Styles */
        .stat-number {
            font-size: 2rem;
        }
        
        .stat-label {
            font-size: 0.9rem;
        }
        
        /* Feature Cards Hover Effect */
        .railway-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .railway-card:hover {
            transform: translateY(-10px);
            box-shadow: var(--railway-shadow-lg);
        }
        
        .feature-icon i {
            transition: transform 0.3s ease;
        }
        
        .railway-card:hover .feature-icon i {
            transform: scale(1.1);
        }
        
        /* Step Items */
        .step-item {
            padding: 2rem;
        }
        
        .step-number .badge {
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-section .display-4 {
                font-size: 2.5rem;
            }
            
            .hero-actions .railway-btn {
                width: 100%;
                margin-bottom: 0.5rem;
            }
            
            .floating-elements {
                display: none;
            }
            
            .train-illustration i {
                font-size: 6rem !important;
            }
        }
        
        /* Scroll Indicator */
        .scroll-indicator {
            animation: bounce 2s infinite;
        }
        
        /* CTA Section */
        .cta-section {
            background: linear-gradient(135deg, var(--railway-primary) 0%, #1e3a8a 100%);
        }
    </style>
</body>
</html>