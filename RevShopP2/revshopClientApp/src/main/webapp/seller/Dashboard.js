$(document).ready(function() {
  $(".navbar-toggler").click(function() {
    // Toggle between the open (hamburger) and close (X) icons
    $("#menu-icon").toggleClass("fa-bars fa-times");
  });
});

// Existing code for analytics and chart creation...

function logout() {
  fetch('http://localhost:8083/retailerservice/retailer/logout', {
    method: 'GET',
    credentials: 'include' // Ensure cookies are sent
  })
  .then(response => {
    if (!response.ok) {
      throw new Error('Logout failed');
    }
    return response.text();
  })
  .then(message => {
    console.log(message);
    // Redirect to login page
    window.location.href = 'login.jsp'; // Change to your login page
  })
  .catch(error => {
    console.error('Error during logout:', error);
    alert('Logout failed. Please try again.');
  });
}

// AJAX to fetch retailer information
function fetchRetailerDetails() {
  fetch('http://localhost:8083/retailerservice/retailer/homepage', {
    method: 'GET',
    credentials: 'include' // Ensure cookies are sent
  })
  .then(response => {
    if (!response.ok) {
      throw new Error('Failed to fetch retailer details');
    }
    return response.json();
  })
  .then(data => {
    // Update the UI with retailer details
    document.getElementById('retailerName').textContent = data.businessName;
    document.getElementById('retailerEmail').textContent = data.email;
    document.getElementById('retailerId').textContent = data.retailerId;
  })
  .catch(error => {
    console.error('Error fetching retailer details:', error);
    alert('Unable to fetch retailer details. Please try again later.');
  });
}


function displayRetailerDetails() {
    const retailerName = sessionStorage.getItem('businessName'); // Correct key for business name
    const email = sessionStorage.getItem('email'); // Corrected key name
    const retailerId = sessionStorage.getItem('retailerId');
    const password = sessionStorage.getItem('password');

    // Update the UI with retailer details
    document.getElementById('retailerName').textContent = retailerName || 'Retailer';
    document.getElementById('email').textContent = email || 'Not provided';
    document.getElementById('retailerId').textContent = retailerId || 'Not provided';
    document.getElementById('password').textContent = password || 'Not provided'; 
}









