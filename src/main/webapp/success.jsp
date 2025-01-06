
<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Payment Successful | Apex Academic Centre</title>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="tutorNewPage.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f6fffa;
            text-align: center;
            padding: 50px;
        }
        h1 {
            color: green;
        }
        p {
            font-size: 18px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<%

    String name = (String) request.getAttribute("name");
    String email = (String) request.getAttribute("email");

%>

<div class="container">
    <h1>Payment Successful!</h1>
    <p>Thank you, <strong><%= name %></strong></p>
    <p>Your payment has been successfully processed.</p>
    <p>A confirmation has been sent to <strong><%= email %></strong>.</p>
    <p>Apex Academic Centre</p>
</div>

<script>
    window.onload = function() {
        setTimeout(function(){
            window.location.href = '/';
        }, 3000); // Redirect after 3 seconds
    };
</script>

</body>
</html>
