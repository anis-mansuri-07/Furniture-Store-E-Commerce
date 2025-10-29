<%@ include file="header.jsp" %>

<!-- Page Header -->
<div class="page-header" style="--header-bg: url('https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?auto=format&fit=crop&w=1920&q=80')">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Contact Us</li>
            </ol>
        </nav>
        <h1 class="display-4 fw-bold mb-3">Contact Us</h1>
        <p class="lead mb-0">Get in touch with our team</p>
    </div>
</div>

<!-- Contact Section -->
<section class="contact-section py-7">
    <div class="container">
        <div class="row g-5">
            <!-- Contact Information -->
            <div class="col-lg-4">
                <div class="contact-info">
                    <span class="subtitle">Get In Touch</span>
                    <h2 class="section-title mb-4">Contact Information</h2>
                    <p class="mb-5">Have questions? We're here to help. Send us a message and we'll respond as soon as possible.</p>
                    
                    <div class="contact-item d-flex align-items-center mb-4">
                        <div class="contact-icon me-4">
                            <i class="bi bi-geo-alt-fill text-primary fs-3"></i>
                        </div>
                        <div class="contact-text">
                            <h5 class="mb-1">Visit Us</h5>
                            <p class="mb-0">
                                123 Furniture Street<br>
                                Design District<br>
                                New York, NY 10001
                            </p>
                        </div>
                    </div>
                    
                    <div class="contact-item d-flex align-items-center mb-4">
                        <div class="contact-icon me-4">
                            <i class="bi bi-telephone-fill text-primary fs-3"></i>
                        </div>
                        <div class="contact-text">
                            <h5 class="mb-1">Call Us</h5>
                            <p class="mb-0">
                                <a href="tel:+1-234-567-8900" class="text-decoration-none text-body">+1 (234) 567-8900</a><br>
                                Monday - Friday: 9am - 6pm
                            </p>
                        </div>
                    </div>
                    
                    <div class="contact-item d-flex align-items-center">
                        <div class="contact-icon me-4">
                            <i class="bi bi-envelope-fill text-primary fs-3"></i>
                        </div>
                        <div class="contact-text">
                            <h5 class="mb-1">Email Us</h5>
                            <p class="mb-0">
                                <a href="mailto:info@furniturehaven.com" class="text-decoration-none text-body">info@furniturehaven.com</a><br>
                                We'll respond within 24 hours
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Contact Form -->
            <div class="col-lg-8">
                <div class="contact-form card border-0 p-5">
                    <form id="contactForm" class="needs-validation" novalidate>
                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                    <div class="invalid-feedback">Please enter your name.</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                    <div class="invalid-feedback">Please enter a valid email address.</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="phone" class="form-label">Phone Number</label>
                                    <input type="tel" class="form-control" id="phone" name="phone">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="subject" class="form-label">Subject</label>
                                    <select class="form-select" id="subject" name="subject" required>
                                        <option value="">Select a subject</option>
                                        <option value="general">General Inquiry</option>
                                        <option value="product">Product Information</option>
                                        <option value="order">Order Status</option>
                                        <option value="support">Customer Support</option>
                                    </select>
                                    <div class="invalid-feedback">Please select a subject.</div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="message" class="form-label">Message</label>
                                    <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                                    <div class="invalid-feedback">Please enter your message.</div>
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    Send Message <i class="bi bi-arrow-right ms-2"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Map Section -->
<section class="map-section py-7 bg-light">
    <div class="container">
        <div class="section-header text-center mb-5">
            <span class="subtitle">Location</span>
            <h2 class="section-title">Visit Our Showroom</h2>
            <div class="section-line"></div>
        </div>
        <div class="map-wrapper rounded-5 overflow-hidden">
            <div class="ratio ratio-21x9">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d193595.25436351647!2d-74.11976404950938!3d40.69766374873451!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2s!4v1645454229625!5m2!1sen!2s" 
                        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
    </div>
</section>

<!-- Add page-specific styles -->
<style>
/* Contact Form */
.contact-form {
    box-shadow: 0 10px 30px rgba(0,0,0,0.05);
    border-radius: 1rem;
}

.contact-icon {
    width: 60px;
    height: 60px;
    background: rgba(230, 126, 34, 0.1);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.contact-item {
    transition: all 0.3s ease;
}

.contact-item:hover {
    transform: translateX(10px);
}

.contact-item a {
    color: inherit;
}

.contact-item a:hover {
    color: var(--primary-color);
}

/* Form Styling */
.form-control, .form-select {
    padding: 0.75rem 1rem;
    border-radius: 0.5rem;
    border: 1px solid var(--gray-300);
}

.form-control:focus, .form-select:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 0.2rem rgba(230, 126, 34, 0.25);
}

/* Map Styling */
.map-wrapper {
    box-shadow: 0 10px 30px rgba(0,0,0,0.05);
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .contact-form {
        padding: 2rem !important;
    }
}
</style>

<!-- Add animation script -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Add fade-up class to elements
    const elements = document.querySelectorAll('.contact-item, .contact-form');
    elements.forEach(el => el.classList.add('fade-up'));
    
    // Intersection Observer for fade-up animations
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('active');
            }
        });
    }, {
        threshold: 0.1
    });
    
    // Observe all fade-up elements
    document.querySelectorAll('.fade-up').forEach(el => observer.observe(el));
    
    // Form validation
    const form = document.getElementById('contactForm');
    
    form.addEventListener('submit', function(event) {
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }
        
        form.classList.add('was-validated');
    });
});
</script>

<link href="css/bootstrap-custom.css" rel="stylesheet">
<link href="css/pages.css" rel="stylesheet">

<%@ include file="footer.jsp" %> 