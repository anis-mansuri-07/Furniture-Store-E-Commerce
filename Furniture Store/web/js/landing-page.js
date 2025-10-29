document.addEventListener('DOMContentLoaded', function() {
    // Initialize Quick View functionality
    const quickView = {
        modal: document.getElementById('quickViewModal'),
        image: document.getElementById('quickViewImage'),
        title: document.getElementById('quickViewTitle'),
        category: document.getElementById('quickViewCategory'),
        price: document.getElementById('quickViewPrice'),
        quantity: document.getElementById('productQuantity'),
        currentProduct: null,

        init() {
            this.bindEvents();
            if (this.modal) {
                this.modal.addEventListener('show.bs.modal', this.updateModalContent.bind(this));
            }
        },

        bindEvents() {
            document.querySelectorAll('.btn-quickview').forEach(button => {
                button.addEventListener('click', (e) => {
                    const card = button.closest('.product-card');
                    this.currentProduct = {
                        id: parseInt(card.dataset.productId),
                        name: card.querySelector('.product-title').textContent,
                        price: parseFloat(card.querySelector('.product-price').textContent.replace('$', '').replace(',', '')),
                        category: card.querySelector('.product-category').textContent,
                        image: card.querySelector('img').src
                    };
                });
            });

            // Quantity controls
            document.getElementById('decreaseQuantity')?.addEventListener('click', () => {
                if (this.quantity.value > 1) {
                    this.quantity.value = parseInt(this.quantity.value) - 1;
                }
            });

            document.getElementById('increaseQuantity')?.addEventListener('click', () => {
                this.quantity.value = parseInt(this.quantity.value) + 1;
            });

            // Add to Cart from Quick View
            document.getElementById('quickViewAddToCart')?.addEventListener('click', () => {
                if (this.currentProduct) {
                    cart.addItem(
                        this.currentProduct.id,
                        this.currentProduct.name,
                        this.currentProduct.price,
                        parseInt(this.quantity.value)
                    );
                    const modalInstance = bootstrap.Modal.getInstance(this.modal);
                    modalInstance.hide();
                }
            });

            // Add to Wishlist from Quick View
            document.getElementById('quickViewAddToWishlist')?.addEventListener('click', () => {
                if (this.currentProduct) {
                    wishlist.toggleItem(
                        this.currentProduct.id,
                        this.currentProduct.name,
                        this.currentProduct.price,
                        this.currentProduct.image
                    );
                }
            });
        },

        updateModalContent() {
            if (this.currentProduct) {
                this.image.src = this.currentProduct.image;
                this.image.alt = this.currentProduct.name;
                this.title.textContent = this.currentProduct.name;
                this.category.textContent = this.currentProduct.category;
                this.price.textContent = `$${this.currentProduct.price.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2})}`;
                this.quantity.value = 1;
            }
        }
    };

    // Enhanced Cart functionality
    const cart = {
        items: [],
        
        init() {
            this.items = JSON.parse(localStorage.getItem('cartItems')) || [];
            this.updateCartCount();
        },
        
        addItem(id, name, price, quantity = 1) {
            const existingItem = this.items.find(item => item.id === id);
            if (existingItem) {
                existingItem.quantity += quantity;
            } else {
                this.items.push({
                    id: id,
                    name: name,
                    price: price,
                    quantity: quantity
                });
            }
            this.saveCart();
            this.updateCartCount();
            this.showNotification(`${quantity} ${name}${quantity > 1 ? 's' : ''} added to cart!`);
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
        }
    };

    // Enhanced Wishlist functionality
    const wishlist = {
        items: [],
        
        init() {
            this.items = JSON.parse(localStorage.getItem('wishlistItems')) || [];
            this.updateWishlistButtons();
            this.bindEvents();
        },
        
        toggleItem(id, name, price, imageUrl) {
            const index = this.items.findIndex(item => item.id === id);
            if (index === -1) {
                this.items.push({ id, name, price, imageUrl });
                this.showNotification(`${name} added to wishlist!`);
            } else {
                this.items.splice(index, 1);
                this.showNotification(`${name} removed from wishlist!`);
            }
            this.saveWishlist();
            this.updateWishlistButtons();
        },
        
        updateWishlistButtons() {
            document.querySelectorAll('.btn-heart').forEach(button => {
                const card = button.closest('.product-card');
                if (card) {
                    const id = parseInt(card.dataset.productId);
                    if (this.items.some(item => item.id === id)) {
                        button.classList.add('active');
                    } else {
                        button.classList.remove('active');
                    }
                }
            });
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
                    if (card) {
                        const id = parseInt(card.dataset.productId);
                        const name = card.querySelector('.product-title').textContent;
                        const priceElement = card.querySelector('.product-price');
                        const price = parseFloat(priceElement.textContent.replace(/[^0-9.]/g, ''));
                        const imageUrl = card.querySelector('img').src;
                        this.toggleItem(id, name, price, imageUrl);
                    }
                });
            });

            // Add event listener for quick view wishlist button
            document.getElementById('quickViewAddToWishlist')?.addEventListener('click', () => {
                const modal = document.getElementById('quickViewModal');
                const id = parseInt(modal.dataset.productId);
                const name = modal.querySelector('#quickViewTitle').textContent;
                const price = parseFloat(modal.querySelector('#quickViewPrice').textContent.replace(/[^0-9.]/g, ''));
                const imageUrl = modal.querySelector('#quickViewImage').src;
                this.toggleItem(id, name, price, imageUrl);
            });
        }
    };

    // Initialize components
    quickView.init();
    cart.init();
    wishlist.init();

    // Initialize Swiper
    const featuredSwiper = new Swiper('.featured-swiper', {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
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

    // Smooth scroll for anchor links
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

    // Navbar scroll effect
    const navbar = document.querySelector('.custom-navbar');
    if (navbar) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });
    }

    // Loading animation
    const loadingOverlay = document.querySelector('.loading-overlay');
    if (loadingOverlay) {
        window.addEventListener('load', function() {
            loadingOverlay.style.opacity = '0';
            setTimeout(() => {
                loadingOverlay.style.display = 'none';
            }, 500);
        });
    }

    // Intersection Observer for animations
    const animateOnScroll = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate__animated', entry.target.dataset.animation);
            }
        });
    }, {
        threshold: 0.1
    });

    // Add animations to elements
    document.querySelectorAll('[data-animation]').forEach((element) => {
        animateOnScroll.observe(element);
    });

    // Product quick view functionality
    document.querySelectorAll('.quick-view-btn').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const productId = this.dataset.productId;
            showQuickView(productId);
        });
    });

    // Add to cart functionality
    window.addToCart = function(productId, name, price) {
        // Show loading state
        const button = event.target;
        const originalText = button.innerText;
        button.disabled = true;
        button.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Adding...';

        // Simulate API call
        setTimeout(() => {
            // Reset button state
            button.disabled = false;
            button.innerText = originalText;

            // Show success message
            const toast = new bootstrap.Toast(document.getElementById('cartToast'));
            document.getElementById('cartToastMessage').textContent = `${name} added to cart!`;
            toast.show();
        }, 1000);
    };
});

// Quick view modal functionality
function showQuickView(productId) {
    // Implement quick view modal logic here
    const modal = new bootstrap.Modal(document.getElementById('quickViewModal'));
    
    // Simulate loading product data
    document.querySelector('#quickViewModal .modal-body').innerHTML = `
        <div class="text-center">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    `;
    
    modal.show();
    
    // Simulate API call to get product details
    setTimeout(() => {
        // Update modal content with product details
        // This is a placeholder - replace with actual API call
        document.querySelector('#quickViewModal .modal-body').innerHTML = `
            <div class="row">
                <div class="col-md-6">
                    <img src="images/products/product-${productId}.jpg" class="img-fluid" alt="Product Image">
                </div>
                <div class="col-md-6">
                    <h3>Product Name</h3>
                    <p class="text-muted">Category</p>
                    <p class="h4 mb-4">$999.99</p>
                    <p>Product description goes here...</p>
                    <button class="btn btn-primary" onclick="addToCart(${productId}, 'Product Name', 999.99)">
                        Add to Cart
                    </button>
                </div>
            </div>
        `;
    }, 1000);
} 