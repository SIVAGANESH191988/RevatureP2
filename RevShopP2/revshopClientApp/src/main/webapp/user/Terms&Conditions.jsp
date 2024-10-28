<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce FAQs</title>
    <style>
/* Base Styles */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f9f9f9; /* Light background for contrast */
    margin: 0;
    padding: 20px; /* Add padding to the body */
}

/* FAQ Section */
.faq-section {
    max-width: 800px; /* Increased width for larger screens */
    margin: 20px auto; /* Centering the FAQ section */
    background-color: #ffffff; /* White background for the FAQ container */
    border-radius: 8px; /* Rounded corners for aesthetics */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
    padding: 20px; /* Padding inside the FAQ container */
}

/* Headings */
h2 {
    text-align: center; /* Centered heading */
    color: #333; /* Darker color for better visibility */
}

/* FAQ Questions */
.faq-question {
    background-color: #e8e8e8; /* Lighter background for questions */
    padding: 15px; /* Increased padding for comfort */
    border: 1px solid #ccc; /* Border for separation */
    cursor: pointer; /* Cursor changes to pointer on hover */
    margin-top: 10px; /* Space between questions */
    border-radius: 5px; /* Slight rounding of corners */
    transition: background-color 0.3s; /* Smooth transition for hover effect */
}

/* Active Question Highlight */
.faq-question.active-question {
    background-color: #d1d1d1; /* Different background color for active question */
}

/* FAQ Answers */
.faq-answer {
    display: none; /* Hidden by default */
    padding: 10px; /* Padding for answers */
    border: 1px solid #ccc; /* Border for separation */
    margin-top: -1px; /* Negative margin to eliminate gap */
    background-color: #f9f9f9; /* Light background for answers */
    border-radius: 0 0 5px 5px; /* Rounded bottom corners */
    transition: max-height 0.3s ease-out; /* Smooth reveal transition */
    overflow: hidden; /* Hide overflow */
}

/* Hover Effect for Questions */
.faq-question:hover {
    background-color: #d9d9d9; /* Slightly darker background on hover */
}

/* Responsive Design */
@media (max-width: 768px) {
    .faq-section {
        width: 90%; /* Full width for smaller screens */
    }

    .faq-question {
        font-size: 1.1em; /* Larger text for better readability */
    }

    h2 {
        font-size: 1.5em; /* Larger heading for small screens */
    }
}
    </style>
    <script>
        function toggleAnswer(id) {
            var allAnswers = document.getElementsByClassName('faq-answer');
            var allQuestions = document.getElementsByClassName('faq-question');

            // Hide all answers and remove active class from all questions
            for (var i = 0; i < allAnswers.length; i++) {
                allAnswers[i].style.display = 'none';
                allQuestions[i].classList.remove("active-question");
            }

            // Show the selected answer and add active class to its question
            var answer = document.getElementById(id);
            var question = document.getElementById('question-answer-' + id);
            answer.style.display = 'block';
            question.classList.add("active-question");
        }
    </script>
</head>
<body>
    <div class="faq-section">
        <h2>Frequently Asked Questions</h2>
        
        <!-- Question 1 -->
        <div id="question-answer-1" class="faq-question" onclick="toggleAnswer('1')">
            1. How can I track my order?
        </div>
        <div id="1" class="faq-answer">
            Once your order has been shipped, you will receive an email with a tracking number. You can use this number to track your order on the courier’s website.
        </div>
        
        <!-- Question 2 -->
        <div id="question-answer-2" class="faq-question" onclick="toggleAnswer('2')">
            2. What payment methods are accepted?
        </div>
        <div id="2" class="faq-answer">
            We accept a variety of payment methods including credit/debit cards, PayPal, net banking, and digital wallets such as Google Pay and Apple Pay.
        </div>

        <!-- Question 3 -->
        <div id="question-answer-3" class="faq-question" onclick="toggleAnswer('3')">
            3. Can I cancel or change my order after placing it?
        </div>
        <div id="3" class="faq-answer">
            You can cancel or modify your order before it is shipped by visiting the "My Orders" section in your account. Once the order has been shipped, changes or cancellations are no longer possible.
        </div>

        <!-- Question 4 -->
        <div id="question-answer-4" class="faq-question" onclick="toggleAnswer('4')">
            4. What is your return policy?
        </div>
        <div id="4" class="faq-answer">
            Our return policy allows you to return items within 30 days of receiving them, provided they are in their original condition and packaging. For detailed information, please visit our Return Policy page.
        </div>

        <!-- Question 5 -->
        <div id="question-answer-5" class="faq-question" onclick="toggleAnswer('5')">
            5. How long will it take for my refund to be processed?
        </div>
        <div id="5" class="faq-answer">
            Once we receive your returned item, the refund will be processed within 5-7 business days. The amount will be credited back to the original payment method used during checkout.
        </div>

        <!-- Question 6 -->
        <div id="question-answer-6" class="faq-question" onclick="toggleAnswer('6')">
            6. Do you offer international shipping?
        </div>
        <div id="6" class="faq-answer">
            Yes, we do offer international shipping to selected countries. Shipping costs and delivery times vary based on the destination. For more information, check our Shipping Policy page.
        </div>

        <!-- Additional Questions -->
        
        <!-- Question 7 -->
        <div id="question-answer-7" class="faq-question" onclick="toggleAnswer('7')">
            7. How can I create an account?
        </div>
        <div id="7" class="faq-answer">
            You can create an account by clicking on the "Sign Up" button on the top right of our homepage. Fill in the required details, and you’ll be ready to start shopping.
        </div>

        <!-- Question 8 -->
        <div id="question-answer-8" class="faq-question" onclick="toggleAnswer('8')">
            8. How do I apply a discount code?
        </div>
        <div id="8" class="faq-answer">
            During the checkout process, you will find a field labeled "Discount Code" where you can enter your code. Once applied, the discount will reflect in the total amount.
        </div>

        <!-- Question 9 -->
        <div id="question-answer-9" class="faq-question" onclick="toggleAnswer('9')">
            9. Can I place an order without an account?
        </div>
        <div id="9" class="faq-answer">
            Yes, you can place an order as a guest. However, creating an account allows you to track your orders more easily and enjoy faster checkout on future purchases.
        </div>

        <!-- Question 10 -->
        <div id="question-answer-10" class="faq-question" onclick="toggleAnswer('10')">
            10. What do I do if I forget my password?
        </div>
        <div id="10" class="faq-answer">
            If you forget your password, click on the "Forgot Password" link on the login page. You’ll receive an email with instructions on how to reset it.
        </div>
    </div>
</body>
</html>