<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- Wishlist Page -->
<section class="wishlist-section py-7">
    <div class="container">
        <div class="section-header text-center mb-5">
            <span class="subtitle text-primary text-uppercase">Your Favorites</span>
            <h2 class="section-title">My Wishlist</h2>
            <div class="section-line"></div>
        </div>
        
        <div class="row" id="wishlist-items">
            <!-- Wishlist items will be loaded here via JavaScript -->
            <div class="col-12 text-center empty-wishlist-message">
                <div class="py-5">
                    <i class="bi bi-heart" style="font-size: 4rem; color: #ddd;"></i>
                    <h3 class="mt-4">Your wishlist is empty</h3>
                    <p class="text-muted">Add items to your wishlist to save them for later.</p>
                    <a href="index.jsp" class="btn btn-primary mt-3">Continue Shopping</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Wishlist Script -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Load wishlist items from localStorage
    const wishlistItems = JSON.parse(localStorage.getItem('wishlistItems')) || [];
    const wishlistContainer = document.getElementById('wishlist-items');
    const emptyMessage = document.querySelector('.empty-wishlist-message');
    
    // Display wishlist items or empty message
    if (wishlistItems.length > 0) {
        // Hide empty message
        emptyMessage.style.display = 'none';
        
        // Create HTML for each wishlist item
        wishlistItems.forEach(item => {
            const itemElement = document.createElement('div');
            itemElement.className = 'col-md-6 col-lg-4 col-xl-3 mb-4';
            itemElement.innerHTML = `
                <div class="product-card" data-product-id="${item.id}">
                    <div class="product-image">
                        <img src="${item.imageUrl}" alt="${item.name}">
                        <div class="product-actions">
                            <button onclick="cart.addItem(${item.id}, '${item.name}', ${item.price})" class="btn btn-primary rounded-circle" title="Add to Cart">
                                <i class="bi bi-cart-plus"></i>
                            </button>
                            <button class="btn btn-danger rounded-circle btn-remove-wishlist" title="Remove from Wishlist">
                                <i class="bi bi-x-lg"></i>
                            </button>
                        </div>
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">${item.name}</h3>
                        <div class="product-price">$${item.price.toFixed(2)}</div>
                    </div>
                </div>
            `;
            wishlistContainer.appendChild(itemElement);
        });
        
        // Add event listeners for remove buttons
        document.querySelectorAll('.btn-remove-wishlist').forEach(button => {
            button.addEventListener('click', function() {
                const card = this.closest('.product-card');
                const productId = parseInt(card.dataset.productId);
                
                // Remove from localStorage
                const updatedWishlist = wishlistItems.filter(item => item.id !== productId);
                localStorage.setItem('wishlistItems', JSON.stringify(updatedWishlist));
                
                // Remove from DOM with animation
                card.closest('.col-md-6').classList.add('animate__animated', 'animate__fadeOut');
                setTimeout(() => {
                    card.closest('.col-md-6').remove();
                    
                    // Show empty message if no items left
                    if (updatedWishlist.length === 0) {
                        emptyMessage.style.display = 'block';
                    }
                    
                    // Update wishlist count in header if it exists
                    const wishlistCount = document.querySelector('.wishlist-count');
                    if (wishlistCount) {
                        wishlistCount.textContent = updatedWishlist.length;
                    }
                }, 500);
            });
        });
    }
});
</script>

<!-- Wishlist Styles -->
<style>
.product-card {
    background: #fff;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    transition: all 0.3s ease;
    height: 100%;
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

.product-price {
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--primary-color);
}

.empty-wishlist-message {
    background: #f8f9fa;
    border-radius: 1rem;
    padding: 3rem;
}
</style>

<%@ include file="footer.jsp" %>