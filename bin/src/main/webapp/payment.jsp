<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<html>
<head>
    <title>Payment | Apex Academic Centre</title>
    <meta name="description" content="Get personalized tutoring with Apex Academic Centre's expert online and in-person tutors. Book your tutor today!">
    
    <!-- SEO Image -->
    <link rel="icon" href="seo_logo.jpeg" sizes="50x50" type="image/x-icon">

 <!-- Open Graph Protocol (Facebook, LinkedIn) -->
<meta property="og:title" content="Book a Tutor | Expert Online and In-person Tutors | Apex Academic Centre">
<meta property="og:description" content="Get personalized tutoring with Apex Academic Centre's expert online and in-person tutors. Book your tutor today!">
<meta property="og:image" content="https://bookatutorapexacademiccentre.co.za/seo.jpeg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:url" content="https://bookatutorapexacademiccentre.co.za/">
<meta property="og:type" content="website">

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Book a Tutor | Expert Online and In-person Tutors | Apex Academic Centre">
<meta name="twitter:description" content="Get personalized tutoring with Apex Academic Centre's expert online and in-person tutors. Book your tutor today!">
<meta name="twitter:image" content="https://bookatutorapexacademiccentre.co.za/seo.jpeg">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link href="tutorNewPage.css" rel="stylesheet">
    <script src="https://www.paypal.com/sdk/js?client-id=Af6Npuwe7XWQae1F2Z-d3Cpv182tycmxPbGhFSiP0PWtVQt8HEAEyZNm9GR9noxyVZHk9OelUYONUj8E"></script>
    <style>
        body {
    font-family: 'Montserrat', sans-serif;
    background-color: white;
    overflow: hidden; /* Disable scrolling */
}

.navbar {
    display: flex;
    justify-content: left;
    align-items: center;
    padding: 10px;
    height: 80px; /* Adjust the height as needed */
    position: fixed; /* Fixes the navbar to the top of the viewport */
    top: 0; /* Positions it at the top */
    left: 0; /* Ensures it stretches from the left edge */
    right: 0; /* Ensures it stretches to the right edge */
    z-index: 1000; /* Ensures it stays on top of other content */
    background-color: white;
}

.logo {
    max-width: 100%;
    height: auto;
}

.main-section {
    margin-top: 8%;
    text-align: center;
}

.text-content {
    
    text-align: left; /* Align text to the left for better readability */
}

.secure-paragraph {
    font-size: 60px;
    color: rgb(252, 195, 11);
    margin: 0;
}

.gateway-paragraph {
    font-size: 40px;
    color: green;
    margin: 0;
}

.payment-methods-paragraph {
    font-size: 16px;
    color: gray;
    margin: 0;
}

.back-button {
    padding: 10px 20px; /* Increased height */
    font-size: 18px; /* Larger font size */
    color: white; /* Text color */
    background-color: green; /* Button color */
    border: none; /* No border */
    border-radius: 10px; /* Rounded corners */
    cursor: pointer; /* Pointer cursor on hover */
    transition: transform 0.2s, color 0.2s, background-color 0.2s; /* Animation effect */
}

.back-button:hover {
    color: green; /* Change text color on hover */
    background-color: white; /* Change background color on hover */
}

.back-button:active {
    transform: scale(1.1); /* Scale effect on click */
}

.center-button {
    margin-top: 5%;
    margin-left: 20% ; /* Center the button */
    display: flex; /* Use Flexbox for alignment */
    align-items: center; /* Center vertically */
    gap: 10px;
   
}

.image-container {
    height: 600px;
    margin: 0;
    padding: 0;
    flex-shrink: 0; /* Prevents shrinking */
}

@media (max-width: 600px) {
    .navbar {
        height: 60px; /* Reduce height for mobile */
    }

    .secure-paragraph {
        font-size: 40px; /* Adjust font size for mobile */
    }

    .gateway-paragraph {
        font-size: 30px; /* Adjust font size for mobile */
    }

    .payment-methods-paragraph {
        font-size: 14px; /* Adjust font size for mobile */
    }

    .back-button {
        font-size: 16px; /* Smaller button text for mobile */
        padding: 8px 16px; /* Smaller button padding */
    }

    .text-content {
        margin: 2% 2%; /* Adjust margins for mobile */
        text-align: center; /* Center text on mobile */
    }

    .main-class {
        flex-direction: column; /* Stack elements vertically on mobile */
        align-items: center; /* Center items */
    }

    .image-container {
        height: auto; /* Allow image container to adjust height automatically */
        margin-top: 10px; /* Add some spacing */
    }

    .center-button {
        flex-direction: column; /* Stack buttons vertically */
        margin-left: 0; /* Center button container */
    }
}

@media (min-width: 1367px) {
    .main-section {
       margin-left: 10%;
       margin-right:10%;
    }

    .navbar img{
        margin-left: 12%;
    }
    .main-class{

        margin-left: 10%;
        margin-right:10%;

    }
}

    </style>
</head>
<body>

<nav class="navbar">
    <img src="apex.png" alt="Logo" class="logo" id="logo_image">
</nav>

<section class="main-section">
    <section class="main-class" style="display: flex;">
        <div class="text-content" style="flex: 1;">
            <p class="secure-paragraph">Secure</p>
            <p class="gateway-paragraph">Gateway payment methods</p>
            <p class="payment-methods-paragraph">Our online payment methods offer you the ability to accept payment securely from multiple localised payment methods and globally recognised card associations.</p>

            <%
            String amount = (String)session.getAttribute("amount");

            String baseUrl = "https://bookatutorapexacademiccentre.co.za/"; // Change this to your actual domain
            String successUrl = baseUrl + "success";
            String failedUrl = baseUrl + "/payment/failed"; // Handle failed payments
            %>

            <form name="PayFastPayNowForm" action="https://payment.payfast.io/eng/process" method="post">
                <input required type="hidden" name="cmd" value="_paynow">
                <input required type="hidden" name="receiver" pattern="[0-9]" value="25220959">
                <input required type="hidden" name="amount" value="<%= amount %>">
                <input required type="hidden" name="item_name" maxlength="255" value="Payment">
                <input type="hidden" name="item_description" maxlength="255" value="Package Payment">
                <input type="hidden" name="return_url" value="<%= successUrl %>"> 
                <div class="center-button">
                    <button type="button" class="back-button" onclick="goBack()">Back</button>
                    <input type="image" src="https://my.payfast.io/images/buttons/PayNow/Primary-Large-PayNow.png" alt="Pay Now" title="Pay Now with Payfast">
                </div>
            </form>
  
            <img src="secureGateway.jpeg" alt="secure" class="secure" id="secure" style="max-width: 100%; height: auto;">
        </div>
        <div class="image-container" style="flex-shrink: 0;">
            <img src="payment.jpeg" alt="payment" class="payment" id="payment" style="max-width: 100%; height: auto;">
        </div>
    </section>
</section>

<script>
    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
