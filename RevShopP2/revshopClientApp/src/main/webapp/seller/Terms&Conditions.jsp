<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms and Conditions - REVSHOP</title>
    <link rel="stylesheet" href="terms&conditions.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.1/aos.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.1/aos.js"></script>
</head>
<body onload="AOS.init()">
    <header>
        <div class="logo"><img src="IMAGES/LOGO.png" alt="REVSHOP Logo"></div>
        <h1>Terms and Conditions</h1>
    </header>
    <main>
        <section class="terms-section" data-aos="fade-up">
            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">1. What is the acceptance of terms?</div>
                <div class="answer">By creating a retailer account on REVSHOP, you agree to comply with and be bound by these Terms and Conditions. If you do not agree, please do not use our services.</div>
            </div>

            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">2. What are my account responsibilities?</div>
                <div class="answer">As a retailer, you are responsible for maintaining the confidentiality of your account information, including your password, and for all activities that occur under your account.</div>
            </div>

            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">3. How should I use the services?</div>
                <div class="answer">You agree to use the services provided by REVSHOP only for lawful purposes and in accordance with all applicable laws and regulations. Do not misuse our services.</div>
            </div>

            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">4. What is my responsibility for listing products?</div>
                <div class="answer">You are responsible for the accuracy and legality of the products listed on our platform. REVSHOP reserves the right to remove any listings that violate our policies.</div>
            </div>

            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">5. What are the payment terms?</div>
                <div class="answer">Payments for sales made through REVSHOP are processed through our secure payment gateway. You must provide accurate payment information.</div>
            </div>

            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">6. What happens if my account is terminated?</div>
                <div class="answer">REVSHOP reserves the right to suspend or terminate your account at any time without notice if you violate these Terms and Conditions.</div>
            </div>

            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">7. What is the limitation of liability?</div>
                <div class="answer">In no event shall REVSHOP be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the services.</div>
            </div>

            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">8. Can the terms change?</div>
                <div class="answer">We reserve the right to modify these Terms and Conditions at any time. Changes will be effective immediately upon posting on this page.</div>
            </div>

            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">9. What is the governing law?</div>
                <div class="answer">These Terms and Conditions shall be governed by and construed in accordance with the laws of [Your Jurisdiction].</div>
            </div>

            <div class="qa-container" data-aos="fade-up" data-aos-duration="500">
                <div class="question" onmouseover="showAnswer(this)" onmouseout="hideAnswer(this)">10. How can I contact you?</div>
                <div class="answer">If you have any questions about these Terms and Conditions, please contact us at <a href="mailto:support@revshop.com">support@revshop.com</a>.</div>
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 REVSHOP. All rights reserved.</p>
    </footer>
    <script>
    let currentlyVisible = null;

    function showAnswer(element) {
        const answer = element.nextElementSibling; // Get the next sibling which is the answer

        // If another answer is visible, fade it out
        if (currentlyVisible && currentlyVisible !== answer) {
            currentlyVisible.classList.remove('visible');
            currentlyVisible.style.opacity = '0'; // Fade out
        }

        // Show the current answer
        answer.classList.add('visible');
        answer.style.opacity = '1'; // Fade in
        currentlyVisible = answer; // Update currently visible answer
    }

    function hideAnswer(element) {
        const answer = element.nextElementSibling; // Get the next sibling which is the answer
        answer.classList.remove('visible'); // Remove visibility
        answer.style.opacity = '0'; // Fade out
    }

    </script>
</body>
</html>
