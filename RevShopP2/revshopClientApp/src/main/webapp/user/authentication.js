/**
 * 
 */
let container = document.getElementById('container')

toggle = () => {
	container.classList.toggle('sign-in')
	container.classList.toggle('sign-up')
}

setTimeout(() => {
	container.classList.add('sign-in')
}, 200)


window.onload = function() {
            var message = "${message}"; // Get the message from request attributes
            if (message) {
                document.getElementById("alertMessage").innerText = message; // Set the alert message
                document.getElementById("alertContainer").style.display = "block"; // Show the alert
                $('#alertContainer').fadeIn(); // Fade in the alert for smoothness
            }
        };