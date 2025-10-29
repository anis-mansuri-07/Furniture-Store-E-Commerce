    </main>
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <!-- Contact Information -->
                <div class="col-lg-4 col-md-6 footer-section">
                    <div class="footer-logo">
                        <svg width="180" height="40" viewBox="0 0 180 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M20 8h-4c-3.3 0-6 2.7-6 6v12c0 3.3 2.7 6 6 6h4c3.3 0 6-2.7 6-6V14c0-3.3-2.7-6-6-6zm0 20h-4c-1.1 0-2-.9-2-2V14c0-1.1.9-2 2-2h4c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2z" fill="#E67E22"/>
                            <path d="M45 8L35 32h6l1.5-4h9L53 32h6L49 8h-4zm-1 16l3-8 3 8h-6z" fill="#FFFFFF"/>
                            <path d="M65 8v24h14v-4H71V22h6v-4h-6v-6h8V8H65z" fill="#FFFFFF"/>
                            <path d="M90 8v24h6V8h-6z" fill="#FFFFFF"/>
                            <path d="M110 8v24h14v-4h-8V8h-6z" fill="#FFFFFF"/>
                            <text x="130" y="28" fill="#FFFFFF" font-family="Inter" font-size="10" font-weight="500">FURNITURE</text>
                        </svg>
                    </div>
                    <div class="footer-contact">
                        <div class="footer-contact-item">
                            <i class="bi bi-geo-alt"></i>
                            <div>
                                Thaltej <br>
                                 Sindhubhavan Road,<br>
                                 Shilaj , Ahmedabad
                            </div>
                        </div>
                        <div class="footer-contact-item">
                            <i class="bi bi-envelope"></i>
                            <div>
                                <a href="mailto:info@furniturehaven.com" class="text-decoration-none text-white-50">
                                    sunnythakor720@gmail.com
                                </a>
                            </div>
                        </div>
                        <div class="footer-contact-item">
                            <i class="bi bi-telephone"></i>
                            <div>
                                <a href="tel:+1-234-567-8900" class="text-decoration-none text-white-50">
                                    8141435587
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Quick Links -->
                <div class="col-lg-4 col-md-6 footer-section">
                    <h3 class="footer-title">Quick Links</h3>
                    <div class="row">
                        <div class="col-6">
                            <ul class="footer-links">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="about.jsp">About Us</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                                <li><a href="blog.jsp">Blog</a></li>
                            </ul>
                        </div>
                        <div class="col-6">
                            <ul class="footer-links">
                                <li><a href="category.jsp?type=living">Living Room</a></li>
                                <li><a href="category.jsp?type=bedroom">Bedroom</a></li>
                                <li><a href="category.jsp?type=dining">Dining Room</a></li>
                                <li><a href="category.jsp?type=office">Home Office</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Social Media & Newsletter -->
                <div class="col-lg-4 col-md-12 footer-section">
                    <h3 class="footer-title">Connect With Us</h3>
                    <p class="mb-4">Follow us on social media for the latest updates,and exclusive offers.</p>
                    <div class="social-links mb-4">
                        <a href="#" class="social-link" target="_blank" rel="noopener noreferrer">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a href="#" class="social-link" target="_blank" rel="noopener noreferrer">
                            <i class="bi bi-instagram"></i>
                        </a>
                        <a href="#" class="social-link" target="_blank" rel="noopener noreferrer">
                            <i class="bi bi-twitter"></i>
                        </a>
                        <a href="#" class="social-link" target="_blank" rel="noopener noreferrer">
                            <i class="bi bi-pinterest"></i>
                        </a>
                    </div>
                    <!-- <h3 class="footer-title">Newsletter</h3>
                    <p class="mb-3">Subscribe to receive updates and exclusive offers.</p>
                    <form class="footer-newsletter">
                        <div class="input-group">
                            <input type="email" class="form-control" placeholder="Your email address">
                            <button class="btn btn-primary" type="submit">Subscribe</button>
                        </div>
                    </form> -->
                </div>
            </div>

            <!-- Footer Bottom -->
<!--            <div class="footer-bottom">
                <p class="mb-0">&copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> Furniture Haven. All rights reserved.</p>
            </div>-->
        </div>
    </footer>

    <script>
        // Update cart count
        function updateCartCount(count) {
            document.querySelector('.cart-count').textContent = count;
        }

        // Newsletter form submission
        document.querySelector('.footer-newsletter')?.addEventListener('submit', function(e) {
            e.preventDefault();
            const email = this.querySelector('input[type="email"]').value;
            // Add your newsletter subscription logic here
            alert('Thank you for subscribing!');
            this.reset();
        });
    </script>
</body>
</html>