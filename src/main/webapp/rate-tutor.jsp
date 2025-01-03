<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Booking" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Meta tags for character set and viewport -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review & Ratings | Apex Academic Tutors</title>
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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS (if any) -->
    <!--<link rel="stylesheet" href="css/non.css">-->
    <style>
        /* Custom styles for modal form */
.modal-body {
    max-width: 500px; /* Set a maximum width for the form */
    margin: auto; /* Center the form */
}

@media (max-width: 768px) {
    .modal-body {
        padding: 20px; /* Add padding on smaller screens */
    }
}

h1 {
    font-size: 1.5rem; /* Set font size for the heading */
    color: #333; /* Set heading color */
}

.form-control {
    transition: border-color 0.2s ease; /* Smooth border transition */
}

.form-control:focus {
    border-color: #5cb85c; /* Change border color on focus */
    box-shadow: 0 0 5px rgba(92, 184, 92, .5); /* Add shadow effect on focus */
}

.btn-success {
    background-color: #5cb85c; /* Bootstrap success color */
    border: none; /* Remove default border */
}

.btn-success:hover {
    background-color: #4cae4c; /* Darker green on hover */
}

    </style>
</head>
<body>

    <%

    // Retrieve the email attributes
    String tutorEmail  = (String) request.getAttribute("tutorEmail");

    %>

    <!-- Modal Structure -->
    <div id="bookingModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bookingModalLabel">Apex Academic Centre</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/add-review-ratings" method="post" class="p-4 border rounded shadow-sm bg-light" id="myForm">
                        <h1 class="mb-4 text-center">Submit Your Review</h1>
                        
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Names</label>
                            <input type="text" id="name" name="name" class="form-control" placeholder="Sihle Sithole" required>
                        </div>
                
                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <textarea id="message" name="message" class="form-control" placeholder="The best tutor ever" rows="3" required></textarea>
                        </div>
                
						<div class="mb-3">
						    <label for="ratings" class="form-label">Ratings</label>
						    <input type="number" id="ratings" name="ratings" class="form-control" placeholder="value between 1 and 5" min="1" max="5" required
						           inputmode="numeric" oninput="validateRatings(this)" />
						</div>
                
                        <input type="hidden" id="tutorEmail" name="tutorEmail" value="<%= tutorEmail %>" required>
                
                        <div class="mb-3 text-center">
                            <button class="btn btn-success" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
                
        </div>
    </div>



    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- JavaScript to show the modal automatically -->
    <script>
        $(document).ready(function() {
            // Show the modal when the page is ready
            $('#bookingModal').modal('show');
        });

        /*document.getElementById('myForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent the form from submitting normally
            window.location.href = '/'; // Redirect to the root URL
        });*/

		function validateRatings(input) {
		    const value = parseInt(input.value, 10);
		    if (value < 1) {
		        input.value = 1;
		    } else if (value > 5) {
		        input.value = 5;
		    }
		}
		
    </script>

</body>
</html>
