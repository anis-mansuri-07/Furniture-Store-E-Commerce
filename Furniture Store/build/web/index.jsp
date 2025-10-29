<%@ include file="header.jsp" %>
<!-- Loading Animation -->
<div class="loading-overlay">
    <div class="loading-spinner"></div>
    <div class="loading-text">FURNITURE HAVEN</div>
</div>

<!-- Hero Slideshow -->
<section class="hero-slideshow position-relative vh-100">
    <div class="swiper hero-swiper">
        <div class="swiper-wrapper">
            <!-- Slide 1 -->
            <div class="swiper-slide">
                <div class="hero-slide" style="background-image: url('https://images.unsplash.com/photo-1634712282287-14ed57b9cc89?auto=format&fit=crop&w=1920&q=80');">
                    <div class="hero-content container">
                        <span class="hero-subtitle text-uppercase animate__animated animate__fadeInUp">Welcome to Furniture Haven</span>
                        <h1 class="hero-title animate__animated animate__fadeInUp">Modern Living <br>Redefined</h1>
                        <p class="hero-description animate__animated animate__fadeInUp animate__delay-1s">Discover our exclusive collection of contemporary furniture</p>
                        <a href="#featured-collection" class="btn btn-xl btn-outline-light rounded-pill px-5 py-3 animate__animated animate__fadeInUp animate__delay-2s">
                            Explore Collection <i class="bi bi-arrow-right ms-2"></i>
                        </a>
                    </div>
    </div>
            </div>
            <!-- Slide 2 -->
            <div class="swiper-slide">
                <div class="hero-slide" style="background-image: url('https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?auto=format&fit=crop&w=1920&q=80');">
                    <div class="hero-content container">
                        <span class="hero-subtitle text-uppercase animate__animated animate__fadeInUp">Premium Selection</span>
                        <h1 class="hero-title animate__animated animate__fadeInUp">Luxury Comfort <br>& Style</h1>
                        <p class="hero-description animate__animated animate__fadeInUp animate__delay-1s">Experience the perfect blend of elegance and comfort</p>
                        <a href="category.jsp?type=living" class="btn btn-xl btn-outline-light rounded-pill px-5 py-3 animate__animated animate__fadeInUp animate__delay-2s">
                            View Collection <i class="bi bi-arrow-right ms-2"></i>
                        </a>
            </div>
        </div>
            </div>
            <!-- Slide 3 -->
            <div class="swiper-slide">
                <div class="hero-slide" style="background-image: url('https://images.unsplash.com/photo-1616594039964-ae9021a400a0?auto=format&fit=crop&w=1920&q=80');">
                    <div class="hero-content container">
                        <span class="hero-subtitle text-uppercase animate__animated animate__fadeInUp">Bedroom Collection</span>
                        <h1 class="hero-title animate__animated animate__fadeInUp">Dream Bedrooms <br>Await</h1>
                        <p class="hero-description animate__animated animate__fadeInUp animate__delay-1s">Create your perfect sanctuary with our curated collections</p>
                        <a href="category.jsp?type=bedroom" class="btn btn-xl btn-outline-light rounded-pill px-5 py-3 animate__animated animate__fadeInUp animate__delay-2s">
                            Shop Now <i class="bi bi-arrow-right ms-2"></i>
                        </a>
            </div>
        </div>
            </div>
        </div>
        <div class="swiper-pagination"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>
</section>

<!-- Featured Categories -->
<section class="featured-categories py-7">
    <div class="container">
        <div class="section-header text-center mb-5">
            <span class="subtitle text-primary text-uppercase">Browse Our Collections</span>
            <h2 class="section-title">Curated Categories</h2>
            <div class="section-line"></div>
        </div>
        <div class="row g-4">
            <div class="col-lg-6">
                <div class="category-large position-relative overflow-hidden rounded-5">
                    <img src="https://images.unsplash.com/photo-1618219908412-a29a1bb7b86e?auto=format&fit=crop&w=1920&q=80" class="w-100 h-100 object-fit-cover" alt="Living Room">
                    <div class="category-content">
                        <h3 class="category-title">Living Room</h3>
                        <p class="category-description">Modern comfort meets timeless style</p>
                        <a href="category.jsp?type=living" class="btn btn-outline-light rounded-pill">
                            Explore Collection <i class="bi bi-arrow-right ms-2"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row g-4">
                    <div class="col-6">
                        <div class="category-small position-relative overflow-hidden rounded-5">
                            <img src="https://images.unsplash.com/photo-1617325247661-675ab4b64ae2?auto=format&fit=crop&w=800&q=80" class="w-100 h-100 object-fit-cover" alt="Bedroom">
                            <div class="category-content">
                                <h4 class="category-title">Bedroom</h4>
                                <a href="category.jsp?type=bedroom" class="category-link">View Collection <i class="bi bi-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="category-small position-relative overflow-hidden rounded-5">
                            <img src="https://images.unsplash.com/photo-1617806118233-18e1de247200?auto=format&fit=crop&w=800&q=80" class="w-100 h-100 object-fit-cover" alt="Dining">
                            <div class="category-content">
                                <h4 class="category-title">Dining</h4>
                                <a href="category.jsp?type=dining" class="category-link">View Collection <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
                    </div>
                    <div class="col-12">
                        <div class="category-medium position-relative overflow-hidden rounded-5">
                            <img src="https://images.unsplash.com/photo-1486946255434-2466348c2166?auto=format&fit=crop&w=1920&q=80" class="w-100 h-100 object-fit-cover" alt="Office">
                            <div class="category-content">
                                <h3 class="category-title">Home Office</h3>
                                <p class="category-description">Professional workspace solutions</p>
                                <a href="category.jsp?type=office" class="btn btn-outline-light rounded-pill">
                                    Discover More <i class="bi bi-arrow-right ms-2"></i>
                                </a>
                </div>
            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Products -->
<section id="featured-collection" class="featured-products py-7 bg-light">
    <div class="container">
        <div class="section-header text-center mb-5">
            <span class="subtitle text-primary text-uppercase">Latest Additions</span>
            <h2 class="section-title">Featured Collection</h2>
            <div class="section-line"></div>
        </div>
        <div class="swiper featured-swiper">
            <div class="swiper-wrapper">
                <!-- Product Card 1 -->
                <div class="swiper-slide">
                    <div class="product-card" data-product-id="1">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?auto=format&fit=crop&w=800&q=80" alt="Modern Sofa">
                            <div class="product-actions">
                                <button onclick="cart.addItem(1, 'Modern Sofa', 899.99)" class="btn btn-primary rounded-circle" title="Add to Cart">
                                    <i class="bi bi-cart-plus"></i>
                                </button>
<!--                                <button class="btn btn-light rounded-circle btn-heart" title="Add to Wishlist">
                                    <i class="bi bi-heart"></i>
                                </button>-->
                                <button class="btn btn-light rounded-circle btn-quickview" data-bs-toggle="modal" data-bs-target="#quickViewModal" title="Quick View">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                            <span class="product-badge">New</span>
                        </div>
                        <div class="product-info">
                            <h3 class="product-title">Modern Sofa</h3>
                            <p class="product-category">Living Room Collection</p>
                            <div class="product-price">Rs.6000</div>
                        </div>
                    </div>
                </div>
                <!-- Product Card 2 -->
                <div class="swiper-slide">
                    <div class="product-card" data-product-id="2">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1580480055273-228ff5388ef8?auto=format&fit=crop&w=800&q=80" alt="Elegant Chair">
                            <div class="product-actions">
                                <button onclick="cart.addItem(2, 'Elegant Chair', 499.99)" class="btn btn-primary rounded-circle" title="Add to Cart">
                                    <i class="bi bi-cart-plus"></i>
                                </button>
<!--                                <button class="btn btn-light rounded-circle btn-heart" title="Add to Wishlist">
                                    <i class="bi bi-heart"></i>
                                </button>-->
                                <button class="btn btn-light rounded-circle btn-quickview" data-bs-toggle="modal" data-bs-target="#quickViewModal" title="Quick View">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                            <span class="product-badge bg-danger">Sale</span>
                        </div>
                        <div class="product-info">
                            <h3 class="product-title">Elegant Chair</h3>
                            <p class="product-category">Living Room Collection</p>
                            <div class="product-price">
                                <span class="price-old">Rs.9000</span>
                                Rs.1500
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Product Card 3 -->
                <div class="swiper-slide">
                    <div class="product-card" data-product-id="3">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=800&q=80" alt="Luxury Bed">
                            <div class="product-actions">
                                <button onclick="cart.addItem(3, 'Luxury Bed', 1299.99)" class="btn btn-primary rounded-circle" title="Add to Cart">
                                    <i class="bi bi-cart-plus"></i>
                                </button>
<!--                                <button class="btn btn-light rounded-circle btn-heart" title="Add to Wishlist">
                                    <i class="bi bi-heart"></i>
                                </button>-->
                                <button class="btn btn-light rounded-circle btn-quickview" data-bs-toggle="modal" data-bs-target="#quickViewModal" title="Quick View">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-title">Luxury Bed</h3>
                            <p class="product-category">Bedroom Collection</p>
                            <div class="product-price">Rs.7500</div>
                        </div>
                    </div>
                </div>
                <!-- Product Card 4 -->
                <div class="swiper-slide">
                    <div class="product-card" data-product-id="4">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1592078615290-033ee584e267?auto=format&fit=crop&w=800&q=80" alt="Modern Table">
                            <div class="product-actions">
                                <button onclick="cart.addItem(4, 'Modern Table', 799.99)" class="btn btn-primary rounded-circle" title="Add to Cart">
                                    <i class="bi bi-cart-plus"></i>
                                </button>
<!--                                <button class="btn btn-light rounded-circle btn-heart" title="Add to Wishlist">
                                    <i class="bi bi-heart"></i>
                                </button>-->
                                <button class="btn btn-light rounded-circle btn-quickview" data-bs-toggle="modal" data-bs-target="#quickViewModal" title="Quick View">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                            <span class="product-badge bg-success">In Stock</span>
                        </div>
                        <div class="product-info">
                            <h3 class="product-title">Modern Table</h3>
                            <p class="product-category">Dining Collection</p>
                            <div class="product-price">Rs.12000</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>
</section>

<!-- Why Choose Us -->
<section class="why-choose-us py-7">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-5 mb-lg-0">
                <div class="image-wrapper position-relative">
                    <img src="https://images.unsplash.com/photo-1616137466211-f939a420be84?auto=format&fit=crop&w=1920&q=80" class="img-fluid rounded-5" alt="Interior Design">
                    <div class="experience-badge">
                        <span class="number">25+</span>
                        <span class="text">Years of Excellence</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 offset-lg-1">
                <span class="subtitle text-primary text-uppercase">Why Choose Us</span>
                <h2 class="section-title mb-4">Crafting Your Perfect Space</h2>
                <div class="feature-list">
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="bi bi-check2-circle"></i>
                        </div>
                        <div class="feature-content">
                            <h4>Premium Quality</h4>
                            <p>Handcrafted with the finest materials for lasting beauty</p>
                        </div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="bi bi-truck"></i>
                        </div>
                        <div class="feature-content">
                            <h4>Free Shipping</h4>
                            <p>Complimentary shipping on orders over Rs.80,000</p>
                        </div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <div class="feature-content">
                            <h4>10 Year Warranty</h4>
                            <p>Guaranteed quality and peace of mind with every purchase</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Newsletter Section -->
<section class="newsletter-section py-7">
    <div class="container">
        <div class="newsletter-wrapper text-center">
            <span class="subtitle text-white text-uppercase">Stay Updated</span>
            <h2 class="section-title text-white">Join Our Newsletter</h2>
            <p class="newsletter-description">Subscribe to receive updates, exclusive deals, and design inspiration</p>
            <form class="newsletter-form">
                <div class="input-group">
                    <input type="email" class="form-control form-control-lg" placeholder="Enter your email address">
                    <button class="btn btn-light btn-lg px-4" type="submit">
                        Subscribe <i class="bi bi-arrow-right ms-2"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- Modern Styles -->
<style>
:root {
    --primary-color: #e67e22;
    --secondary-color: #2c3e50;
    --text-color: #2c3e50;
    --light-bg: #f8f9fa;
    --dark-bg: #1a1a1a;
}

/* General Styles */
.py-7 {
    padding-top: 7rem;
    padding-bottom: 7rem;
}

.subtitle {
    font-size: 0.875rem;
    font-weight: 600;
    letter-spacing: 2px;
    margin-bottom: 1rem;
    display: block;
}

.section-title {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 1rem;
}

.section-line {
    width: 60px;
    height: 3px;
    background-color: var(--primary-color);
    margin: 1.5rem auto;
}

/* Hero Section */
.hero-slide {
    height: 100vh;
    background-size: cover;
    background-position: center;
    position: relative;
}

.hero-slide::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(to right, rgba(0,0,0,0.7), rgba(0,0,0,0.3));
}

.hero-content {
    position: relative;
    z-index: 2;
    color: #fff;
    max-width: 800px;
    padding-top: 100px;
}

.hero-subtitle {
    font-size: 1rem;
    letter-spacing: 3px;
    margin-bottom: 1.5rem;
    display: block;
}

.hero-title {
    font-size: 4rem;
    font-weight: 700;
    line-height: 1.2;
    margin-bottom: 1.5rem;
}

.hero-description {
    font-size: 1.25rem;
    margin-bottom: 2rem;
    opacity: 0.9;
}

/* Category Cards */
.category-large {
    height: 600px;
}

.category-small {
    height: 280px;
}

.category-medium {
    height: 320px;
}

.category-content {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 2rem;
    background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
    color: #fff;
    transition: all 0.3s ease;
}

.category-title {
    margin-bottom: 0.5rem;
}

.category-description {
    opacity: 0.9;
    margin-bottom: 1.5rem;
}

.category-link {
    color: #fff;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
}

.category-link:hover {
    color: var(--primary-color);
}

/* Product Cards */
.product-card {
    background: #fff;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    transition: all 0.3s ease;
}

.product-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
}

.product-image {
    position: relative;
    padding-top: 100%;
}

.product-image img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.product-actions {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    gap: 0.5rem;
    opacity: 0;
    transition: all 0.3s ease;
}

.product-card:hover .product-actions {
    opacity: 1;
}

.product-info {
    padding: 1.5rem;
    text-align: center;
}

.product-title {
    font-size: 1.25rem;
    margin-bottom: 0.5rem;
}

.product-category {
    color: #6c757d;
    font-size: 0.875rem;
    margin-bottom: 0.5rem;
}

.product-price {
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--primary-color);
}

/* Feature List */
.feature-item {
    display: flex;
    align-items: flex-start;
    margin-bottom: 2rem;
    padding: 2rem;
    background: var(--light-bg);
    border-radius: 1rem;
    transition: all 0.3s ease;
}

.feature-item:hover {
    transform: translateX(10px);
    background: #fff;
    box-shadow: 0 5px 15px rgba(0,0,0,0.05);
}

.feature-icon {
    width: 60px;
    height: 60px;
    background: var(--primary-color);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 1.5rem;
    font-size: 1.5rem;
    color: #fff;
}

.feature-content h4 {
    margin-bottom: 0.5rem;
}

.feature-content p {
    margin-bottom: 0;
    color: #6c757d;
}

/* Newsletter Section */
.newsletter-section {
    background: var(--primary-color);
    position: relative;
    overflow: hidden;
}

.newsletter-wrapper {
    max-width: 600px;
    margin: 0 auto;
}

.newsletter-description {
    color: rgba(255,255,255,0.9);
    margin-bottom: 2rem;
}

.newsletter-form .form-control {
    height: 60px;
    border: none;
    padding: 0 1.5rem;
    font-size: 1.1rem;
    border-radius: 30px 0 0 30px;
}

.newsletter-form .btn {
    padding-left: 2rem;
    padding-right: 2rem;
    border-radius: 0 30px 30px 0;
    font-weight: 600;
}

/* Loading Animation */
.loading-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    z-index: 9999;
    transition: opacity 0.5s ease;
}

.loading-spinner {
    width: 50px;
    height: 50px;
    border: 3px solid #f3f3f3;
    border-top: 3px solid var(--primary-color);
    border-radius: 50%;
    animation: spin 1s linear infinite;
    margin-bottom: 1rem;
}

.loading-text {
    font-size: 1.2rem;
    font-weight: 600;
    letter-spacing: 3px;
    color: var(--primary-color);
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/* Experience Badge */
.experience-badge {
    position: absolute;
    bottom: -30px;
    right: 30px;
    background: var(--primary-color);
    color: #fff;
    padding: 2rem;
    border-radius: 1rem;
    text-align: center;
}

.experience-badge .number {
    font-size: 2.5rem;
    font-weight: 700;
    display: block;
    line-height: 1;
}

.experience-badge .text {
    font-size: 0.875rem;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .py-7 {
        padding-top: 4rem;
        padding-bottom: 4rem;
    }

    .hero-title {
        font-size: 2.5rem;
    }

    .section-title {
        font-size: 2rem;
    }

    .category-large,
    .category-medium {
        height: 400px;
    }

    .category-small {
        height: 200px;
    }

    .experience-badge {
        bottom: -20px;
        right: 20px;
        padding: 1.5rem;
    }
}
</style>

<!-- Update Scripts -->
<script>
// Cart functionality
const cart = {
    items: [],
    
    init() {
        this.items = JSON.parse(localStorage.getItem('cartItems')) || [];
        this.updateCartCount();
        this.bindEvents();
    },
    
    addItem(id, name, price) {
        const existingItem = this.items.find(item => item.id === id);
        if (existingItem) {
            existingItem.quantity += 1;
        } else {
            this.items.push({
                id: id,
                name: name,
                price: price,
                quantity: 1
            });
        }
        this.saveCart();
        this.updateCartCount();
        this.showNotification('Item added to cart successfully!');
    },
    
    updateCartCount() {
        const cartCount = document.querySelector('.cart-count');
        if (cartCount) {
            cartCount.textContent = this.items.reduce((total, item) => total + item.quantity, 0);
        }
    },
    
    saveCart() {
        localStorage.setItem('cartItems', JSON.stringify(this.items));
    },
    
    showNotification(message) {
        const notification = document.createElement('div');
        notification.className = 'notification';
        notification.textContent = message;
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.classList.add('show');
            setTimeout(() => {
                notification.classList.remove('show');
                setTimeout(() => {
                    notification.remove();
                }, 300);
            }, 2000);
        }, 100);
    },
    
    bindEvents() {
        document.querySelectorAll('[onclick^="addToCart"]').forEach(button => {
            button.addEventListener('click', (e) => {
                e.preventDefault();
                const params = button.getAttribute('onclick')
                    .match(/addToCart\((\d+),\s*'([^']+)',\s*(\d+\.?\d*)\)/);
                if (params) {
                    this.addItem(parseInt(params[1]), params[2], parseFloat(params[3]));
                }
            });
        });
    }
};

// Wishlist functionality
const wishlist = {
    items: [],
    
    init() {
        this.items = JSON.parse(localStorage.getItem('wishlistItems')) || [];
        this.bindEvents();
    },
    
    toggleItem(id, name, price, imageUrl) {
        const index = this.items.findIndex(item => item.id === id);
        if (index === -1) {
            this.items.push({ id, name, price, imageUrl });
            this.showNotification('Item added to wishlist!');
        } else {
            this.items.splice(index, 1);
            this.showNotification('Item removed from wishlist!');
        }
        this.saveWishlist();
    },
    
    saveWishlist() {
        localStorage.setItem('wishlistItems', JSON.stringify(this.items));
    },
    
    showNotification(message) {
        const notification = document.createElement('div');
        notification.className = 'notification';
        notification.textContent = message;
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.classList.add('show');
            setTimeout(() => {
                notification.classList.remove('show');
                setTimeout(() => {
                    notification.remove();
                }, 300);
            }, 2000);
        }, 100);
    },
    
    bindEvents() {
        document.querySelectorAll('.btn-heart').forEach(button => {
            button.addEventListener('click', (e) => {
                e.preventDefault();
                const card = button.closest('.product-card');
                const id = parseInt(card.dataset.productId);
                const name = card.querySelector('.product-title').textContent;
                const price = parseFloat(card.querySelector('.product-price').textContent.replace('$', ''));
                const imageUrl = card.querySelector('img').src;
                this.toggleItem(id, name, price, imageUrl);
                button.classList.toggle('active');
            });
        });
    }
};

document.addEventListener('DOMContentLoaded', function() {
    // Initialize Hero Swiper
    const heroSwiper = new Swiper('.hero-swiper', {
        effect: 'fade',
        speed: 1000,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        on: {
            slideChange: function () {
                const activeSlide = document.querySelector('.swiper-slide-active');
                if (activeSlide) {
                    const elements = activeSlide.querySelectorAll('.animate__animated');
                    elements.forEach(el => {
                        el.style.opacity = '0';
                        setTimeout(() => {
                            el.style.opacity = '1';
                        }, 100);
                    });
                }
            }
        }
    });

    // Initialize Featured Products Swiper
    const featuredSwiper = new Swiper('.featured-swiper', {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        breakpoints: {
            640: {
                slidesPerView: 2,
            },
            768: {
                slidesPerView: 3,
            },
            1024: {
                slidesPerView: 4,
            },
        }
    });

    // Smooth Scroll
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

    // Loading Animation
    window.addEventListener('load', function() {
        const loadingOverlay = document.querySelector('.loading-overlay');
        if (loadingOverlay) {
            setTimeout(() => {
                loadingOverlay.style.opacity = '0';
                setTimeout(() => {
                    loadingOverlay.style.display = 'none';
                }, 500);
            }, 1000);
        }
    });

    // Scroll Animations
    const animateOnScroll = function() {
        const elements = document.querySelectorAll('.feature-item, .product-card, .category-content');
        elements.forEach(element => {
            const elementTop = element.getBoundingClientRect().top;
            const windowHeight = window.innerHeight;
            if (elementTop < windowHeight * 0.8) {
                element.classList.add('animate__animated', 'animate__fadeInUp');
            }
        });
    };

    window.addEventListener('scroll', animateOnScroll);
    animateOnScroll();

    // Initialize Cart and Wishlist
    cart.init();
    wishlist.init();
});
</script>

<!-- Add Notification Styles -->
<style>
.notification {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background-color: var(--primary-color);
    color: white;
    padding: 15px 25px;
    border-radius: 5px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.2);
    transform: translateY(100px);
    opacity: 0;
    transition: all 0.3s ease;
    z-index: 9999;
}

.notification.show {
    transform: translateY(0);
    opacity: 1;
}

.btn-heart {
    transition: all 0.3s ease;
}

.btn-heart.active {
    color: #dc3545;
}

.loading-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    z-index: 9999;
    transition: opacity 0.5s ease;
}

.loading-spinner {
    width: 50px;
    height: 50px;
    border: 3px solid #f3f3f3;
    border-top: 3px solid var(--primary-color);
    border-radius: 50%;
    animation: spin 1s linear infinite;
    margin-bottom: 1rem;
}

.loading-text {
    font-size: 1.2rem;
    font-weight: 600;
    letter-spacing: 3px;
    color: var(--primary-color);
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>

<!-- Quick View Modal -->
<div class="modal fade" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="quickViewModalLabel">Quick View</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="product-image">
                            <img src="" alt="" class="img-fluid rounded-3" id="quickViewImage">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h3 class="product-title" id="quickViewTitle"></h3>
                        <p class="product-category" id="quickViewCategory"></p>
                        <div class="product-price mb-3" id="quickViewPrice"></div>
                        <p class="product-description mb-4" id="quickViewDescription">
                            Experience the perfect blend of style and comfort with our premium furniture collection.
                        </p>
                        <div class="product-meta">
                            <div class="mb-3">
                                <label class="form-label">Quantity</label>
                                <div class="input-group quantity-selector" style="width: 130px;">
                                    <button class="btn btn-outline-secondary" type="button" id="decreaseQuantity">-</button>
                                    <input type="number" class="form-control text-center" value="1" min="1" id="productQuantity">
                                    <button class="btn btn-outline-secondary" type="button" id="increaseQuantity">+</button>
                                </div>
                            </div>
                            <div class="d-grid gap-2">
                                <button class="btn btn-primary" id="quickViewAddToCart">
                                    Add to Cart
                                </button>
                                <button class="btn btn-outline-primary" id="quickViewAddToWishlist">
                                    Add to Wishlist
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>