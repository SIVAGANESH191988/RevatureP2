/**
 * 
 */
$(document).ready(function() {
  $(".navbar-toggler").click(function() {
    $("#menu-icon").toggleClass("fa-bars fa-times");
  });

  // Close the navbar when a menu item is clicked
  $(".navbar-nav .nav-link").click(function() {
    $(".navbar-collapse").collapse('hide'); 
// Hide the navbar
    $("#menu-icon").removeClass("fa-times").addClass("fa-bars"); 
// Reset the icon
  });
});



document.addEventListener('DOMContentLoaded', () => {
    const container = document.querySelector('.image-container');
    const scrollableImages = document.querySelector('.image-slider');
  
    container.addEventListener('mousemove', (event) => {
      const containerWidth = container.offsetWidth;
      const scrollWidth = scrollableImages.scrollWidth;
      const mouseX = event.clientX - container.offsetLeft;
      const maxScroll = scrollWidth - containerWidth;
      const scrollValue = (mouseX / containerWidth) * maxScroll;
  
      scrollableImages.style.transform = `translateX(-${scrollValue}px)`;
    });
  })
  