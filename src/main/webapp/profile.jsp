<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Tutor" %>
<%@ page import="com.example.demo.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--<title>Book a Tutor | Expert Online and In-person Tutors | Apex Academic Centre</title>-->
    <title>${tutor.fullNames} | Tutor Profile | Expert Online and In-person Tutors | Apex Academic Centre</title>
    <meta name="description" content="Get personalized tutoring with Apex Academic Centre's expert online and in-person tutors. Book your tutor today!">
    
    <link rel="icon" href="seo_logo.jpeg" sizes="50x50" type="image/x-icon">

 <!-- Open Graph Protocol (Facebook, LinkedIn) -->
 <meta property="og:title" content="${tutor.fullNames} | Expert Online and In-person Tutors | Apex Academic Centre">
 <meta property="og:description" content="Get personalized tutoring with Apex Academic Centre's expert online and in-person tutors. Book your tutor today!">
 <meta property="og:image" content="https://bookatutorapexacademiccentre.co.za/seo.jpeg">
 <meta property="og:image:width" content="1200">
 <meta property="og:image:height" content="630">
 <meta property="og:url" content="https://bookatutorapexacademiccentre.co.za/view-profile/name=${tutor.fullNames}">
 <meta property="og:type" content="website">    

 <!-- Twitter Card -->
 <meta name="twitter:card" content="summary_large_image">
 <meta name="twitter:title" content="${tutor.fullNames} | Expert Online and In-person Tutors | Apex Academic Centre">
 <meta name="twitter:description" content="Get personalized tutoring with Apex Academic Centre's expert online and in-person tutors. Book your tutor today!">
 <meta name="twitter:image" content="https://bookatutorapexacademiccentre.co.za/seo.jpeg">

    <!--  <link rel="icon" href="data:image/png;base64, ${imageImage}" sizes="50x50" type="image/x-icon"> -->

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <!--=============== REMIXICONS ===============-->
          <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">
          <!--=============== SWIPER CSS ===============-->
         <link rel="stylesheet" href="assets/swiper-bundle.min.css"> 
    
          <!--=============== CSS ===============-->
          <link rel="stylesheet" href="assets/styles.css">
          <link href="bookingRep.css" rel="stylesheet">
          <link href="profileTutor.css" rel="stylesheet"> 
          <style>
         


         .checkbox-container{
            display: inline-flex;
        }   
                
        .opt{
            display: none;
        }

        #fProvince{
            display: none; /* Hide province by default */
        }

        .popup {
                display: flex;
                justify-content: center;
                align-items: center;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 1000;
            }

            .popup-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                width: 500px;
                text-align: center;
                cursor: pointer;
            }

            .popup-content:hover {
                    transform: scale(1.05); /* Slightly enlarge on hover */
                }

            .close {
                cursor: pointer;
                float: right;
                font-size: 20px;
            }
            .hide {
                display: none;
            }

            #pack-details {
                text-align: left; /* Aligns text to the left */
                /* Optional: You can also add padding or margin for better appearance */
                padding: 10px; 
            }

            .package-details:hover{
                transform: scale(1.05); /* Slightly enlarge on hover */
            }

            #popular{
                color: #001549;
                font-weight: bold;
            }

            @media screen and (max-width: 1024px) {

                
                .popup {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background-color: rgba(0, 0, 0, 0.5);
                        z-index: 1000;
            }

            .popup-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                width: 300px;
                text-align: center;
                cursor: pointer;
            }

            .popup-content:hover {
                    transform: scale(1.05); /* Slightly enlarge on hover */
                    cursor: pointer;
                }

            .close {
                cursor: pointer;
                float: right;
                font-size: 20px;
            }
            .hide {
                display: none;
            }

            #pack-details {
                text-align: left; /* Aligns text to the left */
                /* Optional: You can also add padding or margin for better appearance */
                padding: 10px; 
            }

            .package-details:hover{
                transform: scale(1.05); /* Slightly enlarge on hover */
                cursor: pointer;
            }

            #popular{
                color: #001549;
                font-weight: bold;

            }
                
            }

            .subject-label {
                max-width: 250x; /* Set max width for the label */
                overflow: hidden; /* Hide overflow text */
                text-overflow: ellipsis; /* Show ellipsis for overflow text */
                white-space: nowrap; /* Prevent text wrapping */
                display: flex; /* Keep flex for alignment */
                align-items: center; /* Center checkbox and text */
            }

            #tutorNameDisplay{
                font-size: 20px;
            }

            #termsCondition{

                  color: #02A552;
            }

            .whatsapp-wrapper {
            position: fixed; /* Keeps the icon fixed on the screen */
            bottom: 20px; /* Distance from the bottom */
            right: 20px; /* Distance from the right */
            z-index: 1000; /* Ensure it stays on top of other content */
        }

        .whatsapp-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 60px; /* Adjust the size as needed */
            height: 60px; /* Adjust the size as needed */
            border-radius: 50%; /* Makes it circular */
            background-color: #25D366; /* Circle background color */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3); /* Optional shadow for better visibility */
            text-decoration: none; /* Remove underline */
        }
       
        .arrow-container{
            margin-bottom: 90px;
        }


        /*The footer*/

        body{
	
            background-color: #e7eeff;  
        }

        footer {
                background-color: #001549; 
                color: white; 
                font-family: 'Montserrat', sans-serif;
                position: relative; 
                z-index: 0; 
                padding: 70px 0 ; 
                padding-bottom: 0;
                margin-top: -120px; 
                padding-bottom: 0;
            }


            .footer-row {
                margin-top: 90px; 
                margin-right: 0;
                margin-bottom: 10px;
                margin-left: 0;
                border-bottom: 2px solid white;
            }

        

        .footer-heading {
            text-align: left;
            margin: 0 0 15px; 
            font-size: 1.5em;
        }

        .links {
            display: flex; 
        }

        .column {
            flex: 1 0 20%; 
            margin: 5px; 
            text-align: left; 
        }

        .link {
            color: white; 
            background-color: #001549; 
            padding: 10px 15px;
            margin: 5px 0; 
            text-decoration: none;
            border-radius: 5px; 
            display: flex; 
            align-items: center; 
        }

        .link i {
            margin-right: 5px; 
        }

        .link:hover {
            color: #00a550; 
        }

        .myEmail a{
            color: white;
            font-size: small;
        }

       .icons{
        font-size: 25px;
       
        
       }

       .icons a {
            background-color: rgba(255, 255, 255, 0.3); 
            color: white;
            margin-right: 15px; 
            padding: 5px 10px;
            border-radius: 4px;
        }

        .icons a:last-child {
            margin-right: 0;
        }

        .icons a:hover {
            background-color: #02a552; 
        }

        .logo-style {
            margin-right: 20px;
            margin-left: 5px; 
            max-width: 100%;
            height: auto;
        }

        .aboutApex {
            
            line-height: 1.5;
            margin: 0; 
            padding: 0; 
            text-align: left;
            width: 100%; 
            box-sizing: border-box;
        }
        

        /*subscription div*/
        .subscription-container {
            text-align: left; 
            padding: 40px; 
            border: 1px solid #ccc; 
            border-radius: 8px; 
            background-color: #00a550; 
            margin: -80px 80px 20px 60px; 
            width: 80%; 
            color: white; 
            position: relative; 
            z-index: 1; 
            clear: both; 
        }

        .subscription-container h2 {
            margin-bottom: 10px;
        }

        .subscription-wrapper {
            display: flex;
            justify-content: left;
            align-items: left;
            margin-top: 10px;
        }

       

        .subscription-wrapper input {
            padding: 25px; 
            width: 900px; 
            border: 1px solid #ccc; 
            border-radius: 4px 0 0 4px; 
        }

        .subscription-wrapper button {
            padding: 10px; 
            border: none;
            background-color: #00a550;
            color: white; 
            border-radius: 0 4px 4px 0; 
            cursor: pointer; 
            width: 150px; 
        }

        .subscription-wrapper button:hover {
            background-color: white; 
            color: #00a550;
        }

        .footer-row.last-content-row {
            border-bottom: none; 
            margin-bottom: 10px; 
        }

        .footer-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 5px;
            background-color: #000; 
            color: #fff;
            font-size: 14px;
            margin-top: 10px; 
            margin-bottom: 0; 
            width: 100%; 
        }
        
        /* Footer column styling (for layout inside footer-bottom) */
        .footer-bottom .footer-column {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Footer link styling */
        .footer-bottom .footer-column a {
            color: #fff; 
            text-decoration: none;
            font-size: 14px;
            margin-left: 10px;
        }

        /* Footer link hover effect */
        .footer-bottom .footer-column a:hover {
            color: #00a550;
        }



        /*Media for mobile */

        @media screen and (max-width:768px){

        .tutor-container {
        margin-bottom: 150px;
        }
        footer {
            background-color: #001549; 
            color: white; 
            position: relative; 
            z-index: 0; 
            padding: 50px 0; 
            margin-top: -220px;
            width: 100%;
            overflow-x: hidden;
        }

        footer .footer-row:first-of-type {
            padding-top: 60px;  
        }

        .logo-style {
            width:90%;
            height:60px;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        .aboutApex{
        width: 90%;
        }
        .subscription-container {
            margin: -80px 20px 10px; 
            width: auto;
            padding: 20px; 
        }

        .subscription-wrapper {
            flex-direction: column; 
            align-items: stretch; 
        }

        .subscription-wrapper input, 
        .subscription-wrapper button {
            width: 100%; 
            margin-bottom: 10px; 
            padding: 8px; 
            font-size: 14px;
        }

        .subscription-wrapper button {
            border-radius: 4px; 
            padding: 8px; 
        }

        .links {
            flex-direction: column; 
            width: 100%; 
        }

        .myEmail a{
        font-size: 18px;
        }

        .footer-bottom {
            flex-direction: column; 
            text-align: center;
            margin-bottom: 0;
        }

        .footer-column {
        margin-bottom: 15px;
            text-align: center;
        }
        }

        /*LANDSCAPE RESPONSIVE*/
        @media (min-width: 769px) and (max-width: 1024px){
            footer {
            background-color: #001549; 
            color: white; 
            position: relative; 
            z-index: 0; 
            padding: 50px 0; 
            width: 100%;
            overflow-x: hidden;
            }

            .subscription-container {
            text-align: left;
            padding: 40px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #00a550;
            margin: -80px 80px 20px 60px;
            width: 80%;
            color: white;
            position: relative;
            z-index: 1;
            clear: both;
        }

        .subscription-container h2 {
            margin-bottom: 10px;
        }

        .subscription-wrapper {
            position: relative;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-top: 10px;
        }

        .subscription-wrapper input {
            padding: 10px 15px 10px 15px; 
            width: 100%; 
            border: 1px solid #ccc;
            border-radius: 4px 0 0 4px; 
            box-sizing: border-box;
            height: 60px;
        }

        .subscription-wrapper button {
            position: absolute; 
            top: 50%; 
            right: 30px; 
            transform: translateY(-50%); 
            padding: 10px 5px; 
            border: none;
            background-color: #00a550;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            height: 70%; 
        }

        .subscription-wrapper button:hover {
            background-color: white;
            color: #00a550;
        }



            
            .links {
                justify-content: space-between; 
                flex-wrap: wrap; 
                padding: 0 70px; 
                font-size: 18px;
            }

            .aboutApex{
                margin-top: 20px;
            }

            .column {
                flex: 1 0 45%;
                margin: 10px; 
                max-width: 45%;
            }

            

            #tutorLog ,#popSub{
                margin-left: 60px;
            }

            .footer-column {
                display: inline-block;
                margin: 0 10px;
            }

        }

        /*large desktop*/
   
        @media screen and (min-width:1025px){
            footer {
                background-color: #001549; 
                color: white; 
                position: relative; 
                z-index: 0; 
                margin-top: -120px; 
                margin-bottom: 0;
            }


        .footer-row {
            margin: 40px 0 10px;
            border-bottom: 2px solid white;
            padding: 0 130px 0;
        }


        .footer-heading {
            text-align: left;
            margin: 0 0 15px; 
            font-size: 1.5em;
        }

        .links {
            display: flex; 
        }

        .column {
            flex: 1 0 20%; 
            margin: 5px; 
            text-align: left; 
        }

        .link {
            color: white; 
            background-color: #001549; 
            padding: 10px 15px;
            margin: 5px 0; 
            text-decoration: none;
            border-radius: 5px; 
            display: flex; 
            align-items: center; 
        }

        .link i {
            margin-right: 5px; 
        }

        .link:hover {
            color: #00a550; 
        }

        .myEmail a{
            color: white;
        }

       .icons{
        font-size: 15px;
        
       }

       .icons a {
            color: white;
            margin-right: 15px; 
            padding: 5px 10px;
        }

        .icons a:last-child {
            margin-right: 0;
        }

        .icons a:hover {
            background-color: #00a550; 
        }

        .logo-style {
            margin-right: 20px;
            margin-left: 5px; 
            max-width: 100%;
            height: auto;
            margin-bottom: 30px;
        }

        .aboutApex {
            margin-top: 25px;
            line-height: 1.5; 
            margin: 0; 
            padding: 0; 
            text-align: left; 
            width: 100%;
            box-sizing: border-box; 
        }
        
        footer .footer-row:first-of-type {
            padding-top: 20px;  
        }

        .subscription-container {
            text-align: left;
            padding: 40px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #00a550;
            margin: -80px 80px 20px 130px;
            width: 80%;
            color: white;
            position: relative;
            z-index: 1;
            clear: both;
        }


        .subscription-container h2 {
            margin-bottom: 10px;
        }

        .subscription-wrapper {
            position: relative;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-top: 10px;
        }

        .subscription-wrapper input {
            padding: 10px 15px 10px 15px; 
            width: 100%; 
            max-width: 3200px; 
            border: 1px solid #ccc;
            border-radius: 4px 0 0 4px; 
            box-sizing: border-box;
            height: 60px;
        }

        .subscription-wrapper button {
            position: absolute; 
            top: 50%; 
            right: 30px; 
            transform: translateY(-50%); 
            padding: 10px 5px; 
            border: none;
            background-color: #00a550;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            height: 70%; 
        }


        .subscription-wrapper input::placeholder {
                font-size: 18px;
            }
            
        .subscription-wrapper button:hover {
            background-color: white;
            color: #00a550;
        }


        .footer-row.last-content-row {
            border-bottom: none; 
            margin-bottom: 10px; 
        }

        .footer-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 5px 0;
            background-color: #000; 
            color: #fff;
            font-size: 14px;
            margin-top: 10px; 
            margin-bottom: 0; 
            width: 100%; 
        }
        
        /* Footer column styling (for layout inside footer-bottom) */
        .footer-bottom .footer-column {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Footer link styling */
        .footer-bottom .footer-column a {
            color: #fff; 
            text-decoration: none;
            font-size: 14px;
            margin-left: 10px;
        }

        /* Footer link hover effect */
        .footer-bottom .footer-column a:hover {
            color: #00a550;
        }


    }


     /*#footer-footer
       {
        display: none;
       } 

        /*End  footer*/

    </style>
 
</head>
<body>
 
    <nav class="navbar">
        <img src="apex.png" alt="Logo" class="logo" id="logo_image">
        <button class="navbar-toggle" id="navbar-toggle">
            <i class="fas fa-bars"></i> <!-- Hamburger icon -->
        </button>
        <ul class="nav-links">
            <li><a href="https://www.apexacademiccentre.co.za/">Home</a></li>
            <li><a href="https://bookatutorapexacademiccentre.co.za/">Tutors</a></li>
            <li class="dropdown">
                <a href="#" class="dropbtn">Tutoring <i class="fas fa-chevron-down"></i></a>
                <div class="dropdown-content">
                    <a href="https://www.apexacademiccentre.co.za/online-tutoring/">Online Tutoring</a>
                    <a href="https://www.apexacademiccentre.co.za/in-person-tutoring/">In Person Tutoring</a>
                    <a href="https://www.apexacademiccentre.co.za/matric-rewrite-2025/">Matric Re-Write</a>
                    <a href="https://www.apexacademiccentre.co.za/special-needs-tutoring/">Special Need Tutoring</a>
                    <a href="https://www.apexacademiccentre.co.za/cambridge-tutoring/">Cambridge Tutoring</a>
                    <a href="https://www.apexacademiccentre.co.za/university-college-tutors/">University/ College
                        Tutors</a>
                    <a href="https://www.apexacademiccentre.co.za/pearson-edexcel-tutoring/">Person Edexcel Tutoring</a>
                </div>
            </li>

            <li><a href="https://www.apexacademiccentre.co.za/homeschooling-support/">Homeschooling</a></li>
            <li><a href="https://www.apexacademiccentre.co.za/resources/">Resources</a></li>
            <li><a href="https://www.apexacademiccentre.co.za/contact-us/">Contact</a></li>


            <li>
                <button class="login-register" id="tutorBtn" onclick="openOpenopen()">
                   BOOK TUTOR
                </button>
            </li>
        </ul>
    </nav>


    <div class="whatsapp-wrapper">
        <a href="https://wa.me/27680351845?text=Hi%20*Apex%20Academic%20Centre*!%20I%20need%20more%20info%20about%20Apex%20Academic%20Centre%20https://www.apexacademiccentre.co.za" target="_blank" class="whatsapp-icon">
          <i class="fab fa-whatsapp" style="font-size: 40px; color: #fff; "></i> 
         </a>
  </div>



  <%
 
        Tutor tutor = (Tutor) request.getAttribute("tutor");

            byte[] image = tutor.getImage();
            String tutorImage = java.util.Base64.getEncoder().encodeToString(image);
            String name = tutor.getFullNames();
            Date currentDate = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
            String formattedDate = formatter.format(currentDate);
            int currentYear = Integer.parseInt(formattedDate); 

            Date dob = tutor.getDob();
            formattedDate = formatter.format(dob);
            int birthYear = Integer.parseInt(formattedDate);

            // Calculate age
            int age = currentYear - birthYear;
            
            // Optional: Adjust if the birthday hasn't occurred yet this year
            Calendar today = Calendar.getInstance();
            Calendar birthDate = Calendar.getInstance();
            birthDate.setTime(dob);
            
            if (today.get(Calendar.MONTH) < birthDate.get(Calendar.MONTH) || 
                (today.get(Calendar.MONTH) == birthDate.get(Calendar.MONTH) && today.get(Calendar.DAY_OF_MONTH) < birthDate.get(Calendar.DAY_OF_MONTH))) {
                age--; // Decrease age if birthday hasn't occurred yet this year
            }

            String area = tutor.getArea();
            String country = tutor.getCountry();
            String province = tutor.getAddress();
            String curriculum = tutor.getSyllabus();
            String tutoring = tutor.getAvailability();
            String subjects = tutor.getSubjects();
            String qualifications = tutor.getBio();
            int ratings = tutor.getRatings();
            String email = tutor.getEmail().trim().replaceAll("\\s+", "");
            String descTutor =  tutor.getAbout();
            String surname = tutor.getSurname();
            String modules = tutor.getModule();
            String fullName = name;
            String grades = tutor.getGrades();
            int exp = tutor.getExperience();

            
  %>


    <div class="whole-wrapper">
        <div class="main-section">

            <div class="the-left">
                <!-- Tutor's Picture and Info Div -->
                <div class="upper-line">
                    <div class="profile-picture-container">
                        <img src="data:image/png;base64,<%= tutorImage %>" alt="Tutor's Picture">
                        <div class="name"><%= name %></div>
                        <div class="age"><%= age %> years old</div>
                        <div class="age"><%= exp %> year(s) experience</div>
                    </div>
                    <div class="details">
                        <p>
                            <span class="static-text">Country :</span> <span class="detail-info"><%= country %></span><br>
                            <span class="static-text">Province :</span> <span class="detail-info"><%= province %></span><br>
                            <span class="static-text">Area :</span> <span class="detail-info"><%= area %></span><br>
                            <span class="static-text">Curriculum :</span> <span class="detail-info"><%= curriculum %></span><br>
                            <span class="static-text">Tutoring Option :</span> <span class="detail-info"><%= tutoring %></span>
                        </p>
                        <div class="ratings">
                            <i class="fas fa-star" id="rate-icon"></i>
                            <span id="rate"> <%= ratings %> Ratings</span>
                        </div>
                        <div class="feedback-item">
                            <i class="fas fa-check-circle" id="back-icon"></i>
                            <span class="back">Background Checked</span>
                        </div>
                    </div>
                </div>
    
                <!--Book Tutor Button-->
                <div class="profile-action">
                    <button id="book-tutor-button" class="book-tutor-button" onclick="goBack()">Back</button>
                </div>


                <div class="matric">
                    <img src="apex_child.jpeg" alt="Matric">

                </div>
            </div>

            <div class="right-side">

                <div class="profile-container">

                    <div class="about-tutor-row">
                        <div class="about-tutor-title"><i class="far fa-user"></i>&nbsp;&nbsp;Bio</div>
                        <div class="about-tutor-info">
                            <p id="profile_about">
                                <%= descTutor %>
                            </p>
                            <br>
                        </div>
                    </div>
                    <div class="qualifications-row">
                        <div class="qualifications-title"><i class="fas fa-university"></i>&nbsp;&nbsp;Education</div>

                        <div class="subjects-info" >
                            <ul>
                                <%
                                    String[] c = qualifications.split(",");
                                    for (String s : c) {
                                %>
                                    <li>•&nbsp;<%= s.trim() %></li>
                                <% } %>
                            </ul>
                            <br><br>
                        </div>
                        <br><br>

                    </div>
                    <div class="subjects-row">
                        <div class="subjects-title">
                            <div class="school_head">
                                <i class="fa fa-book"></i>&nbsp;&nbsp;Subjects
                            </div>
                            <div class="bongi">
                                School tutoring<br>
                                <span class="grades">GRD:1 - GRD:12</span>
                            </div>
                        </div>
                      
                            <div class="subjects-info">
                                <%
                               
                                    String[] sub = subjects.split(",");
                                    for (String subject : sub) {
                                %>
                                    <p><%= subject %></p>
                                <% } %>
                                <br><br>
                            </div>
 
                    </div>
                   
                    <%
                    if (modules != null && !modules.isEmpty()) { // Check for null and empty
                    %>
                        <!-- <div class="University-row">
                            <div class="subjects-title">
                                <div class="header1">
                                    <i class="fa fa-book"></i>&nbsp;&nbsp;Subjects
                                </div>
                                <div class="tutoring-container1">
                                    University tutoring<br>
                                    <span class="modules">1st yr - 4th yr</span>
                                </div>
                            </div>
                            <div class="subjects-info">
                                <%
                                String[] mod = modules.split(",");
                                for (String modu : mod) {
                                %>
                                    <p><%= modu.trim() %></p> 
                                <% } %>
                                <br><br>
                            </div>
                        </div>   -->
                    <%
                    } else {
                    %>
                       
                    <%
                    }
                    %>

                </div>
				
				
				<div class="short-paragraph">
				    Your Personal Tutor in the Comfort of Your Own Home
				    <br>
				    <!--Book Tutor Button and find tutor-->
				    <div class="button-action">
				        <button id="book-tutor-button" class="book-tutor-button" onclick="openOpenopen('<%= fullName %>' , '<%= email %>', '<%= curriculum %>', '<%= grades %> ', '<%= subjects %>')">Book <%= name %></button>
				        <button id="find-tutor-button" class="find-tutor-button" onclick="window.location.href='https://bookatutorapexacademiccentre.co.za/bookingTutor';">Find Me A Tutor</button>
				    </div>
				</div>
				

                <div class="long-paragraph">
                    See the feedback and accolades from individuals who have experienced my work firsthand.
                </div>

                <section class="container">

                    <div class="card__container swiper">
                        <div class="card__content">
                            <div class="reviews1">
                                <i class="fas fa-star" id="rate-icon"></i>
                                <span id="rev">Reviews</span>
                            </div>
                           
                            <div class="swiper-wrapper">
                                <%
                                    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
                                    boolean hasReviews = false; // Flag to check if there are any approved reviews
                            
                                    if (reviews != null) {
                                        for (Review r : reviews) {
                                            String emailTutor = r.getTutorEmail().trim().replaceAll("\\s+", "");
                                            if (emailTutor.equals(email) && r.getStatus().equals("approved")) {
                                                hasReviews = true; // Set flag if there's at least one approved review
                                                String tutName = r.getName();
                                                String reviewDescription = r.getMessage();
                                %>
                                                <article class="card__article swiper-slide">
                                                    <div class="card__data">
                                                        <h3 class="card__name"><%= tutName %></h3>
                                                        <p class="card__description">
                                                            <%= reviewDescription != null ? reviewDescription : "No description available." %>
                                                        </p>
                                                    </div>
                                                </article>
                                <%
                                            }
                                        }
                                    }
                            
                                    // Display a message if no approved reviews were found
                                    if (!hasReviews) {
                                %>
                                        <p>No reviews available.</p>
                                <%
                                    }
                                %>
                            </div>
                            
                    
                            <!-- Navigation buttons -->
                            <div class="swiper-button-next">
                                <i class="ri-arrow-right-s-line"></i>
                            </div>
                    
                            <div class="swiper-button-prev">
                                <i class="ri-arrow-left-s-line"></i>
                            </div>
                    
                            <!-- Pagination -->
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    
                    
                </section>



            </div>

        </div>

    </div>
    

    <div class="arrow-container">
        <button class="arrow" id="scrollLeft">&#10094;</button>
        
        <div class="scroll-container" id="scrollContainer">
            <%
            List<Tutor> tutors = (List<Tutor>) request.getAttribute("tutors");
            String excludedName = (String) request.getAttribute("name"); // Assuming 'name' is set in request scope
            if (tutors != null && !tutors.isEmpty()) {
                for (Tutor t : tutors) {
                    byte[] imgs = t.getImage();
                    String tutorImg = java.util.Base64.getEncoder().encodeToString(imgs);
                    String tName = t.getFullNames();
                    String profEmail = t.getEmail();
        
                    // Check if the tutor's name does not match the excluded name
                    if (excludedName == null || !tName.equals(excludedName)) {
            %>
                    <div class="scroll-item">
                        <form action="/view-profile" method="get" id="profileForm<%= t.getEntryId() %>">
                            <input type="hidden" id="encryptedEmail<%= t.getEntryId() %>" name="email" value=""/>
                            <img src="data:image/png;base64,<%= tutorImg %>" 
                                 alt="Member Image" 
                                 id="isthombe" 
                                 style="cursor: pointer;" 
                                 onclick="encryptEmail(event, '<%= profEmail %>', 'encryptedEmail<%= t.getEntryId() %>'); document.getElementById('profileForm<%= t.getEntryId() %>').submit();"/>
                        </form>
                        <p><%= tName %></p>
                        <p class="reviews" style="margin-top: 10px;">
                            <i class="fas fa-star review-icon"></i>
                            <i class="fas fa-star review-icon"></i>
                            <i class="fas fa-star review-icon"></i>
                            <i class="fas fa-star review-icon"></i>
                            <i class="fas fa-star review-icon"></i>
                        </p>
                    </div>
            <%
                    }
                }
            } else {
            %>
                <div class="no-tutors">
                    <p>No tutors found.</p>
                </div>
            <%
            }
            %>
        </div>
        
        <button class="arrow" id="scrollRight">&#10095;</button>
    </div>



     <!--BOOKING FORM--> 
	
        <div class="wrapper" id="modal">

                    <div class="modal-content" id="yesyes">

                    <span class="close-btn" id="close-popup">&times;</span>
                    <!--START OF FORMS-->
                    <div class="form_wrap">
                        <div class="form_1 data_info">
                            <h2><span class="directTutor"></span></h2>
                            <br>
                            <form id="contact-form">
                                <div class="form_container">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="first-name">First Name <span class="required">*</span></label>
                                            <input type="text" id="first-name" name="first-name" class="input" placeholder="Sihle" required>
                                            <div id="first-name-error" class="error"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="last-name">Last Name <span class="required">*</span></label>
                                            <input type="text" id="last-name" name="last-name" class="input" placeholder="Sithole" required>
                                            <div id="last-name-error" class="error"></div>
                                        </div>
                                    </div>
                            
                                    
                            
                                    <div class="form-row">
                            
                                        <div class="form-group">
                                            <label for="country">Country <span class="required">*</span></label>
                                            <select id="country" name="country" class="input" required onchange="updateCountryCode()">
                                                <option value="" disabled selected>Select your country</option>
                                                <option value="South Africa" data-code="+27" data-length="10">South Africa</option>
                                                <option value="Afghanistan" data-code="+93" data-length="9">Afghanistan</option>
                                                <option value="Albania" data-code="+355" data-length="8">Albania</option>
                                                <option value="Algeria" data-code="+213" data-length="9">Algeria</option>
                                                <option value="Andorra" data-code="+376" data-length="6">Andorra</option>
                                                <option value="Angola" data-code="+244" data-length="9">Angola</option>
                                                <option value="Antigua and Barbuda" data-code="+1-268" data-length="7">Antigua and Barbuda</option>
                                                <option value="Argentina" data-code="+54" data-length="10">Argentina</option>
                                                <option value="Armenia" data-code="+374" data-length="8">Armenia</option>
                                                <option value="Australia" data-code="+61" data-length="9">Australia</option>
                                                <option value="Austria" data-code="+43" data-length="10">Austria</option>
                                                <option value="Azerbaijan" data-code="+994" data-length="9">Azerbaijan</option>
                                                <option value="Bahamas" data-code="+1-242" data-length="7">Bahamas</option>
                                                <option value="Bahrain" data-code="+973" data-length="8">Bahrain</option>
                                                <option value="Bangladesh" data-code="+880" data-length="10">Bangladesh</option>
                                                <option value="Barbados" data-code="+1-246" data-length="7">Barbados</option>
                                                <option value="Belarus" data-code="+375" data-length="9">Belarus</option>
                                                <option value="Belgium" data-code="+32" data-length="8">Belgium</option>
                                                <option value="Belize" data-code="+501" data-length="7">Belize</option>
                                                <option value="Benin" data-code="+229" data-length="8">Benin</option>
                                                <option value="Bhutan" data-code="+975" data-length="8">Bhutan</option>
                                                <option value="Bolivia" data-code="+591" data-length="8">Bolivia</option>
                                                <option value="Bosnia and Herzegovina" data-code="+387" data-length="8">Bosnia and Herzegovina</option>
                                                <option value="Botswana" data-code="+267" data-length="7">Botswana</option>
                                                <option value="Brazil" data-code="+55" data-length="11">Brazil</option>
                                                <option value="Brunei" data-code="+673" data-length="7">Brunei</option>
                                                <option value="Bulgaria" data-code="+359" data-length="8">Bulgaria</option>
                                                <option value="Burkina Faso" data-code="+226" data-length="8">Burkina Faso</option>
                                                <option value="Burundi" data-code="+257" data-length="8">Burundi</option>
                                                <option value="Cabo Verde" data-code="+238" data-length="7">Cabo Verde</option>
                                                <option value="Cambodia" data-code="+855" data-length="8">Cambodia</option>
                                                <option value="Cameroon" data-code="+237" data-length="9">Cameroon</option>
                                                <option value="Canada" data-code="+1" data-length="10">Canada</option>
                                                <option value="Central African Republic" data-code="+236" data-length="8">Central African Republic</option>
                                                <option value="Chad" data-code="+235" data-length="8">Chad</option>
                                                <option value="Chile" data-code="+56" data-length="9">Chile</option>
                                                <option value="China" data-code="+86" data-length="11">China</option>
                                                <option value="Colombia" data-code="+57" data-length="10">Colombia</option>
                                                <option value="Comoros" data-code="+269" data-length="7">Comoros</option>
                                                <option value="Congo (Congo-Brazzaville)" data-code="+242" data-length="8">Congo (Congo-Brazzaville)</option>
                                                <option value="Costa Rica" data-code="+506" data-length="8">Costa Rica</option>
                                                <option value="Croatia" data-code="+385" data-length="9">Croatia</option>
                                                <option value="Cuba" data-code="+53" data-length="8">Cuba</option>
                                                <option value="Cyprus" data-code="+357" data-length="8">Cyprus</option>
                                                <option value="Czechia (Czech Republic)" data-code="+420" data-length="9">Czechia (Czech Republic)</option>
                                                <option value="Democratic Republic of the Congo" data-code="+243" data-length="9">Democratic Republic of the Congo</option>
                                                <option value="Denmark" data-code="+45" data-length="8">Denmark</option>
                                                <option value="Djibouti" data-code="+253" data-length="6">Djibouti</option>
                                                <option value="Dominica" data-code="+1-767" data-length="7">Dominica</option>
                                                <option value="Dominican Republic" data-code="+1-809" data-length="10">Dominican Republic</option>
                                                <option value="Ecuador" data-code="+593" data-length="9">Ecuador</option>
                                                <option value="Egypt" data-code="+20" data-length="10">Egypt</option>
                                                <option value="El Salvador" data-code="+503" data-length="8">El Salvador</option>
                                                <option value="Equatorial Guinea" data-code="+240" data-length="9">Equatorial Guinea</option>
                                                <option value="Eritrea" data-code="+291" data-length="7">Eritrea</option>
                                                <option value="Estonia" data-code="+372" data-length="7">Estonia</option>
                                                <option value="Eswatini" data-code="+268" data-length="7">Eswatini</option>
                                                <option value="Ethiopia" data-code="+251" data-length="10">Ethiopia</option>
                                                <option value="Fiji" data-code="+679" data-length="7">Fiji</option>
                                                <option value="Finland" data-code="+358" data-length="10">Finland</option>
                                                <option value="France" data-code="+33" data-length="9">France</option>
                                                <option value="Gabon" data-code="+241" data-length="7">Gabon</option>
                                                <option value="Gambia" data-code="+220" data-length="7">Gambia</option>
                                                <option value="Georgia" data-code="+995" data-length="9">Georgia</option>
                                                <option value="Germany" data-code="+49" data-length="11">Germany</option>
                                                <option value="Ghana" data-code="+233" data-length="10">Ghana</option>
                                                <option value="Greece" data-code="+30" data-length="10">Greece</option>
                                                <option value="Grenada" data-code="+1-473" data-length="7">Grenada</option>
                                                <option value="Guatemala" data-code="+502" data-length="8">Guatemala</option>
                                                <option value="Guinea" data-code="+224" data-length="9">Guinea</option>
                                                <option value="Guinea-Bissau" data-code="+245" data-length="7">Guinea-Bissau</option>
                                                <option value="Guyana" data-code="+592" data-length="7">Guyana</option>
                                                <option value="Haiti" data-code="+509" data-length="8">Haiti</option>
                                                <option value="Honduras" data-code="+504" data-length="8">Honduras</option>
                                                <option value="Hungary" data-code="+36" data-length="9">Hungary</option>
                                                <option value="Iceland" data-code="+354" data-length="7">Iceland</option>
                                                <option value="India" data-code="+91" data-length="10">India</option>
                                                <option value="Indonesia" data-code="+62" data-length="10">Indonesia</option>
                                                <option value="Iran" data-code="+98" data-length="10">Iran</option>
                                                <option value="Iraq" data-code="+964" data-length="10">Iraq</option>
                                                <option value="Ireland" data-code="+353" data-length="9">Ireland</option>
                                                <option value="Israel" data-code="+972" data-length="9">Israel</option>
                                                <option value="Italy" data-code="+39" data-length="10">Italy</option>
                                                <option value="Jamaica" data-code="+1-876" data-length="7">Jamaica</option>
                                                <option value="Japan" data-code="+81" data-length="10">Japan</option>
                                                <option value="Jordan" data-code="+962" data-length="9">Jordan</option>
                                                <option value="Kazakhstan" data-code="+7" data-length="10">Kazakhstan</option>
                                                <option value="Kenya" data-code="+254" data-length="10">Kenya</option>
                                                <option value="Kiribati" data-code="+686" data-length="7">Kiribati</option>
                                                <option value="Kuwait" data-code="+965" data-length="8">Kuwait</option>
                                                <option value="Kyrgyzstan" data-code="+996" data-length="9">Kyrgyzstan</option>
                                                <option value="Laos" data-code="+856" data-length="8">Laos</option>
                                                <option value="Latvia" data-code="+371" data-length="8">Latvia</option>
                                                <option value="Lebanon" data-code="+961" data-length="8">Lebanon</option>
                                                <option value="Lesotho" data-code="+266" data-length="8">Lesotho</option>
                                                <option value="Liberia" data-code="+231" data-length="7">Liberia</option>
                                                <option value="Libya" data-code="+218" data-length="9">Libya</option>
                                                <option value="Liechtenstein" data-code="+423" data-length="8">Liechtenstein</option>
                                                <option value="Lithuania" data-code="+370" data-length="8">Lithuania</option>
                                                <option value="Luxembourg" data-code="+352" data-length="6">Luxembourg</option>
                                                <option value="Madagascar" data-code="+261" data-length="9">Madagascar</option>
                                                <option value="Malawi" data-code="+265" data-length="9">Malawi</option>
                                                <option value="Malaysia" data-code="+60" data-length="10">Malaysia</option>
                                                <option value="Maldives" data-code="+960" data-length="7">Maldives</option>
                                                <option value="Mali" data-code="+223" data-length="8">Mali</option>
                                                <option value="Malta" data-code="+356" data-length="8">Malta</option>
                                                <option value="Marshall Islands" data-code="+692" data-length="7">Marshall Islands</option>
                                                <option value="Mauritania" data-code="+222" data-length="8">Mauritania</option>
                                                <option value="Mauritius" data-code="+230" data-length="8">Mauritius</option>
                                                <option value="Mexico" data-code="+52" data-length="10">Mexico</option>
                                                <option value="Micronesia" data-code="+691" data-length="7">Micronesia</option>
                                                <option value="Moldova" data-code="+373" data-length="8">Moldova</option>
                                                <option value="Monaco" data-code="+377" data-length="7">Monaco</option>
                                                <option value="Mongolia" data-code="+976" data-length="8">Mongolia</option>
                                                <option value="Montenegro" data-code="+382" data-length="8">Montenegro</option>
                                                <option value="Morocco" data-code="+212" data-length="10">Morocco</option>
                                                <option value="Mozambique" data-code="+258" data-length="9">Mozambique</option>
                                                <option value="Myanmar (Burma)" data-code="+95" data-length="9">Myanmar (Burma)</option>
                                                <option value="Namibia" data-code="+264" data-length="9">Namibia</option>
                                                <option value="Nauru" data-code="+674" data-length="7">Nauru</option>
                                                <option value="Nepal" data-code="+977" data-length="10">Nepal</option>
                                                <option value="Netherlands" data-code="+31" data-length="9">Netherlands</option>
                                                <option value="New Zealand" data-code="+64" data-length="9">New Zealand</option>
                                                <option value="Nicaragua" data-code="+505" data-length="8">Nicaragua</option>
                                                <option value="Niger" data-code="+227" data-length="8">Niger</option>
                                                <option value="Nigeria" data-code="+234" data-length="10">Nigeria</option>
                                                <option value="North Macedonia" data-code="+389" data-length="8">North Macedonia</option>
                                                <option value="Norway" data-code="+47" data-length="8">Norway</option>
                                                <option value="Oman" data-code="+968" data-length="8">Oman</option>
                                                <option value="Pakistan" data-code="+92" data-length="10">Pakistan</option>
                                                <option value="Palau" data-code="+680" data-length="7">Palau</option>
                                                <option value="Palestine" data-code="+970" data-length="9">Palestine</option>
                                                <option value="Panama" data-code="+507" data-length="7">Panama</option>
                                                <option value="Papua New Guinea" data-code="+675" data-length="8">Papua New Guinea</option>
                                                <option value="Paraguay" data-code="+595" data-length="9">Paraguay</option>
                                                <option value="Peru" data-code="+51" data-length="9">Peru</option>
                                                <option value="Philippines" data-code="+63" data-length="10">Philippines</option>
                                                <option value="Poland" data-code="+48" data-length="9">Poland</option>
                                                <option value="Portugal" data-code="+351" data-length="9">Portugal</option>
                                                <option value="Qatar" data-code="+974" data-length="8">Qatar</option>
                                                <option value="Romania" data-code="+40" data-length="10">Romania</option>
                                                <option value="Russia" data-code="+7" data-length="10">Russia</option>
                                                <option value="Rwanda" data-code="+250" data-length="9">Rwanda</option>
                                                <option value="Saint Kitts and Nevis" data-code="+1-869" data-length="7">Saint Kitts and Nevis</option>
                                                <option value="Saint Lucia" data-code="+1-758" data-length="7">Saint Lucia</option>
                                                <option value="Saint Vincent and the Grenadines" data-code="+1-784" data-length="7">Saint Vincent and the Grenadines</option>
                                                <option value="Samoa" data-code="+685" data-length="7">Samoa</option>
                                                <option value="San Marino" data-code="+378" data-length="7">San Marino</option>
                                                <option value="Sao Tome and Principe" data-code="+239" data-length="7">Sao Tome and Principe</option>
                                                <option value="Saudi Arabia" data-code="+966" data-length="9">Saudi Arabia</option>
                                                <option value="Senegal" data-code="+221" data-length="8">Senegal</option>
                                                <option value="Serbia" data-code="+381" data-length="9">Serbia</option>
                                                <option value="Seychelles" data-code="+248" data-length="7">Seychelles</option>
                                                <option value="Sierra Leone" data-code="+232" data-length="8">Sierra Leone</option>
                                                <option value="Singapore" data-code="+65" data-length="8">Singapore</option>
                                                <option value="Slovakia" data-code="+421" data-length="9">Slovakia</option>
                                                <option value="Slovenia" data-code="+386" data-length="8">Slovenia</option>
                                                <option value="Solomon Islands" data-code="+677" data-length="7">Solomon Islands</option>
                                                <option value="Somalia" data-code="+252" data-length="9">Somalia</option>
                                                <option value="South Korea" data-code="+82" data-length="10">South Korea</option>
                                                <option value="South Sudan" data-code="+211" data-length="9">South Sudan</option>
                                                <option value="Spain" data-code="+34" data-length="9">Spain</option>
                                                <option value="Sri Lanka" data-code="+94" data-length="10">Sri Lanka</option>
                                                <option value="Sudan" data-code="+249" data-length="9">Sudan</option>
                                                <option value="Suriname" data-code="+597" data-length="7">Suriname</option>
                                                <option value="Sweden" data-code="+46" data-length="10">Sweden</option>
                                                <option value="Switzerland" data-code="+41" data-length="9">Switzerland</option>
                                                <option value="Syria" data-code="+963" data-length="9">Syria</option>
                                                <option value="Taiwan" data-code="+886" data-length="10">Taiwan</option>
                                                <option value="Tajikistan" data-code="+992" data-length="9">Tajikistan</option>
                                                <option value="Tanzania" data-code="+255" data-length="10">Tanzania</option>
                                                <option value="Thailand" data-code="+66" data-length="9">Thailand</option>
                                                <option value="Timor-Leste" data-code="+670" data-length="7">Timor-Leste</option>
                                                <option value="Togo" data-code="+228" data-length="8">Togo</option>
                                                <option value="Tonga" data-code="+676" data-length="7">Tonga</option>
                                                <option value="Trinidad and Tobago" data-code="+1-868" data-length="7">Trinidad and Tobago</option>
                                                <option value="Tunisia" data-code="+216" data-length="8">Tunisia</option>
                                                <option value="Turkey" data-code="+90" data-length="10">Turkey</option>
                                                <option value="Turkmenistan" data-code="+993" data-length="8">Turkmenistan</option>
                                                <option value="Tuvalu" data-code="+688" data-length="7">Tuvalu</option>
                                                <option value="Uganda" data-code="+256" data-length="10">Uganda</option>
                                                <option value="Ukraine" data-code="+380" data-length="9">Ukraine</option>
                                                <option value="United Arab Emirates" data-code="+971" data-length="9">United Arab Emirates</option>
                                                <option value="United Kingdom" data-code="+44" data-length="10">United Kingdom</option>
                                                <option value="United States" data-code="+1" data-length="10">United States</option>
                                                <option value="Uruguay" data-code="+598" data-length="8">Uruguay</option>
                                                <option value="Uzbekistan" data-code="+998" data-length="9">Uzbekistan</option>
                                                <option value="Vanuatu" data-code="+678" data-length="7">Vanuatu</option>
                                                <option value="Vatican City" data-code="+39" data-length="7">Vatican City</option>
                                                <option value="Venezuela" data-code="+58" data-length="10">Venezuela</option>
                                                <option value="Vietnam" data-code="+84" data-length="10">Vietnam</option>
                                                <option value="Yemen" data-code="+967" data-length="9">Yemen</option>
                                                <option value="Zambia" data-code="+260" data-length="10">Zambia</option>
                                                <option value="Zimbabwe" data-code="+263" data-length="9">Zimbabwe</option>
                                            </select>
                                            <div id="country-error" class="error"></div>
                                        </div>
                            
                            
                            
                                        <div class="form-group" id="fProvince">
                                            <label for="province">Province <span class="required">*</span></label>
                                            <select id="province" name="province" class="input" required>
                                                <option value="" disabled selected>Select your province</option>
                                                <option value="limpopo">Limpopo</option>
                                                <option value="gauteng">Gauteng</option>
                                                <option value="free-state">Free State</option>
                                                <option value="north-west">North West</option>
                                                <option value="northern-cape">Northern Cape</option>
                                                <option value="eastern-cape">Eastern Cape</option>
                                                <option value="kwa-zulu-natal">Kwa Zulu Natal</option>
                                                <option value="mpumalanga">Mpumalanga</option>
                                                <option value="western-cape">Western Cape</option>
                                            </select>
                                            <div id="province-error" class="error"></div>
                                        </div>
                            
                                    </div>
                            
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="email">Email <span class="required">*</span></label>
                                            <input type="email" id="email" name="email" class="input" placeholder="example@domain.com" required>
                                            <div id="email-error" class="error"></div>
                                        </div>
                            
                                        <div class="form-group">
                                            <label for="phone">Phone <span class="required">*</span></label>
                                            <input 
                                                type="tel" 
                                                id="phone" 
                                                name="phone" 
                                                class="input" 
                                                placeholder="+27797565412" 
                                                required 
                                                onfocus="updateCountryCode();" 
                                                oninput="validatePhoneNumber();"
                                            >
                                            <div id="phone-error" class="error"></div>
                                        </div>
                                    </div>
                            
                                    <div class="form-row">
                            
                                        <div class="form-group">
                                            <label for="language">Language<span class="required">*</span></label>
                                            <select id="language" name="language" class="input" required>
                                                <option value="" disabled selected>Select Language of Instruction</option>
                                                <option value="English">English</option>
                                            </select>
                                            <div id="language-error" class="error"></div>
                                        </div>
                            
                                    </div>
                            
                            
                                </div>
                                <div class="btns_wrap">
                                    <div class="common_btns form_1_btns">
                                        <button type="button" class="btn_next">Next</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    
                                    <input type="hidden" id="hiddenTutorName" name="hiddenTutorName">
                                    <input type="hidden" id="hiddenTutorEmail" name="hiddenTutorEmail">
                            
                                </div>
                            </form>
                        </div>
                        <div class="form_2" style="display: none;">
                           <h2><span class="directTutor"></span></h2>
                            <br>
                            <div id="form-container-2" class="form-container hidden">
                                <form id="additional-form">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="tutoring-for">Who is the tutoring for? <span class="required">*</span></label>
                                            <select id="tutoring-for" name="tutoring-for" required onchange="toggleReadOnly()">
                                                <option value="" disabled selected>Select one</option>
                                                <option value="my-son">My son</option>
                                                <option value="my-daughter">My daughter</option>
                                                <option value="me">Me</option>
                                                <option value="someone-else">Someone else</option>
                                            </select>
                                            <div id="tutoring-for-error" class="error"></div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label>What do you need help with? <span class="required">*</span></label>
                                            <div class="radio-group">
                                                <label>
                                                    <input type="radio" id="help-with" name="help-with" value="school" onclick="studentInfo()" required>
                                                    School
                                                </label>
                                                <label>
                                                    <input type="radio" id="help-with" name="help-with" value="university" onclick="vasityInfo()" required>
                                                    University
                                                </label>
                                                <div id="help-with-error" class="error"></div>
                                            </div>
                                        </div>
                                    </div>
                                
                                    <div id="student-info" class="hidden">
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label for="student-name">Student Name <span class="required">*</span></label><br>
                                                <input type="text" id="student-name" name="student-name" placeholder="Student name" class="input" required>
                                                <div id="student-name-error" class="error"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="student-last-name">Last name <span class="required">*</span></label><br>
                                                <input type="text" id="student-last-name" name="student-last-name" placeholder="Last name" class="input" required>
                                                <div id="student-last-name-error" class="error"></div>
                                            </div>
                                        </div>
                                    
                                        <div class="form-row">

                                            <div class="form-group">

                                                    <div id="southGrade">
                                                    
                                                        <label for="grade">Grade <span class="required">*</span></label><br>
                                                        <select id="grade" name="grade" required>
                                                            <option value="" disabled selected>Select grade</option>
                                                        </select>
                                                        <div id="grade-error" class="error"></div>
                                                    
                                                    </div>

                                                    <div id="interGrade">
                                                        
                                                        <label for="grade">Grade/Form<span class="required">*</span></label><br> 
                                                        <input type="text" id="inter-grade" name="inter-grade" class="input" required>
                                                        <div id="inter-grade-error" class="error"></div>
                                                        
                                                    </div>

                                            </div>


                                            <div class="form-group">
                                                <label for="syllabus">Syllabus <span class="required">*</span></label>
                                                <select id="syllabus" name="syllabus" required>
                                                    <option value="Other" id="other-option">Other</option>
                                                </select>
                                                <div id="syllabus-error" class="error"></div>
                                            </div>
                                        </div>
                                    </div>
                                
                                    <div id="year-selection-container" class="hidden">
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label for="stud-name">Student Name <span class="required">*</span></label><br>
                                                <input type="text" id="stud-name" name="stud-name" placeholder="Student name" class="input" required>
                                                <div id="stud-name-error" class="error"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="stud-last">Last name <span class="required">*</span></label><br>
                                                <input type="text" id="stud-last" name="stud-last" placeholder="Last name" class="input" required>
                                                <div id="stud-last-error" class="error"></div>
                                            </div>
                                        </div>
                                
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label>Select year <span class="required">*</span></label>
                                                <div class="radio-group">   
                                                    <label>
                                                        <input type="radio" id="year" name="year" value="1st" required onchange="checkPostgrad()">
                                                        1st
                                                    </label>
                                                    <label>
                                                        <input type="radio" id="year" name="year" value="2nd" required onchange="checkPostgrad()">
                                                        2nd
                                                    </label>
                                                    <label>
                                                        <input type="radio" id="year" name="year" value="3rd" required onchange="checkPostgrad()">
                                                        3rd
                                                    </label>
                                                    <label>
                                                        <input type="radio" id="year" name="year" value="4th" required onchange="checkPostgrad()">
                                                        4th
                                                    </label>
                                                    <label>
                                                        <input type="radio" id="year-postgrad" name="year" value="postgrad" required onchange="checkPostgrad()">
                                                        Postgrad
                                                    </label>
                                                    <div id="year-error" class="error"></div>
                                                </div>
                                                <div id="postgrad-options" class="opt">
                                                    <label>
                                                        <input type="radio" name="postgrad-type" value="Honors" required>
                                                        Honors
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="postgrad-type" value="Masters" required>
                                                        Masters
                                                    </label>
                                                    <div id="postType-error" class="error"></div> 
                                                </div>

                                            </div>
                                        </div>
                                    </div> 
                                
                                    <div class="btns_wrap">
                                        <div class="common_btns form_2_btns">
                                            <button type="button" class="btn_back">Back</button>
                                            <button type="button" class="btn_next">Next</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
    
                        <div class="form_3" style="display: none;" id="formThree">
                            <h2><span class="directTutor"></span></h2>
                            <br>
                        
                            <form id="submit-form">
                               
                                <div id="schoolSubject">
                                    <div class="form-row">
                                      <div class="form-group">
                                          <label for="subject">Subjects<span class="required">*</span></label><br>
                                          <input type="text" id="subject" name="subject" class="input" placeholder="Mathematics,Mathematics Literacy...." required readonly onclick="toggleSubjectOptions()">
                                          <div id="subjectContainer" style="display: none;"></div>
                                          <div id="subject-error" class="error"></div>
                                      </div>
                                    </div>
                                  </div>
  
                                  <div id="universitySubject">
  
                                      <div class="form-row">
                                          <div class="form-group">
                                              <label for="stud-name">Qualification<span class="required">*</span></label><br>
                                              <input type="text" id="qualification-id" name="qualification-id" placeholder="computer science" class="input" required>
                                              <div id="qualification-error" class="error"></div>
                                          </div>
                                          <div class="form-group">
                                              <label for="stud-last">Module<span class="required">*</span></label><br>
                                              <input type="text" id="module-id" name="module-id" placeholder="internet programming" class="input" required>
                                              <div id="module-error" class="error"></div>
                                          </div>
                                      </div>
  
                                      <div class="form-group">
                                          <label for="stud-last">Specific Area of support<span class="required">*</span></label><br>
                                          <input type="text" id="specification-id" name="specification-id" placeholder="database connectivity" class="input" required>
                                          <div id="specification-error" class="error"></div>
                                      </div>
  
  
                                  </div>

                                <div class="form-group">
                                    <label for="tutor-style">Tutoring Option<span class="required">*</span></label>
                                    <select id="tutor-style" name="tutor-style" required onchange="handleTutorStyleChange()">
                                        <option value="" disabled selected>Select an option</option>
                                        <option value="Online">Online</option>
                                        <option value="In Person" id="in-peerson">In-Person</option>
                                    </select>
                                    <div id="tutor-style-error" class="error"></div>
                                </div>

                                <div class="form-row" id="in-person-teaching">

                                    <div class="form-group">
                                        <label for="suburb-inperson">Suburb<span class="required">*</span></label><br>
                                        <input type="text" id="suburb-inperson" name="suburb-inperson" placeholder="Which suburb do you stay" class="input" required>
                                        <div id="suburb-inperson-error" class="error"></div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="address">When would you like to start<span class="required">*</span></label><br>
                                    <select id="address-inperson" name="address-inperson" class="input" required>
                                        <option value="" disabled selected>Select an option</option>
                                        <option value="ASAP">ASAP</option>
                                        <option value="This Week">This Week</option>
                                        <option value="This Month">This Month</option>
                                        <option value="Not right now">Not right now</option>
                                    </select>
                                    <div id="inperson-error" class="error"></div>
                                </div>

                                <div class="row" id="internetCheck">
                         
                                    <div class="checkbox-container">
                                        <br>
                                        <input type="checkbox" id="internet-check" name="internet-check" />
                                        <label for="internet-check">
                                            You have fast, stable internet (2Mbps or higher). You must have a computer, laptop, tablet, or phone with a Webcam, microphone and speakers.
                                        </label>
                                        <div id="internet-error" class="error"></div>
                                    </div>
                                </div>


                            <div class="btns_wrap">
                                <div class="common_btns form_3_btns">
                                    <button type="button" class="btn_back">Back</button>
                                    <button type="button" class="btn_next">Next</button>
                                </div>
                            </div>
                        </form>
                        </div>
                 

                        <div class="form_4" style="display: none;" >
                            <h2><span class="directTutor"></span></h2>
                            <div id="Message" class="hidden">
                                <form id="formFour">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="message">Message <span class="required"></span></label><br><br>
                                        <textarea id="message" name="message" placeholder="Is there anything else you would like to add?...." class="textarea" required></textarea>
                                        <div id="message-error" class="error"></div>
                                    </div>
                                </div>

                                <div class="form-group" id="tutor-option-group">
                                    <label>Would you like a second tutor option?<span class="required">*</span></label>
                                    <div class="radio-group">
                                        <br>
                                        <label>
                                            <input type="radio" name="tutor-option" value="Yes" required>
                                            Yes
                                        </label>
                                        <label>
                                            <input type="radio" name="tutor-option" value="No" required >
                                            No
                                        </label>
                                        <div id="tutor-option-error" class="error"></div>
                                    </div>
                                </div>

                                <div class="terms-row">
                                    <input type="checkbox" id="terms" name="terms" required>
                                    <label for="terms">
                                        I have read and agree to the <a href="https://www.apexacademiccentre.co.za/terms-and-conditions/" target="_blank" id="termsCondition">Terms and Conditions</a> and <a href="https://www.apexacademiccentre.co.za/wp-content/uploads/2024/01/Privacy-Policy-for-Apex-Academic-Centre.pdf" target="_blank" id="termsCondition">Privacy Policy</a>.<span class="required">*</span>
                                    </label>
                                    <div id="terms-error" class="error"></div>
                                </div>

                            <div class="btns_wrap">
                                <div class="common_btns form_4_btns">
                                    <button type="button" class="btn_back">Back</button>
                                    <button type="button" class="btn_next">Next</button>
                                </div>
                            </div>
                           </form>
                        </div>
                    </div>

                        <!--form 5-->

                        <div class="form_5" style="display: none;" id="formFive">
                            <h2>Payment Packages</h2>
                            
                            <div class="div-container" id="schoolPackages">
                                <div class="custom-div">
                                    <p>Once Off Package</p>
                                    <div class="content">
                                        <div class="session-per-month">1 Session per month<br>(once off)</div>
                                        <div class="package-details" onclick="onceOffPackage()">Package Details</div>
                                        <button type="submit" class="package-btn" id="onceOffPackage">Select</button>
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <p>Basic Package</p>
                                    <div class="content">
                                        <div class="session-per-month">4 Sessions per month<br>(once a week)</div>
                                        <div class="package-details" onclick="basicPackage()">Package Details</div>
                                        <button type="submit" class="package-btn" id="basicPackage">Select</button>
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <p>Premium Package</p>
                                    <div class="content">
                                        <div class="session-per-month">8 Sessions per month<br>(twice a week)</div>
                                        <div class="package-details" onclick="premiumPackage()" id="popular">Popular</div>
                                        <button type="submit" class="package-btn" id="premiumPackage">Select</button>
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <p>Advanced Package</p>
                                    <div class="content">
                                        <div class="session-per-month">12 Sessions per month<br>(three times a week)</div>
                                        <div class="package-details" onclick="advanceElite()">Package Details</div>
                                        <button type="submit" class="package-btn" id="advancedPackage">Select</button>
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <p>Elite Package</p>
                                    <div class="content">
                                        <div class="session-per-month">16 Sessions per month<br>(four times a week)</div>
                                        <div class="package-details" onclick="advanceElite()">Package Details</div>
                                        <button type="submit" class="package-btn" id="elitePackage">Select</button>
                                    </div>
                                </div>
                            </div>
                        
                            <div class="div-container" id="universityPackages">
                                <div class="custom-div">
                                    <p>One on One</p>
                                    <div class="content">
                                        <div class="package-details" onclick="oneOnoneUniversity()">Package Details</div>
                                        <button type="submit" class="package-btn" id="oneOnone">Select</button>
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <p>2 to 5 students</p>
                                    <div class="content">
                                        <div class="package-details" onclick="groupUniversity()">Package Details</div>
                                        <button type="submit" class="package-btn" id="twoTofivePackage">Select</button>
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <p>6 to 10 students</p>
                                    <div class="content">
                                        <div class="package-details" onclick="groupUniversity()">Package Details</div>
                                        <button type="submit" class="package-btn" id="sixTo10Package">Select</button>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="btns_wrap">
                                <div class="common_btns form_5_btns">
                                    <button type="button" class="btn_back">Back</button>
                                    <button type="button" class="btn_next" id="consult_btn">Speak to consultant</button>
                                </div>
                            </div>
                        </div>
                        
            
                        <!--form 5-->

                   <!--</div>-->


                    <div id="popup" class="popup hide">
                        <div class="popup-content">
                            <span class="close" onclick="closePopup()">&times;</span>
                            <h2>Package Details</h2>
                            <div id="pack-details"></div>
                            <!-- Add more details as needed -->
                        </div>
                    </div>


                    <!--END OF FORMS-->
                    <div class="modal_wrapper">
                        <div class="shadow"></div>
                        <div class="success_wrap">
                            <div class="modal_icon">✓</div>
                            <p>Thank you! Your form has been submitted successfully.</p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        <!--</div>-->

     <!--BOOKING FORM--> 
    
     <div class="subscription-container">
        <h2>Don’t miss our future updates! Get Subscribed Today!</h2>
        <form action="/subscribe" method="post" onsubmit="return subscribeMethod()">
          <div class="subscription-wrapper">
              <input type="email" name="email" placeholder="Enter Your Email Address" required>
              <button type="submit">Subscribe</button>
          </div>
        </form>
      </div><br>

    
<footer id="footer-footer">

    <div class="footer-row">
        <!-- First Column -->
        <div class="links">
            <div class="column" style="padding-left: 14px;">
               <img src="logoo.png" alt="Logo" class="logo-style" id="logo_image"><br>
                <p class="aboutApex">Apex Academic Centre delivers personalized, high-quality tutoring across the globe. Our experienced tutors empower students to excel in IEB, CAPS, Cambridge, and Pearson Edexcel curricula through flexible online and in-person learning solutions.</p>
                <br>
                <h3 class="footer-heading">  Contact Info</h3><br>
                <p><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;364 Jan Smuts Ave, Craighall, Randburg</p><br>
                <p><i class="fas fa-phone"></i>&nbsp;&nbsp;+27 68 035 1845</p><br>
                <p><i class="fas fa-phone"></i>&nbsp;&nbsp;+27 11 354 0198</p><br>
                <p class="myEmail"><i class="fas fa-envelope"></i> <a href="mailto:info@apexacademiccentre.co.za">&nbsp;&nbsp;info@apexacademiccentre.co.za</a></p>
                <br>
                <p class="icons">
                    <a href="https://api.whatsapp.com/send/?phone=27680351845&text&type=phone_number&app_absent=0" target="_blank"><i class="fab fa-whatsapp"></i></a>
                    <a href="https://www.facebook.com/Apex.family6/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://x.com/i/flow/login?redirect_after_login=%2Facademic_centre" target="_blank"><i class="fab fa-x"></i></a>
                    <a href="https://www.instagram.com/apex_academiccentre/#" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="https://apexacademics.tumblr.com/" target="_blank"><i class="fab fa-tumblr"></i></a>
                </p><br>
            </div>

             <!-- Second Column -->
            <div class="column">
                <h3 class="footer-heading" style="padding-left: 14px;">Quick Links</h3>
                <a href="https://www.apexacademiccentre.co.za/" class="link">≫ Home</a>
                <a href="https://www.apexacademiccentre.co.za/online-tutoring/" class="link">≫ Online Tutoring</a>
                <a href="https://www.apexacademiccentre.co.za/in-person-tutoring/" class="link">≫ In-person Tutoring</a>
                <a href="https://www.apexacademiccentre.co.za/university-college-tutors/" class="link">≫ University and College Tutoring</a>
                <a href="https://www.apexacademiccentre.co.za/matric-rewrite-2025/" class="link">≫ Matric Rewrite</a>
                <a href="https://bookatutorapexacademiccentre.co.za/become-tutor" class="link">≫ Become a Tutor</a>
                <a href="https://www.apexacademiccentre.co.za/cambridge-tutoring/" class="link">≫ Cambridge</a>
                <a href="https://www.apexacademiccentre.co.za/pearson-edexcel-tutoring/" class="link">≫ Pearson Edexcel</a>
                <a href="https://www.apexacademiccentre.co.za/homeschooling-support/" class="link">≫ Homeschooling Support</a>
                <a href="https://www.apexacademiccentre.co.za/special-needs-tutoring/" class="link">≫ Special Needs Tutoring</a>
                <a href="https://www.apexacademiccentre.co.za/about-us/" class="link">≫ About Us</a>
                <a href="https://www.apexacademiccentre.co.za/blog/" class="link">≫ Blogs</a>
                <a href="https://www.apexacademiccentre.co.za/job-openings/" class="link">≫ Career</a>
                <a href="https://www.apexacademiccentre.co.za/faq/" class="link">≫ FAQs</a><br>
            </div>


            <div class="column">
                <h3 class="footer-heading" style="padding-left: 14px;">Curriculum</h3><br>
                <a href="https://bookatutorapexacademiccentre.co.za/syllabus-CAPS" class="link">≫ NSC (CAPS)</a>
                <a href="https://bookatutorapexacademiccentre.co.za/syllabus-IB" class="link">≫ IB</a>
                <a href="https://bookatutorapexacademiccentre.co.za/syllabus-IEB" class="link">≫ IEB</a>
                <a href="https://www.apexacademiccentre.co.za/igcse-level-tutoring/" class="link">≫ IGCSE</a>
                <a href="https://www.apexacademiccentre.co.za/olevel-tutoring/" class="link">≫ O’ Level</a>
                <a href="https://www.apexacademiccentre.co.za/as-level-tutoring/" class="link">≫ AS Level</a>
                <a href="https://www.apexacademiccentre.co.za/a-level-tutoring/" class="link">≫ A Level</a><br>
                <h3 class="footer-heading" style="padding-left: 14px;"> Online Classes</h3><br>
                <a href="https://bookatutorapexacademiccentre.co.za/maths-class" class="link">≫ Mathematics Online Class</a>
                <a href="https://bookatutorapexacademiccentre.co.za/matric-rewrite" class="link">≫ Matric Rewrite Online Class</a>
                <a href="https://www.apexacademiccentre.co.za/stem-excellence-program/" class="link">≫ STEM Classes</a>
                <a href="https://www.apexacademiccentre.co.za/subjects-offered/" class="link">≫ Subjects Offered</a>
            </div>


            <!-- Fourth Column -->
            <div class="column">
                <h3 class="footer-heading" style="padding-left: 14px;">Resources</h3>
                <a href="#" class="link">≫ DBE (CAPS)</a>
                <a href="#" class="link">≫ Study Guides (Grade 10 to 12)</a>
                <a href="#" class="link">≫ Grade 12 NSC Past Papers</a>
                <a href="#" class="link">≫ SBA Examples</a>
                <a href="#" class="link">≫ IEB Resources</a>
                <a href="#" class="link">≫ IEB Past Papers</a>
                <a href="#" class="link">≫ ISC Past Papers (IEB)</a>
                <a href="#" class="link">≫ Grade 12 IEB Past Papers</a>
                <a href="#" class="link">≫ IGCSE Past Papers (Cambridge)</a>
                <a href="#" class="link">≫ AS and A Level Past Papers (Cambridge)</a>
                <a href="#" class="link">≫ IGCSE Past Papers (Pearson)</a>
                <a href="#" class="link">≫ AS Past Papers (Pearson)</a>
                <a href="#" class="link">≫ Worksheets</a>
            </div>

        </div>

    </div>



<div class="footer-row">
    <h3 class="footer-heading" id="popSub" style="padding-left: 14px;">Popular Subjects</h3>
    <div class="links">
        <div class="column">
           
            <a href="/Mathematics-tutors" class="link">≫ Mathematics</a>
            <a href="/Mathematics_Literacy-tutors" class="link">≫ Mathematics Literacy</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Physics-tutors
            " class="link">≫ Physics</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Physical_Sciences-tutors
            " class="link">≫ Physical Sciences</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Chemistry-tutors
            " class="link">≫ Chemistry</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Biology-tutors
            " class="link">≫ Biology</a>
        </div>
        <div class="column">
            <a href="https://bookatutorapexacademiccentre.co.za/Life_Sciences-tutors
            " class="link">≫ Life Sciences</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Natural_Sciences-tutors
            " class="link">≫ Natural Sciences</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Accounting-tutors
            " class="link">≫ Accounting</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Business_Studies-tutors
            " class="link">≫ Business Studies</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Econimics-tutors
            " class="link">≫ Economics</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Computer_Science-tutors
            " class="link">≫ Computer Science</a>
        </div>
        <div class="column">
            <a href="https://bookatutorapexacademiccentre.co.za/CAT-tutors
            " class="link">≫ CAT</a>
            <a href="https://bookatutorapexacademiccentre.co.za/EMS-tutors
            " class="link">≫ EMS</a>
            <a href="https://bookatutorapexacademiccentre.co.za/History-tutors
            " class="link">≫ History</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Geography-tutors
            " class="link">≫ Geography</a>
            <a href="https://bookatutorapexacademiccentre.co.za/English-tutors
            " class="link">≫ English</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Afrikaans-tutors
            " class="link">≫ Afrikaans</a>
        </div>
        <div class="column">
            <a href="https://bookatutorapexacademiccentre.co.za/isiZulu-tutors
            " class="link">≫ IsiZulu</a>
            <a href="https://bookatutorapexacademiccentre.co.za/German-tutors " class="link">≫ German</a>
            <a href="https://bookatutorapexacademiccentre.co.za/IT-tutors
            " class="link">≫ IT</a>
            <a href="https://bookatutorapexacademiccentre.co.za/Sepedi-tutors
            " class="link">≫ Sepedi</a>
            <a href="https://bookatutorapexacademiccentre.co.za/French-tutors
            " class="link">≫ French</a>
            <a href="https://bookatutorapexacademiccentre.co.za/isiXhosa-tutors
            " class="link">≫ IsiXhosa</a>
            <!-- You can add more subjects here if needed -->
        </div>
    </div>
</div>



<div class="footer-row last-content-row">
    <h3 class="footer-heading" id="tutorLog" style="padding-left: 14px;">Tutors by Location</h3>
    <div class="links">
        <div class="column">
            <a href="/tutors-in-Randburg" class="link">≫ Randburg</a>
            <a href="/tutors-in-Krugersdorp" class="link">≫ Krugersdorp</a>
            <a href="/tutors-in-Roodepoort" class="link">≫ Roodepoort</a>
            <a href="/tutors-in-Sandton" class="link">≫ Sandton</a>
            <a href="/tutors-in-Midrand" class="link">≫ Midrand</a>
            <a href="/tutors-in-Centurion" class="link">≫ Centurion</a>
        </div>
        <div class="column">
            <a href="/tutors-in-Benoni" class="link">≫ Benoni</a>
            <a href="/tutors-in-Pretoria" class="link">≫ Pretoria</a>
            <a href="/tutors-in-Mamelodi" class="link">≫ Mamelodi</a>
            <a href="/tutors-in-kempton Park" class="link">≫ Kempton Park</a>
            <a href="/tutors-in-Polokwane" class="link">≫ Polokwane</a>
            <a href="/tutors-in-Nelspruit" class="link">≫ Nelspruit</a>
        </div>
        <div class="column">
            <a href="/tutors-in-Boksurg" class="link">≫ Boksburg</a>
            <a href="/tutors-in-Edenvale" class="link">≫ Edenvale</a>
            <a href="/tutors-in-Springs" class="link">≫ Springs</a>
            <a href="/tutors-in-Alberton" class="link">≫ Alberton</a>
            <a href="/tutors-in-Johannesburg" class="link">≫ Johannesburg</a>
            <a href="/tutors-in-Soweto" class="link">≫ Soweto</a>
        </div>
        <div class="column">
            <a href="/tutors-in-Pietermaritzburg" class="link">≫ Pietermaritzburg</a>
            <a href="/tutors-in-Durban" class="link">≫ Durban</a>
            <a href="/tutors-in-Mthatha" class="link">≫ Mthatha</a>
            <a href="/tutors-in-Cape Town" class="link">≫ Cape Town</a>
            <a href="/tutors-in-Kimberley" class="link">≫ Kimberley</a>
            <a href="/tutors-in-Mafikeng" class="link">≫ Mafikeng</a>

        </div>
    </div>
    
    
</div>

 <!-- Add the footer-bottom row for copyright and terms -->
 <div class="footer-bottom">
    <div class="footer-column">
        <p style="white-space: nowrap;">&copy; 2024 Apex Academic Centre | Designed by<a href="https://www.nativewebs.co.za/" class="footer-link">NativeWebs</a> All rights reserved.</p>
    </div>
    <div class="footer-column">
        <a href="https://www.apexacademiccentre.co.za/privacy-policy/" class="footer-link">Privacy Policy</a>.<a href="https://www.apexacademiccentre.co.za/terms-and-conditions/" class="footer-link">Terms & Conditions</a>
    </div>
</div>
</footer>








    
    <script>

const navbarToggle = document.getElementById('navbar-toggle');
const navLinks = document.querySelector('.nav-links');

// Toggle menu on button click
navbarToggle.addEventListener('click', function() {
    navLinks.classList.toggle('show');
});

// Close menu when a link is clicked
navLinks.querySelectorAll('li a').forEach(link => {
    link.addEventListener('click', function() {
        navLinks.classList.remove('show'); // Close the menu
    });
});

// Optional: Close menu when clicking outside of it
window.addEventListener('click', function(event) {
    if (!navbarToggle.contains(event.target) && !navLinks.contains(event.target)) {
        navLinks.classList.remove('show'); // Close the menu
    }
});



    const scrollContainer = document.getElementById('scrollContainer');

document.getElementById('scrollLeft').addEventListener('click', () => {
    scrollContainer.scrollLeft -= 210; // Adjust as necessary
});

document.getElementById('scrollRight').addEventListener('click', () => {
    scrollContainer.scrollLeft += 210; // Adjust as necessary
});


         /*#########################BOOKINGS#######################*/

         function onceOffPackage(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');
var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

if (ghg === "Online" && forwho === 'school' ){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session 
        <ul>
            <li>•Format: One-on-one live sessions </li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one In-person tutoring at your home</li>
            <li>•Pricing: All prices are quoted in South African Rand.</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');

}


function basicPackage(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');
var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

if (ghg === "Online" && forwho === 'school' ){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one live sessions</li>
            <li>•Special Offer: 10% sibling discount available</li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
            <li>•Only covers one subject in a month</li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one, in-person tutoring at your home</li>
            <li>•Pricing: All prices quoted in South African Rand (ZAR)</li>
            <li>•Family Discount: 10% sibling discount available.</li>
            <li>•Covers one subject per month.</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');
}

function premiumPackage(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');
var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

if (ghg === "Online" && forwho === 'school' ){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one live sessions</li>
            <li>•Special Offer: 10% sibling discount available</li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
            <li>•Covers 2 subjects in a month</li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one, in-person tutoring at your home</li>
            <li>•Pricing: All prices quoted in South African Rand (ZAR)</li>
            <li>•Family Discount: 10% sibling discount available.</li>
            <li>•Covers up to two subjects per month.</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');

}


function advanceElite(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');
var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

if (ghg === "Online" && forwho === 'school' ){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one live sessions</li>
            <li>•Special Offer: 10% sibling discount available</li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
            <li>•Covers two or more subjects per month </li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one, in-person tutoring at your home</li>
            <li>•Pricing: All prices quoted in South African Rand (ZAR)</li>
            <li>•Family Discount: 10% sibling discount available.</li>
            <li>•Covers two or more subjects </li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');
  
}

function oneOnoneUniversity(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');

if (ghg === "Online"){

    pack_details.innerHTML = `
        •Duration: 60 minutes 
        <ul>
            <li>•Format: One-on-one live sessions.</li>
            <li>•Discount: we offer a discount if you book more than 5 sessions</li>
            <li>•All prices are quoted in South African Rand (ZAR).</li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes 
        <ul>
            <li>•Location: Campus or home tutoring</li>
            <li>•Discount: we offer a discount if you book more than 5 sessions.</li>
            <li>•All prices are quoted in South African Rand (ZAR)</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');

}

function groupUniversity(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');

if (ghg === "Online"){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•All sessions are live interactive learning experiences </li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
          
        </ul>`;


      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes 
        <ul>
            <li>•Location: Campus or home tutoring</li>
            <li>•Discount: we offer a discount if you book more than 5 sessions.</li>
            <li>•All prices are quoted in South African Rand (ZAR)</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');


}




function closePopup() {
document.getElementById('popup').classList.add('hide');
}

function openPackageDetailsUniversity(){

var pack_details = document.getElementById('pack-details');
var ghg = document.getElementById('tutor-style').value.trim(); 


if (ghg === "In Person"){

pack_details.innerHTML = `
•Each session is 60 minutes
<ul>
<li>•Campus Tutoring or home tutoring (in-person)</li>
<li>•All prices are in South African currency</li>
</ul>`;

}
else{


pack_details.innerHTML = `
•Live sessions
<ul>
<li>•These prices are per session</li>
<li>•All prices are in South African currency</li>
</ul>`;

}

document.getElementById('popup').classList.remove('hide');


}

document.addEventListener('DOMContentLoaded', function() {
const otherOption = document.getElementById('other-option');
otherOption.style.display = 'none'; // Hide the "Other" option
});

document.addEventListener('DOMContentLoaded', function() {
var form_1 = document.querySelector(".form_1");
var form_2 = document.querySelector(".form_2");
var form_3 = document.querySelector(".form_3");
var form_4 = document.querySelector(".form_4");
var form_5 = document.querySelector(".form_5");

var form_1_btns = document.querySelector(".form_1_btns");
var form_2_btns = document.querySelector(".form_2_btns");
var form_3_btns = document.querySelector(".form_3_btns");
var form_4_btns = document.querySelector(".form_4_btns");
var form_5_btns = document.querySelector(".form_5_btns");

var form_1_next_btn = document.querySelector(".form_1_btns .btn_next");
var form_2_back_btn = document.querySelector(".form_2_btns .btn_back");
var form_2_next_btn = document.querySelector(".form_2_btns .btn_next");
var form_3_back_btn = document.querySelector(".form_3_btns .btn_back");
var form_3_next_btn = document.querySelector(".form_3_btns .btn_next");
var form_4_back_btn = document.querySelector(".form_4_btns .btn_back");
var form_4_next_btn = document.querySelector(".form_4_btns .btn_next");
var form_5_back_btn = document.querySelector(".form_5_btns .btn_back");
var consult = document.querySelector(".form_5_btns .btn_next");


var form_2_progessbar = document.querySelector(".form_2_progessbar");
var form_3_progessbar = document.querySelector(".form_3_progessbar");

var btn_done = document.querySelector(".btn_done");
var modal_wrapper = document.querySelector(".modal_wrapper");
var shadow = document.querySelector(".shadow");

function validateForm1() {

    var firstName = document.getElementById('first-name').value.trim();
    var lastName = document.getElementById('last-name').value.trim();
    var email = document.getElementById('email').value.trim();
    var phone = document.getElementById('phone').value.trim();
    var province = document.getElementById('province').value;
    var country = document.getElementById('country').value;
    var language = document.getElementById('language').value;

    var isValid = true;

    // Validate required text inputs
    if (!firstName) {
        document.getElementById('first-name-error').textContent = "First name is required.";
        isValid = false;
    } else {
        document.getElementById('first-name-error').textContent = "";
    }

    if (!lastName) {
        document.getElementById('last-name-error').textContent = "Last name is required.";
        isValid = false;
    } else {
        document.getElementById('last-name-error').textContent = "";
    }

    if (!email) {
        document.getElementById('email-error').textContent = "Email is required.";
        isValid = false;
    } else {
        document.getElementById('email-error').textContent = "";
    }

    if (!phone) {
    document.getElementById('phone-error').textContent = "Phone number is required.";
    isValid = false;
    }
    else{

         var checkNumber = validatePhoneNumber();

           if(!checkNumber){
            isValid = false;
           }
          
    }

    if (!country) {
        document.getElementById('country-error').textContent = "Country is required.";
        isValid = false;
    } else {
        document.getElementById('country-error').textContent = "";
    }

    // Validate radio buttons
    if (!language) {
        document.getElementById('language-error').textContent = "Language is required.";
        isValid = false;
    } else {
        document.getElementById('language-error').textContent = "";
    }

    // Validate dropdown
    if(country === "South Africa"){
         document.getElementById("in-peerson").style.display = 'block';
        if (!province) {
        document.getElementById('province-error').textContent = "Please select a province.";
        isValid = false;
    } else {
        document.getElementById('province-error').textContent = "";
    }

    }
   else{

       document.getElementById("in-peerson").style.display = 'none';
   }


    return isValid;                



}

function validateForm2() {
        
        var isValid = true;
                    var tutoringfor = document.getElementById("tutoring-for").value;
        var helpingFor = document.querySelector('input[name="help-with"]:checked');
        var ghg = helpingFor ? helpingFor.value : 'None';
        var studentName = document.getElementById('student-name').value.trim();
        var studentLastName = document.getElementById('student-last-name').value.trim();
        var yearFor = document.querySelector('input[name="year"]:checked');
        var syllabusId = document.getElementById('syllabus').value;
        var gradeId = document.getElementById('grade').value;
        var gradeIds = document.getElementById('inter-grade').value;
        var studname =  document.getElementById('stud-name').value;
        var studlast =  document.getElementById('stud-last').value;
        var country = document.getElementById('country').value;
        
           if(ghg === "school"){
            
            if (!studentName) {
            document.getElementById('student-name-error').textContent = "Student name is required.";
            isValid = false;
        } else {
            document.getElementById('student-name-error').textContent = "";
        }

        if (!studentLastName) {
            document.getElementById('student-last-name-error').textContent = "Last name is required.";
            isValid = false;
        } else {
            document.getElementById('student-last-name-error').textContent = "";
        }

        if (!syllabusId) {
            document.getElementById('syllabus-error').textContent = "Please select syllabus.";
            isValid = false;
        } else {
            document.getElementById('syllabus-error').textContent = "";
        }

        /*Grade*/


         if(country === "South Africa"){

            if (!gradeId) {
            document.getElementById('grade-error').textContent = "Please select grade.";
            isValid = false;
                } else {
                    document.getElementById('grade-error').textContent = "";
                }

            }
            else{

                if (!gradeIds) {
                    document.getElementById('inter-grade-error').textContent = "Please select grade.";
                    isValid = false;
                } else {
                    document.getElementById('inter-grade-error').textContent = "";
                }


            }

        }
        else{
            
            if (!yearFor) {
            document.getElementById('year-error').textContent = "Please select year.";
            isValid = false;
            } else {
            document.getElementById('year-error').textContent = "";
            }

            const postgradRadio = document.getElementById('year-postgrad');
            var postType = document.querySelector('input[name="postgrad-type"]:checked');

            if (postgradRadio.checked) {
            
                 if(!postType){

                    document.getElementById('postType-error').textContent = "Please select qualification.";
                    isValid = false;

                 }

                 else{

                    document.getElementById('postType-error').textContent = "";

                 }
               

            }
        


            if (!studname) {
            document.getElementById('stud-name-error').textContent = "Student name required.";
            isValid = false;
            } else {
            document.getElementById('stud-name-error').textContent = "";
            }

            if (!studlast) {
            document.getElementById('stud-last-error').textContent = "Student surname required.";
            isValid = false;
            } else {
            document.getElementById('stud-last-error').textContent = "";
            }

        }

        // Validate dropdown
        if (!tutoringfor) {
            document.getElementById('tutoring-for-error').textContent = "Please select one.";
            isValid = false;
        } else {
            document.getElementById('tutoring-for-error').textContent = "";
        }

        // Validate radio buttons
        if (!helpingFor) {
            document.getElementById('help-with-error').textContent = "Please choose what you need help with.";
            isValid = false;
        } else {
            document.getElementById('help-with-error').textContent = "";
        }

        return isValid;
    }

function validateForm3() {

var isValid = true;

var helpingFor = document.querySelector('input[name="help-with"]:checked');
var schoolUniversity = helpingFor ? helpingFor.value : 'None';
var subject = document.getElementById('subject').value.trim();
var ghg = document.getElementById('tutor-style').value.trim(); 
var addressTeaching = document.getElementById('address-inperson').value.trim(); 
var suburbTeaching = document.getElementById('suburb-inperson').value.trim(); 
var internet_check = document.getElementById('internet-check').value.trim();
var qualification = document.getElementById('qualification-id').value.trim(); 
var module = document.getElementById('module-id').value.trim();
var specification = document.getElementById('specification-id').value.trim();

if(schoolUniversity === 'school'){
    if (!subject) {
        document.getElementById('subject-error').textContent = "Please select subject(s) type.";
        isValid = false;
    } else {
        document.getElementById('subject-error').textContent = "";
    }

}
else{

    if (!qualification) {
        document.getElementById('qualification-error').textContent = "Qualification is Required.";
        isValid = false;
    } else {
        document.getElementById('qualification-error').textContent = "";
    }

    if (!module) {
        document.getElementById('module-error').textContent = "Module is Required.";
        isValid = false;
    } else {
        document.getElementById('module-error').textContent = "";
    }

    if (!specification) {
        document.getElementById('specification-error').textContent = "Specificatioin area is Required.";
        isValid = false;
    } else {
        document.getElementById('specification-error').textContent = "";
    }


}

if (!ghg) {
        document.getElementById('tutor-style-error').textContent = "Please select a tutoring type.";
        isValid = false;
    } else {
        document.getElementById('tutor-style-error').textContent = "";
    }

    if (!addressTeaching) {
        document.getElementById('inperson-error').textContent = "please specify.";
        isValid = false;
    } else {
        document.getElementById('inperson-error').textContent = "";
    }

    if(ghg === "In Person"){
        
    if (!suburbTeaching) {
        document.getElementById('suburb-inperson-error').textContent = "please fill in your suburb.";
        isValid = false;
    } else {
        document.getElementById('suburb-inperson-error').textContent = "";
    }

     }


    return isValid;

}

consult.addEventListener("click", function() {

    alert("Consultant will get in touch  with you shortly. Thank you.");

    const allData = combineFormData();

    var other = "consult";

    const dataToSend = {
        ...allData, who : other
    };

            fetch('/other-booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(dataToSend)
                })
                .then(response => response.json())
                .then(result => {
                
                    setTimeout(function(){
                            window.location.href = '/';
                        } , 2000);

                        
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Optionally handle error response
                });

    setTimeout(function(){
        window.location.href = '/';
    } , 2000);

});

function validateForm4() {

    var ghg = document.getElementById('tutor-style').value.trim(); 
    var helpingFor = document.querySelector('input[name="help-with"]:checked');
    var forWho = helpingFor ? helpingFor.value : 'None';
    var syllabusId = document.getElementById('syllabus').value;

    if(forWho === "school"){

        var universityPackages = document.getElementById("universityPackages");
        universityPackages.style.display = 'none';
        var schoolPackages = document.getElementById("schoolPackages");
        schoolPackages.style.display = 'flex';

    if(ghg === "Online" && (syllabusId === "IEB" || syllabusId === "CAPs")){

        const onceOffPackage = document.getElementById('onceOffPackage');
        onceOffPackage.textContent = 'R300'; // I changed R300 to R10 for testing

        const basicPackage= document.getElementById('basicPackage');
        basicPackage.textContent = 'R1100'; // or button.innerHTML = 'Submit';

        const premiumPackage = document.getElementById('premiumPackage');
        premiumPackage.textContent = 'R2150'; // or button.innerHTML = 'Submit';

        const advancedPackage = document.getElementById('advancedPackage');
        advancedPackage.textContent = 'R3250'; // or button.innerHTML = 'Submit';

        const elitePackage =  document.getElementById('elitePackage');
        elitePackage.textContent = 'R4350'; // or button.innerHTML = 'Submit';

    }
    else{
        if(ghg === "Online" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
           
           
        
            const onceOffPackage = document.getElementById('onceOffPackage');
            onceOffPackage.textContent = 'R400'; // or button.innerHTML = 'Submit';

            const basicPackage= document.getElementById('basicPackage');
            basicPackage.textContent = 'R1550'; // or button.innerHTML = 'Submit';

            const premiumPackage = document.getElementById('premiumPackage');
            premiumPackage.textContent = 'R3100'; // or button.innerHTML = 'Submit';

            const advancedPackage = document.getElementById('advancedPackage');
            advancedPackage.textContent = 'R4650'; // or button.innerHTML = 'Submit';

            const elitePackage =  document.getElementById('elitePackage');
            elitePackage.textContent = 'R6200'; // or button.innerHTML = 'Submit';

        }
        else{
            if(ghg === "In Person" && (syllabusId === "IEB" || syllabusId === "CAPs")){

                

                const onceOffPackage = document.getElementById('onceOffPackage');
                onceOffPackage.textContent = 'R400'; // or button.innerHTML = 'Submit';

                const basicPackage= document.getElementById('basicPackage');
                basicPackage.textContent = 'R1550'; // or button.innerHTML = 'Submit';

                const premiumPackage = document.getElementById('premiumPackage');
                premiumPackage.textContent = 'R3100'; // or button.innerHTML = 'Submit';

                const advancedPackage = document.getElementById('advancedPackage');
                advancedPackage.textContent = 'R4650'; // or button.innerHTML = 'Submit';

                const elitePackage =  document.getElementById('elitePackage');
                elitePackage.textContent = 'R6200'; // or button.innerHTML = 'Submit';

                    }

                else{
                    if(ghg === "In Person" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
           
                      

                            const onceOffPackage = document.getElementById('onceOffPackage');
                            onceOffPackage.textContent = 'R550'; // or button.innerHTML = 'Submit';

                            const basicPackage= document.getElementById('basicPackage');
                            basicPackage.textContent = 'R2150'; // or button.innerHTML = 'Submit';

                            const premiumPackage = document.getElementById('premiumPackage');
                            premiumPackage.textContent = 'R4300'; // or button.innerHTML = 'Submit';

                            const advancedPackage = document.getElementById('advancedPackage');
                            advancedPackage.textContent = 'R6350'; // or button.innerHTML = 'Submit';

                            const elitePackage =  document.getElementById('elitePackage');
                            elitePackage.textContent = 'R8500'; // or button.innerHTML = 'Submit';

                        }
                       
                }
        }
    }
}

    else{

         var schoolPackages = document.getElementById("schoolPackages");
         schoolPackages.style.display = 'none';
         var universityPackages = document.getElementById("universityPackages");
         universityPackages.style.display = 'flex';


            var yearFor = document.querySelector('input[name="year"]:checked');
            var yearIn = yearFor ? yearFor.value : 'None';

           if(ghg === "In Person" && (yearIn === '1st' ||  yearIn === '2nd')){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R650'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R350'; // or button.innerHTML = 'Submit';

            }

            else{

                if(ghg === "Online" && (yearIn === '1st' ||  yearIn === '2nd')){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R300'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R200'; // or button.innerHTML = 'Submit';

            }

            else{

                if(ghg === "In Person" && (yearIn === '3rd' ||  yearIn === '4th')){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R750'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R550'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

            }

            else{

                if(ghg === "Online" && (yearIn === '3rd' ||  yearIn === '4th')){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R550'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R400'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R300'; // or button.innerHTML = 'Submit';

            }


            else{

                if(ghg === "In Person" && yearIn === 'postgrad'){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R850'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R750'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R550'; // or button.innerHTML = 'Submit';

            }
            else{

                if(ghg === "Online" && yearIn === 'postgrad'){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R650'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R350'; // or button.innerHTML = 'Submit';

            }
            }



            }


            }


            }


            }

    
      

    }

        var isValid = true;

        var message = document.getElementById('message').value.trim();
        var secondTutor = document.querySelector('input[name="tutor-option"]:checked');
        var ghg = secondTutor ? secondTutor.value : 'None';

        if (!secondTutor) {
        document.getElementById('tutor-option-error').textContent = "Please specify.";
        isValid = false;
        } else {
        document.getElementById('tutor-option-error').textContent = "";
        }
        
        var termsCheckbox = document.getElementById('terms');
            if (termsCheckbox.checked) {
                document.getElementById('terms-error').textContent = "";
            } else {
                document.getElementById('terms-error').textContent = "Required";
                isValid = false;
            }


             return isValid;

        }

        form_1_next_btn.addEventListener("click", function() {

if (validateForm1()) {

  var southGrade = document.getElementById('southGrade');
  var interGrade = document.getElementById('interGrade');

  var country = document.getElementById('country').value;

  if(country === "South Africa"){
      interGrade.style.display = 'none';
      southGrade.style.display = 'block';
  }
  else{
    southGrade.style.display = 'none';
    interGrade.style.display = 'block';
  }

    form_1.style.display = "none";
    form_2.style.display = "block";

    form_1_btns.style.display = "none";
    form_2_btns.style.display = "flex";

    form_2_progessbar.classList.add("active");
    form_1.classList.remove("active");
}
});


form_2_back_btn.addEventListener("click", function() {
    form_1.style.display = "block";
    form_2.style.display = "none";

    form_1_btns.style.display = "flex";
    form_2_btns.style.display = "none";

    form_2_progessbar.classList.remove("active");
    form_1.classList.add("active");
});

form_2_next_btn.addEventListener("click", function() {
                if (validateForm2()) {

                    var schoolSubject = document.getElementById('schoolSubject');
                    var universitySubject = document.getElementById('universitySubject');
                    var helpingFor = document.querySelector('input[name="help-with"]:checked');
                    var schoolUniversity = helpingFor ? helpingFor.value : 'None';

                    if(schoolUniversity === 'school'){

                          universitySubject.style.display = 'none';
                          schoolSubject.style.display = 'block';
                    }
                    else{

                        schoolSubject.style.display = 'none';
                        universitySubject.style.display = 'block';
                    }

                    form_2.style.display = "none";
                    form_3.style.display = "block";

                    form_2_btns.style.display = "none";
                    form_3_btns.style.display = "flex";

                    form_3_progessbar.classList.add("active");
                    form_2.classList.remove("active");
                }
            });

form_3_back_btn.addEventListener("click", function() {
    form_2.style.display = "block";
    form_3.style.display = "none";

    form_2_btns.style.display = "flex";
    form_3_btns.style.display = "none";

    form_3_progessbar.classList.remove("active");
    form_2.classList.add("active");
});

form_3_next_btn.addEventListener("click", function() {
   if (validateForm3()) {
        form_2.style.display = "none";
        form_3.style.display = "none";
        form_4.style.display = "block";

        form_2_btns.style.display = "none";
        form_4_btns.style.display = "flex";

    }
});

form_4_back_btn.addEventListener("click", function() {

    const modC = document.getElementById('yesyes');
        modC.style.backgroundColor = ''; // Reset to default
        modC.style.width = ''; // Reset to default

    form_3.style.display = "block";
    form_4.style.display = "none";

    form_3_btns.style.display = "flex";
    form_4_btns.style.display = "none";

});


function applyResponsiveStyles() {
const divContainer = document.getElementById('universityPackages');
const modC = document.getElementById('yesyes');

const currentWidth = window.innerWidth; // Get the current width of the viewport

if (currentWidth === 480) { // Mobile view
divContainer.style.width = '250px'; // Width for small screens
modC.style.width = '300px'; // Width for small screens
} 
// Apply styles based on the current width
if (currentWidth < 768) { // Mobile view
divContainer.style.width = '250px'; // Width for small screens
modC.style.width = '300px'; // Width for small screens
} else if (currentWidth < 1024) { // Tablet view
divContainer.style.width = '625px'; // Default width for larger screens
modC.style.width = '780px'; // Default width for larger screens
} else { // Large screens
divContainer.style.width = '625px'; // Default width for larger screens
modC.style.width = '780px'; // Default width for larger screens
}
}

/*window.addEventListener('resize', applyResponsiveStyles);*/

form_4_next_btn.addEventListener("click", function() {


    if(validateForm4()) {

        const divContainer = document.getElementById('universityPackages');

const modC = document.getElementById('yesyes');

var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forWho = helpingFor ? helpingFor.value : 'None';

if (forWho === "university") {

divContainer.style.padding = '10px'; // Add padding if desired
divContainer.style.justifyContent = 'center'; // Change justification if needed
applyResponsiveStyles(); // Apply responsive styles

}


        var syllabus = document.getElementById("syllabus").value;
        var helpingFor = document.querySelector('input[name="help-with"]:checked');
        var forWho = helpingFor ? helpingFor.value : 'None';

        if(syllabus === "Other" && forWho !== "university"){

        modal_wrapper.classList.add("active");
        shadow.addEventListener("click", function() {
            modal_wrapper.classList.remove("active");
        });

        const allData = combineFormData();

        var other = "other";

        const dataToSend = {
            ...allData, who : other
        };

                fetch('/other-booking', { // Replace with your actual endpoint URL
                        method: 'POST',
                        headers: { 
                            'Content-Type': 'application/json' 
                        },
                        body: JSON.stringify(dataToSend)
                    })
                    .then(response => response.json())
                    .then(result => {
                    
                        setTimeout(function(){
                                window.location.href = '/';
                            } , 2000);

                            
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        // Optionally handle error response
                    });

        setTimeout(function(){
            window.location.href = '/';
        } , 2000);

        }

      else{


        form_3.style.display = "none";
        form_4.style.display = "none";
        form_5.style.display = "block";

        form_4_btns.style.display = "none";
        form_5_btns.style.display = "flex";

      }

    }
});

form_5_back_btn.addEventListener("click", function() {

    const modC = document.getElementById('yesyes');
        modC.style.backgroundColor = ''; // Reset to default
        modC.style.width = ''; // Reset to default

    form_4.style.display = "block";
    form_5.style.display = "none";

    form_4_btns.style.display = "flex";
    form_4_btns.style.display = "flex";

});

            
});


document.getElementById("student-info").style.display = 'none';
document.getElementById("year-selection-container").style.display='none';
document.getElementById("in-person-teaching").style.display='none';

function studentInfo(){

document.getElementById("student-info").style.display = 'block';
document.getElementById("year-selection-container").style.display='none';

}

function vasityInfo(){
document.getElementById("year-selection-container").style.display='block';
document.getElementById("student-info").style.display = 'none';

}

function handleTutorStyleChange() {
const selectedValue = document.getElementById('tutor-style').value;
if (selectedValue === 'Online') {
onlineInfo();
} else if (selectedValue === 'In Person') {
inPersonInfo();
}
}

function inPersonInfo(){

document.getElementById("internetCheck").style.display = 'none';
document.getElementById("in-person-teaching").style.display = 'block';

}

document.getElementById("internetCheck").style.display = 'none';

function onlineInfo(){

    document.getElementById("in-person-teaching").style.display = 'none';
    document.getElementById("internetCheck").style.display = 'block';

}

/*var modal = document.getElementById("modal");
var btn = document.getElementById("open-popup");*/

function openOpenopen(name, email, subjects, grades , subsub) {

if(subjects === undefined){

    const syll = "CAPs,IEB,Cambridge,IB,Pearson Edexcel";
    const syllabusArray = syll.split(',').map(item => item.trim());

    const syllabi = syllabusArray.map(item => {
            return { value: item, text: item };
        });

    const syllabusSelect = document.getElementById('syllabus');

    while (syllabusSelect.options.length > 1) {

        const secondOption = syllabusSelect.options[1];

        // Check if the second option exists and remove it
        if (secondOption) {
            syllabusSelect.remove(1); // Remove the second option
        } else {
            break; // Exit the loop if no second option exists
        }
    }


    syllabi.forEach(syllabus => {
        const option = document.createElement('option');
        option.value = syllabus.value;
        option.textContent = syllabus.text;

        syllabusSelect.appendChild(option);

    });
                
}
else{
const syllabusArray = subjects.split(',').map(item => item.trim());

const syllabi = syllabusArray.map(item => {
        return { value: item, text: item };
    });

    const syllabusSelect = document.getElementById('syllabus');

    while (syllabusSelect.options.length > 1) {

        const secondOption = syllabusSelect.options[1];

        // Check if the second option exists and remove it
        if (secondOption) {
            syllabusSelect.remove(1); // Remove the second option
        } else {
            break; // Exit the loop if no second option exists
        }
    }


    syllabi.forEach(syllabus => {
        const option = document.createElement('option');
        option.value = syllabus.value;
        option.textContent = syllabus.text;

        syllabusSelect.appendChild(option);

    });

}

/*Grades Start Here*/

if(grades === undefined){

        const grd = "GRD:1,GRD:2,GRD:3,GRD:4,GRD:5,GRD:6,GRD:7,GRD:8,GRD:9,GRD:10,GRD:11,GRD:12";
        const gradesArray = grd.split(',').map(item => item.trim());

        const gr = gradesArray.map(item => {
                return { value: item, text: item };
            });

        const gradesSelect = document.getElementById('grade');

        while (gradesSelect.options.length > 0) {

            const secondOption = gradesSelect.options[0];

            // Check if the second option exists and remove it
            if (secondOption) {
                gradesSelect.remove(0); // Remove the second option
            } else {
                break; // Exit the loop if no second option exists
            }
        }


        gr.forEach(gradee => {
            const option = document.createElement('option');
            option.value = gradee.value;
            option.textContent = gradee.text;

            gradesSelect.appendChild(option);

        });
                    
        }
            else{
                const gradesArray = grades.split(',').map(item => item.trim());

                const gr = gradesArray.map(item => {
                                        return { value: item, text: item };
                                    });

                                    const gradesSelect = document.getElementById('grade');

            while (gradesSelect.options.length > 0) {

                const secondOption = gradesSelect.options[0];

                // Check if the second option exists and remove it
                if (secondOption) {
                    gradesSelect.remove(0); // Remove the second option
                } else {
                    break; // Exit the loop if no second option exists
                }
            }


                gr.forEach(gradee => {
                    const option = document.createElement('option');
                    option.value = gradee.value;
                    option.textContent = gradee.text;

                    gradesSelect.appendChild(option);

                });

                }

/*Grades End Here*/

/*Subects Start Here*/
const defaultSubjects = "Mathematics, Mathematics Literacy, English, Afrikaans, IsiZulu, Physics, Life Sciences, Physical Sciences, Biology, Chemistry, Natural Sciences, E.M.S, Sepedi, Accounting, History, Geography, German, Computer Science, Information Technology, Combined Science, Marine Science, Social Sciences, Technology, Humanities and Social Sciences, Creative Arts, Life Orientation, Life Skills, Business Studies, Economics, Sociology, Tourism, Travel & Tourism, French, Spanish, Portuguese, Engineering Graphics and Design, Sesotho, Setswana, IsiNdebele, Tshivenda, Xitsonga, Arabic, Italian, Computer Application Technology, Chinese, Swahili, Hindi, Environmental Management, Thai, Turkish, Vietnamese, Malay, IsiXhosa, Urdu, Psychology, Enterprise, Civil Technology, Electrical Technology, Mechanical Technology, Dance Studies, Design, Dramatic Arts, Agricultural Management Practices, Design & Technology, Drama, Chinese, Agricultural Sciences, Music, Agricultural Technology, Physical Education";

const subjectsArray = (subsub || defaultSubjects).split(',').map(item => item.trim());

const subjectContainer = document.getElementById('subjectContainer');


// Clear existing checkboxes
subjectContainer.innerHTML = '';

// Calculate the maximum length of subject names
const maxSubjectLength = Math.max(...subjectsArray.map(subject => subject.length));

// Increased spacing values
const baseGap = 10; // Increased base gap for styling
const dynamicGap = maxSubjectLength * 2; // Increased multiplier for more spacing
const gapSize = Math.max(baseGap, dynamicGap); // Ensure the gap isn't too small

const columnCount = 4; // Number of columns to display

function appendCheckboxes() {
let wrapper = document.createElement('div');
wrapper.style.display = 'flex';
wrapper.style.flexWrap = 'wrap'; // Allow wrapping to the next line
wrapper.style.gap = `${gapSize}px`; // Space between checkboxes based on longest subject

subjectsArray.forEach((subject, index) => {
const label = document.createElement('label');
label.className = 'subject-label'; // Add class to the label
label.style.display = 'flex'; // Use flex to align checkbox and text
label.style.alignItems = 'center'; // Center vertically
label.style.width = 'calc(25% - 15px)'; // Set width for each label to fit 4 columns and adjust for gaps
label.style.overflow = 'hidden'; // Hide overflow text
label.style.textOverflow = 'ellipsis'; // Show ellipsis for overflow text
label.style.whiteSpace = 'nowrap'; // Prevent text wrapping

const checkbox = document.createElement('input');
checkbox.type = 'checkbox';
checkbox.value = subject;
checkbox.onchange = updateSubjects; // Assuming updateSubjects is defined elsewhere

// Set the label text
label.textContent = subject; // Set the text for the label

// Append checkbox to label
label.prepend(checkbox); // Add checkbox before the label text

// Check if the screen width is greater than 768px
if (window.innerWidth > 768) {
// Append the label to the wrapper only if not a small screen

wrapper.appendChild(label);
}

// Append the wrapper to the container after every specified number of subjects (columns)
if ((index + 1) % columnCount === 0) {
subjectContainer.appendChild(wrapper); // Append the current column set
wrapper = document.createElement('div'); // Create a new wrapper for the next column
wrapper.style.display = 'flex';
wrapper.style.flexWrap = 'wrap'; // Allow wrapping to the next line
wrapper.style.gap = `${gapSize}px`; // Space between checkboxes based on longest subject
}
});

// Append remaining subjects if there are less than 'columnCount' in the last wrapper
if (wrapper.childElementCount > 0) {
subjectContainer.appendChild(wrapper);
}
}

// Call the function to append checkboxes initially
appendCheckboxes();

// Add an event listener for window resize
window.addEventListener('resize', () => {
// Clear existing checkboxes
subjectContainer.innerHTML = '';
// Re-append the checkboxes based on current screen width
appendCheckboxes();
});

/*Subects End Here*/

const button = document.getElementById('tutorBtn');
const directTutors = document.querySelectorAll('.directTutor');
const otherOption = document.getElementById('other-option');

if (event.target === button) {
    // The button was clicked
    directTutors.forEach(tutor => {
        tutor.textContent = 'BOOK A PERSONALIZED TUTOR';
    });
    otherOption.style.display = 'block'; // Show the "Other" option

    const tutorOptionGroup = document.getElementById('tutor-option-group');
    tutorOptionGroup.style.display = 'none'; // Hide the radio buttons

    
    const tutorOptionInputs = document.getElementsByName('tutor-option');
    for (let input of tutorOptionInputs) {
        if (input.value === 'No') {
            input.checked = true; 
        }
    }
    

} else {
    directTutors.forEach(tutor => {
        tutor.textContent = 'Book ' + name + ' for Tutoring!';
    });
    otherOption.style.display = 'none'; // Hide the "Other" option
    document.querySelector("#syllabus option:first-child").textContent = "";

    const tutorOptionGroup = document.getElementById('tutor-option-group');
        tutorOptionGroup.style.display = 'block'; // Hide the radio buttons



     }

document.getElementById("modal").style.display = 'block';
var span = document.getElementById("close-popup");

var tutorName = document.getElementById('hiddenTutorName');
tutorName.value = name;

var tutorEmail = document.getElementById('hiddenTutorEmail');
tutorEmail.value = email;

span.onclick = function() {
modal.style.display = "none";
}

window.onclick = function(event) {
if (event.target == modal) {
    modal.style.display = "none";
}
}

}

function formDataToObject(formData) {
const data = {};
formData.forEach((value, key) => {
// Handle multiple values for the same key
if (data[key]) {
// If value is already an array, push the new value
if (Array.isArray(data[key])) {
    data[key].push(value);
} else {
    // Convert existing value to an array and add new value
    data[key] = [data[key], value];
}
} else {
data[key] = value;
}
});
return data;
}

function combineFormData() {

const form1 = document.getElementById('contact-form');
const form2 = document.getElementById('additional-form');
const form3 = document.getElementById('submit-form');
const form4 = document.getElementById('formFour');

const form1Data = new FormData(form1);
const form2Data = new FormData(form2);
const form3Data = new FormData(form3);
const form4Data = new FormData(form4);

const data1 = formDataToObject(form1Data);
const data2 = formDataToObject(form2Data);
const data3 = formDataToObject(form3Data);
const data4 = formDataToObject(form4Data);

// Combine all data into a single object
return { ...data1, ...data2, ...data3, ...data4,};
}



document.addEventListener('DOMContentLoaded', (event) => {
// Get the buttons by their IDs
const onceOffButton = document.getElementById('onceOffPackage');
const basicButton = document.getElementById('basicPackage');
const premiumButton = document.getElementById('premiumPackage');
const advancedButton = document.getElementById('advancedPackage');
const eliteButton = document.getElementById('elitePackage');

const oneOnone = document.getElementById('oneOnone');
const twoTofivePackage = document.getElementById('twoTofivePackage');
const sixTo10Package = document.getElementById('sixTo10Package');

// Function to handle button clicks
function handleButtonClick(event) {
// Get the ID of the button that was clicked
const buttonId = event.target.id;

var ghg = document.getElementById('tutor-style').value.trim(); 
var syllabusId = document.getElementById('syllabus').value;

// You can use a switch statement or if-else logic to handle specific buttons
switch (buttonId) {
case 'onceOffPackage':

            let num;
      
                          do {
                                num = prompt("How many sessions do you want? (Please enter a number greater than 0)");
                                
                                // If user cancels, exit the loop
                                if (num === null) {
                                    console.log("Prompt was canceled.");
                                    break; // Exit the loop
                                }

                            } while (isNaN(num) || num <= 0);


var amountTopay;
var typePackage = 'Once off Package';

if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
     amountTopay = '300'; // amount to pay; i changed R300 to R10 for testing
   }
   else{

   if(ghg === "Online" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" )){
           
           amountTopay = '400'; // amount to pay;

   }

   else{

    if(ghg === "In Person" && (syllabusId === "IEB" || syllabusId === "CAPs")){

            amountTopay = '400'; // amount to pay;

            }

            else{

                if(ghg === "In Person" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
           
                        amountTopay = '550'; // amount to pay;
    
                    }

            }

   }

}

amountTopay *= num;

alert('Once Off Package selected. Amount to pay : R'+amountTopay);

    const allData = combineFormData();

    const dataToSend = {
        ...allData, // Spread the existing data
        amount: amountTopay , package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(dataToSend)
                })
                .then(response => response.json())
                .then(result => {
                
                    // Optionally show success message or handle response
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Optionally handle error response
                });

                setTimeout(function(){
            window.location.href = '/payment';
        } , 2000);

    break;
case 'basicPackage':
    alert('Basic Package selected');

    var amountTopay;
    var typePackage = 'Basic Package';

    if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
     amountTopay = '1100'; // amount to pay;
      }
      else{
      if(ghg === "Online" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
          amountTopay = '1550'; // amount to pay;

      }

      else{

        if(ghg === "In Person" && (syllabusId === "IEB" || syllabusId === "CAPs")){

            amountTopay = '1550'; // or button.innerHTML = 'Submit';

            }
            else{

                if(ghg === "In Person" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
                amountTopay = '2150'; // amount to pay;
      }

                
            }
      }

    }

    const all = combineFormData();

    const ToSend = {
        ...all, // Spread the existing data
        amount: amountTopay , package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(ToSend)
                })
                .then(response => response.json())
                .then(result => {
                    
                    // Optionally show success message or handle response
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Optionally handle error response
                });

                setTimeout(function(){
            window.location.href = '/payment';
        } , 2000);

    break;
case 'premiumPackage':
    alert('Premium Package selected');

    var amountTopay;
    var typePackage = 'Premium Package';

    if(ghg === "Online" && (syllabusId === "IEB" || syllabusId === "CAPs")){
    amountTopay = '2150'; // amount to pay;
    }
    else{
        if(ghg === "Online" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
           amountTopay = '3100'; // amount to pay;
    }

    else{

        if(ghg === "In Person" && (syllabusId === "IEB" || syllabusId === "CAPs")){

                amountTopay = '3100'; // amount to pay;

                }
                else{

                    if(ghg === "In Person" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" )){
           amountTopay = '4300'; // amount to pay;
    }

 }

    }

    }

    const dataall = combineFormData();

    const ToSendData = {
        ...dataall, // Spread the existing data
        amount: amountTopay , package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(ToSendData)
                })
                .then(response => response.json())
                .then(result => {
                    
                    // Optionally show success message or handle response
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Optionally handle error response
                });

                setTimeout(function(){
            window.location.href = '/payment';
        } , 2000);

    break;
case 'advancedPackage':
    alert('Advanced Package selected');

    var amountTopay;
    var typePackage = 'Advanced Package';

    if(ghg === "Online" && (syllabusId === "IEB" || syllabusId === "CAPs")){
     amountTopay = '3250'; // amount to pay;
      }
      else{
        if(ghg === "Online" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
         amountTopay = '4650'; // amount to pay;
      }

      else{
        if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){
       amountTopay = '4650'; // amount to pay;
      }
      else{

        if(ghg === "In Person" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
           amountTopay = '6350'; // amount to pay;
          }

      }

      }

      }

    const data = combineFormData();

    const sendData = {
        ...data, // Spread the existing data
        amount: amountTopay, package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(sendData)
                })
                .then(response => response.json())
                .then(result => {
                    
                    // Optionally show success message or handle response
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Optionally handle error response
                });

                setTimeout(function(){
            window.location.href = '/payment';
        } , 2000);


    break;
case 'elitePackage':
   alert('Elite Package selected');
   var  typePackage = 'Elite Package';

   var amountTopay;

    if(ghg === "Online" && (syllabusId === "IEB" || syllabusId === "CAPs")){
    amountTopay = '4350'; // amount to pay;
    }
    else{
        if(ghg === "Online" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
        amountTopay = '6200'; // or button.innerHTML = 'Submit';

        }
        else{

            if(ghg === "In Person" && (syllabusId === "IEB" || syllabusId === "CAPs")){
            amountTopay = '6200'; // or button.innerHTML = 'Submit';

                }
                else{

                    if(ghg === "In Person" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
          amountTopay = '8500'; // or button.innerHTML = 'Submit';

       }

                }
        }

    }

    const gatherData = combineFormData();

    const dataSend = {
        ...gatherData, // Spread the existing data
        amount: amountTopay , package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(dataSend)
                })
                .then(response => response.json())
                .then(result => {
                    
                    // Optionally show success message or handle response
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Optionally handle error response
                });

                setTimeout(function(){
            window.location.href = '/payment';
        } , 2000);

    break;

    case 'oneOnone':

    let value;

              do {
                    value = prompt("How many sessions do you want? (Please enter a number greater than 0)");
                    
                    // If user cancels, exit the loop
                    if (value === null) {
                        console.log("Prompt was canceled.");
                        break; // Exit the loop
                    }

                } while (isNaN(value) || value <= 0);

      //const value = prompt("How many sessions do you want?");

      var yearFor = document.querySelector('input[name="year"]:checked');
      var yearIn = yearFor ? yearFor.value : 'None';

       var amountTopay;
       var calcAmount;
       var discountAmount;
       var amountAfterDiscount;
       var trackDiscount = 0;
       var  typePackage = 'One on One: University';

       if(ghg === "In Person" && (yearIn === '1st' ||  yearIn === '2nd')){

             calcAmount = 650 * value;

                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                    
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                      
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount =3;
                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }

       }
       else{

        if(ghg === "Online" && (yearIn === '1st' ||  yearIn === '2nd')){

             calcAmount = 450 * value;

             if(value >= 8 && value <= 11){

                discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                amountAfterDiscount = amountAfterDiscount.toString();
                amountTopay = amountAfterDiscount;
                trackDiscount = 1;
                
                }
                else{
                if(value >= 12 && value <= 19){

                discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                amountAfterDiscount = amountAfterDiscount.toString();
                amountTopay = amountAfterDiscount;
                trackDiscount = 2;
                
                }
                else{
                    if(value >= 20 ){

                    discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                    amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                    amountAfterDiscount = amountAfterDiscount.toString();
                    amountTopay = amountAfterDiscount;
                    trackDiscount = 3;
                    
                    }
                    else{

                        if(value <= 7){

                        calcAmount = calcAmount.toString();
                        amountTopay = calcAmount;

                        }
                    }
                }
                }

        }
        else{
            if(ghg === "Online" && (yearIn === '3rd' ||  yearIn === '4th')){

                calcAmount = 550 * value;
                
                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                     
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                        
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount = 3;
                            
                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }
               

                }
                else{
                    if(ghg === "In Person" && (yearIn === '3rd' ||  yearIn === '4th')){

                    calcAmount = 750 * value;

                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                    
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                       
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount = 3;
                            
                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }

                    }

                    else{
                        if(ghg === "In Person" && (yearIn === 'postgrad')){

                            calcAmount = 850 * value;

                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                     
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                        
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount = 3;
                            
                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }

                            }
                            else{
                                if(ghg === "Online" && yearIn === 'postgrad'){

                                calcAmount = 650 * value;

                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                    
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                        
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount = 3;
                            

                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }

                              }

                            }

                    }

                }

        }

       }

       if (value !== null) {
                      
        if(trackDiscount === 1){

           alert("5% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

       }
       else{
        if(trackDiscount === 2){

            alert("10% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

                }
                else{

                    if(trackDiscount === 3){

                        alert("20% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

                    }

                    else{

                        alert("Amount to pay R"+amountTopay);
                    }

                }

       }

       const gatheredData = combineFormData();

        const dataSendout = {
            ...gatheredData, // Spread the existing data
            amount: amountTopay , package : typePackage , sessions : value
        };

        fetch('/booking', { // Replace with your actual endpoint URL
                        method: 'POST',
                        headers: { 
                            'Content-Type': 'application/json' 
                        },
                        body: JSON.stringify(dataSendout)
                    })
                    .then(response => response.json())
                    .then(result => {
                        
                        // Optionally show success message or handle response
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        // Optionally handle error response
                    });

                    setTimeout(function(){
                window.location.href = '/payment';
            } , 2000);

        }

    break;

    case 'twoTofivePackage':
   

    let valuee;

        do {
            valuee= prompt("How many sessions do you want? (Please enter a number greater than 0)");
            
            // If user cancels, exit the loop
            if (valuee === null) {
                console.log("Prompt was canceled.");
                break; // Exit the loop
            }

        } while (isNaN(valuee) || valuee <= 0);

var yearFor = document.querySelector('input[name="year"]:checked');
var yearIn = yearFor ? yearFor.value : 'None';

var amountTopay;
var calcAmount;
var discountAmount;
var amountAfterDiscount;
var trackDiscount = 0;
var typePackage = 'Two to Five : University';

if(ghg === "In Person" && (yearIn === '1st' ||  yearIn === '2nd')){

calcAmount = 450 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
    
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount =3;
          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

}
else{

if(ghg === "Online" && (yearIn === '1st' ||  yearIn === '2nd')){

calcAmount = 300 * valuee;

if(valuee >= 8 && valuee <= 11){

discountAmount = (5 / 100) * calcAmount; // 5% discount applied
amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
amountAfterDiscount = amountAfterDiscount.toString();
amountTopay = amountAfterDiscount;
trackDiscount = 1;

}
else{
if(valuee >= 12 && valuee <= 19){

discountAmount = (10 / 100) * calcAmount; // 10% discount applied
amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
amountAfterDiscount = amountAfterDiscount.toString();
amountTopay = amountAfterDiscount;
trackDiscount = 2;

}
else{
  if(valuee >= 20 ){

  discountAmount = (20 / 100) * calcAmount; // 20% discount applied
  amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
  amountAfterDiscount = amountAfterDiscount.toString();
  amountTopay = amountAfterDiscount;
  trackDiscount = 3;
  
  }
  else{

      if(valuee <= 7){

      calcAmount = calcAmount.toString();
      amountTopay = calcAmount;

      }
  }
}
}

}
else{
if(ghg === "Online" && (yearIn === '3rd' ||  yearIn === '4th')){

calcAmount = 400 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
   
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}


}
else{
  if(ghg === "In Person" && (yearIn === '3rd' ||  yearIn === '4th')){

  calcAmount = 550 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
     
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

  }

  else{
      if(ghg === "In Person" && yearIn === 'postgrad'){

          calcAmount = 750 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
   
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

          }
          else{
              if(ghg === "Online" && yearIn === 'postgrad'){

              calcAmount = 450 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          

          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

            }

          }

  }

}

}

}

if (valuee !== null) {

if(trackDiscount === 1){

alert("5% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

}
else{
if(trackDiscount === 2){

alert("10% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

}
else{

  if(trackDiscount === 3){

      alert("20% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

  }

  else{

      alert("Amount to pay R"+amountTopay);
  }

}

}
        const gatheredDat = combineFormData();

        const ataSendout = {
            ...gatheredDat, // Spread the existing data
            amount: amountTopay , package : typePackage , sessions : valuee
        };

        fetch('/booking', { // Replace with your actual endpoint URL
                        method: 'POST',
                        headers: { 
                            'Content-Type': 'application/json' 
                        },
                        body: JSON.stringify(ataSendout)
                    })
                    .then(response => response.json())
                    .then(result => {
                        
                        // Optionally show success message or handle response
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        // Optionally handle error response
                    });

                    setTimeout(function(){
                window.location.href = '/payment';
            } , 2000);
}

    break;

    case 'sixTo10Package':

    let valueee;

        do {
            valueee = prompt("How many sessions do you want? (Please enter a number greater than 0)");
            
            // If user cancels, exit the loop
            if (valueee === null) {
                console.log("Prompt was canceled.");
                break; // Exit the loop
            }

        } while (isNaN(valueee) || valueee <= 0);

        var yearFor = document.querySelector('input[name="year"]:checked');
        var yearIn = yearFor ? yearFor.value : 'None';

        var amountTopay;
        var calcAmount;
        var discountAmount;
        var amountAfterDiscount;
        var trackDiscount = 0;
        var typePackage = 'Six to Ten : University';

if(ghg === "In Person" && (yearIn === '1st' ||  yearIn === '2nd')){

calcAmount = 350 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
    
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount =3;
          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

}
else{

if(ghg === "Online" && (yearIn === '1st' ||  yearIn === '2nd')){

calcAmount = 200 * valueee;

if(valueee >= 8 && valueee <= 11){

discountAmount = (5 / 100) * calcAmount; // 5% discount applied
amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
amountAfterDiscount = amountAfterDiscount.toString();
amountTopay = amountAfterDiscount;
trackDiscount = 1;

}
else{
if(valueee >= 12 && valueee <= 19){

discountAmount = (10 / 100) * calcAmount; // 10% discount applied
amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
amountAfterDiscount = amountAfterDiscount.toString();
amountTopay = amountAfterDiscount;
trackDiscount = 2;

}
else{
  if(valueee >= 20 ){

  discountAmount = (20 / 100) * calcAmount; // 20% discount applied
  amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
  amountAfterDiscount = amountAfterDiscount.toString();
  amountTopay = amountAfterDiscount;
  trackDiscount = 3;
  
  }
  else{

      if(valueee <= 7){

      calcAmount = calcAmount.toString();
      amountTopay = calcAmount;

      }
  }
}
}

}
else{
if(ghg === "Online" && (yearIn === '3rd' ||  yearIn === '4th')){

calcAmount = 300 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
   
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}


}
else{
  if(ghg === "In Person" && (yearIn === '3rd' ||  yearIn === '4th')){

  calcAmount = 450 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
     
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

  }

  else{
      if(ghg === "In Person" && yearIn === 'postgrad'){

          calcAmount = 550 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
   
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

          }
          else{
              if(ghg === "Online" && yearIn === 'postgrad'){

              calcAmount = 350 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          

          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

            }

          }

  }

}

}

}
if (valueee !== null) {

if(trackDiscount === 1){

alert("5% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

}
else{
if(trackDiscount === 2){

alert("10% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

}
else{

  if(trackDiscount === 3){

      alert("20% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

  }

  else{

      alert("Amount to pay R"+amountTopay);
  }

}

}

        const outData = combineFormData();

        const sendOut = {
            ...outData, // Spread the existing data
            amount: amountTopay , package : typePackage , sessions : valueee
        };

        fetch('/booking', { // Replace with your actual endpoint URL
                        method: 'POST',
                        headers: { 
                            'Content-Type': 'application/json' 
                        },
                        body: JSON.stringify(sendOut)
                    })
                    .then(response => response.json())
                    .then(result => {
                        
                        // Optionally show success message or handle response
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        // Optionally handle error response
                    });

                    setTimeout(function(){
                window.location.href = '/payment';
            } , 2000);

        }

    break;
default:
    console.log('Unknown button clicked');
}
}

// Add click event listeners to the buttons
onceOffButton.addEventListener('click', handleButtonClick);
basicButton.addEventListener('click', handleButtonClick);
premiumButton.addEventListener('click', handleButtonClick);
advancedButton.addEventListener('click', handleButtonClick);
eliteButton.addEventListener('click', handleButtonClick);
oneOnone.addEventListener('click' , handleButtonClick);
twoTofivePackage.addEventListener('click' , handleButtonClick);
sixTo10Package.addEventListener('click' , handleButtonClick);

});


function openPopup(email) {
fetch('/view-profile', {
method: 'POST',
headers: { 
'Content-Type': 'application/json' 
},
body: JSON.stringify({ email: email })
})
.then(response => {
if (response.ok) {
// Redirect to profile page after successful response
window.location.href = '/profile'; // Adjust the path as needed
} else {
throw new Error('Network response was not ok');
}
})
.catch(error => {
console.error('Error:', error);
});

}

function toggleSubjectOptions() {
const container = document.getElementById('subjectContainer');
const inputField = document.getElementById('subject');

var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

// For larger screens, toggle the visibility of the checkbox list

if(forwho === "school"){

if (window.innerWidth > 768) {
// Show the container if hidden and hide it if shown
if (container.style.display === 'none' || container.style.display === '') {
container.style.display = 'block'; // Show container
inputField.readOnly = true; // Keep input read-only
} else {
container.style.display = 'none'; // Hide container
}
}

else {
// For small screens, toggle the visibility of the subject container
if (container.style.display === 'none' || container.style.display === '') {
// Show the container
container.style.display = 'block';
inputField.readOnly = false; // Allow typing in the input field
} else {
// Hide the container and enable typing
container.style.display = 'none';
inputField.readOnly = true; // Make input read-only when container is hidden
}
}

}
else{

if (window.innerWidth > 768) {
// Show the container if hidden and hide it if shown
if (container.style.display === 'none' || container.style.display === '') {
container.style.display = 'none'; // Show container
inputField.readOnly = false; // Keep input read-only
} else {
container.style.display = 'none'; // Hide container
}
}

else {
// For small screens, toggle the visibility of the subject container
if (container.style.display === 'none' || container.style.display === '') {
// Show the container
container.style.display = 'block';
inputField.readOnly = false; // Allow typing in the input field
} else {
// Hide the container and enable typing
container.style.display = 'none';
inputField.readOnly = true; // Make input read-only when container is hidden
}
}



}


}


function updateSubjects() {
const checkboxes = document.querySelectorAll('#subjectContainer input[type="checkbox"]');
const selectedSubjects = [];

checkboxes.forEach((checkbox) => {
if (checkbox.checked) {
selectedSubjects.push(checkbox.value);
}
});

document.getElementById('subject').value = selectedSubjects.join(', ');
}

function toggleReadOnly() {
const tutoringFor = document.getElementById('tutoring-for').value;
const studentName = document.getElementById('student-name');
const studentLastName = document.getElementById('student-last-name');
const studName = document.getElementById('stud-name');
const studLast = document.getElementById('stud-last');

var firstName = document.getElementById('first-name').value.trim();
var lastName = document.getElementById('last-name').value.trim();



const isMe = tutoringFor === 'me';

studentName.readOnly = isMe;
studentLastName.readOnly = isMe;
studName.readOnly = isMe;
studLast.readOnly = isMe;

// Optionally clear values if readOnly is set
if (isMe) {
studentName.value = firstName;
studentName.placeholder = firstName;
studentLastName.value = lastName;
studentLastName.placeholder = lastName;
studName.value = firstName;
studName.placeholder = firstName;
studLast.value = lastName;
studLast.placeholder = lastName;
}
else{

studentName.value = '';
studentName.placeholder = '';
studentLastName.value = '';
studentLastName.placeholder = '';
studName.value = '';
studName.placeholder = '';
studLast.value = '';
studLast.placeholder = '';

}


}


function checkPostgrad() {
const postgradRadio = document.getElementById('year-postgrad');
const postgradOptions = document.getElementById('postgrad-options');

if (postgradRadio.checked) {
postgradOptions.classList.remove('opt');
} else {
postgradOptions.classList.add('opt');
}
}

document.addEventListener("DOMContentLoaded", function() {
const countrySelect = document.getElementById("country");
const provinceGroup = document.getElementById("fProvince");

function toggleProvince() {
if (countrySelect.value === "South Africa") {
    provinceGroup.style.display = "block";
} else {
    provinceGroup.style.display = "none";
    document.getElementById("province").value = "";
}
}

toggleProvince();
countrySelect.addEventListener("change", toggleProvince);
});


/*ENCRYPTEMAIL*/

function simpleEncrypt(text) {
let shift = 3; // You can change this value to shift by more or less
let encrypted = '';

for (let i = 0; i < text.length; i++) {
let char = text.charCodeAt(i);

// Shift uppercase letters
if (char >= 65 && char <= 90) {
    char = ((char - 65 + shift) % 26) + 65;
}
// Shift lowercase letters
else if (char >= 97 && char <= 122) {
    char = ((char - 97 + shift) % 26) + 97;
}
// Shift numbers
else if (char >= 48 && char <= 57) {
    char = ((char - 48 + shift) % 10) + 48;
}

encrypted += String.fromCharCode(char);
}
return encrypted;
}

function encryptEmail(event, email, hiddenFieldId) {
// Prevent the form from submitting immediately
event.preventDefault();

// Encrypt the email
const encryptedEmail = simpleEncrypt(email);

// Set the encrypted email in the hidden input
document.getElementById(hiddenFieldId).value = encryptedEmail;

// Now submit the form
document.getElementById(hiddenFieldId).closest('form').submit();
}



function updateCountryCode() {
const countrySelect = document.getElementById("country");
const phoneInput = document.getElementById("phone");
const lengthMessage = document.getElementById("lengthMessage");
const phoneError = document.getElementById("phone-error");

// Get the selected option
const selectedOption = countrySelect.options[countrySelect.selectedIndex];
const code = selectedOption.getAttribute("data-code");
const length = selectedOption.getAttribute("data-length");

// Update the phone input with the country code and a space
phoneInput.value = code + " ";

// Update the message to display required length
lengthMessage.textContent = `Required length: ${length} digits (excluding code)`;
phoneError.textContent = ''; // Clear previous error message
}

function validatePhoneNumber() {
const phoneInput = document.getElementById("phone");
const countrySelect = document.getElementById("country");
const phoneError = document.getElementById("phone-error");

if (countrySelect.selectedIndex === 0) {
phoneError.textContent = ''; // Clear error if no country selected
return;
}

// Get the selected option's length
const selectedOption = countrySelect.options[countrySelect.selectedIndex];
const requiredLength = parseInt(selectedOption.getAttribute("data-length"), 10);

// Extract the digits entered after the country code
const phoneValue = phoneInput.value.trim();
const phoneDigits = phoneValue.slice(phoneValue.indexOf(" ") + 1).replace(/\D/g, ''); // Get only the digits

// Validate the phone number length
const actualLength = phoneDigits.length; // Actual length of entered digits
var phoneValid = false;

// Check if the entered digits match the required length
if (actualLength < requiredLength) {
phoneError.textContent = `Phone number must be exactly ${requiredLength} digits (excluding code).`;


} else if (actualLength > requiredLength) {
// If too long, prevent further input
phoneInput.value = phoneValue.slice(0, phoneValue.indexOf(" ") + requiredLength + 1); // Keep the code, space, and required digits


} else {

phoneValid = true;
phoneError.textContent = ''; // Clear error if valid
}

return phoneValid;

}

// Ensure the input maintains the format
document.getElementById("phone").addEventListener("input", (event) => {
const phoneInput = event.target;
const code = document.getElementById("country").options[document.getElementById("country").selectedIndex].getAttribute("data-code");

// If the current value doesn't start with the country code, reset it
if (!phoneInput.value.startsWith(code + " ")) {
phoneInput.value = code + " "; // Reset to include country code and space
}

// Move cursor to the end of the input
phoneInput.setSelectionRange(phoneInput.value.length, phoneInput.value.length);
});

function subscribeMethod() {
    var emailField = document.querySelector('input[name="email"]');

    
    if (!emailField.checkValidity()) {
       
        alert("Please enter a valid email address.");
        return false; 
    }

    
    alert("Thank you for subscribing, please check your emails.");
    return true; 
}


    function goBack() {
        window.history.back();
    }


    </script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!--=============== SWIPER JS ===============-->
    <script src="swiper-bundle.min.js"></script> 

    <!--=============== MAIN JS ===============-->
     <script src="main.js"></script> 


</body>
</html>
