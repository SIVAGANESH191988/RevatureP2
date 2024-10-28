document.addEventListener('DOMContentLoaded', () => {
    // Initialize AOS
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true,
    });

    const mobileNavToggle = document.querySelector('.mobile-nav-toggle');
    const navMenu = document.getElementById('navmenu');
    const scrollTopBtn = document.getElementById('scroll-top');
    const header = document.getElementById('header');

    // Toggle Mobile Navigation
    mobileNavToggle.addEventListener('click', () => {
        navMenu.classList.toggle('active');
    });

    // Close Mobile Navigation on Link Click
    navMenu.querySelectorAll('a').forEach(link => {
        link.addEventListener('click', () => {
            if (navMenu.classList.contains('active')) {
                navMenu.classList.remove('active');
            }
        });
    });

    // Show/Hide Scroll Top Button
    window.addEventListener('scroll', () => {
        if (window.scrollY > 200) {
            scrollTopBtn.style.display = 'flex';
            header.classList.add('scrolled');
        } else {
            scrollTopBtn.style.display = 'none';
            header.classList.remove('scrolled');
        }
    });
});
