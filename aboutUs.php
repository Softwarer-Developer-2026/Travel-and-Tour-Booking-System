<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Travel and Tour Booking System</title>
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-about {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('images/about-bg.jpg') center/cover no-repeat;
            color: white;
            padding: 100px 0;
        }
        .feature-box {
            transition: transform 0.3s ease;
        }
        .feature-box:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.php"><i class="fas fa-globe-americas text-primary me-2"></i>TravelEase</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav align-items-center">
                    <li class="nav-item"><a class="nav-link" href="index.php">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="packages.php">Tour Packages</a></li>
                    <li class="nav-item"><a class="nav-link active" href="about.php">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.php">Contact Us</a></li>
                    <li class="nav-item ms-lg-3"><a class="btn btn-primary btn-sm px-3" href="login.php">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- About Hero Section -->
    <header class="hero-about text-center">
        <div class="container">
            <h1 class="display-4 fw-bold mb-3">About Our Travel Agency</h1>
            <p class="lead col-lg-8 mx-auto">Bridging the gap between travel enthusiasts and unforgettable destinations through a seamless digital experience[cite: 1].</p>
        </div>
    </header>

    <!-- Who We Are Section -->
    <section class="py-5">
        <div class="container py-4">
            <div class="row align-items-center g-5">
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80" alt="Travel adventure" class="img-fluid rounded-4 shadow">
                </div>
                <div class="col-lg-6">
                    <h6 class="text-primary fw-bold text-uppercase tracking-wider">Who We Are</h6>
                    <h2 class="fw-bold mb-3">Redefining How You Explore the World</h2>
                    <p class="text-muted mb-4">Traditional travel agencies heavily depend on physical office locations, manual paper records, and phone calls[cite: 1]. Our web-based Travel and Tour Booking System modernizes this process, offering an interactive digital platform to browse tour packages, manage destinations, and book reservations effortlessly[cite: 1].</p>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-check-circle text-primary fs-4 me-2"></i>
                                <span class="fw-semibold">24/7 Accessibility</span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-check-circle text-primary fs-4 me-2"></i>
                                <span class="fw-semibold">Instant Search & Filter</span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-check-circle text-primary fs-4 me-2"></i>
                                <span class="fw-semibold">Secure Bookings</span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-check-circle text-primary fs-4 me-2"></i>
                                <span class="fw-semibold">Verified Itineraries</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Mission & Vision Cards -->
    <section class="bg-light py-5">
        <div class="container py-4">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card border-0 shadow-sm h-100 p-4 feature-box">
                        <div class="card-body">
                            <div class="text-primary fs-1 mb-3"><i class="fas fa-bullseye"></i></div>
                            <h3 class="h4 fw-bold mb-3">Our Mission</h3>
                            <p class="text-muted mb-0">To design and deliver a secure, responsive, and user-friendly web application that streamlines tour package management, guarantees accurate pricing and scheduling, and provides travelers worldwide with direct digital access to premier destinations[cite: 1].</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card border-0 shadow-sm h-100 p-4 feature-box">
                        <div class="card-body">
                            <div class="text-primary fs-1 mb-3"><i class="fas fa-eye"></i></div>
                            <h3 class="h4 fw-bold mb-3">Our Vision</h3>
                            <p class="text-muted mb-0">To become a leading digital travel platform recognized for operational efficiency, transparency, and eliminating the friction of traditional booking methods through cutting-edge web technologies[cite: 1].</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4">
        <div class="container text-center">
            <p class="mb-1">&copy; 2026 Travel and Tour Booking System. All rights reserved.</p>
            <p class="small text-muted mb-0">Developed as part of NVQ Level 4 Software Developer Project at NVTI Baddegama[cite: 1].</p>
        </div>
    </footer>

    <!-- Bootstrap 5 JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>