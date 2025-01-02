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
    <title>Book a Tutor | Expert Online and In-person Tutors | Apex Academic Centre</title>
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS (if any) -->


    <link rel="stylesheet" href="css/non.css">
</head>
<body>

    <%
    // Retrieve the Booking object from request attributes
    Booking book = (Booking) request.getAttribute("bookings");

    if (book != null) {

        Long entryId = book.getEntry();
        String name = book.getName();
        String surname = book.getSurname();
        String province = book.getProvince();
        String country = book.getCountry();
        String instrLanguage = book.getInstrLanguage();
        String address = book.getAddress();
        String suburb = book.getSuburb();

        String subject = book.getSubject();
        String tutorOpt = book.getTutorStyle();
        String packageType = book.getPackageType();
        String message = book.getMessage();

        String schName = book.getSchName();
        String schSurname = book.getSchSurname();
        String schGrade = book.getSchGrade();
        String schSyllabus = book.getSchSyllabus();

        String unName = book.getUnName();
        String unSurname = book.getUnSurname();
        String unYear = book.getUnYear();
        String status = book.getStatus();
        String tutorEmails = book.getTutorEmail();
        String email = book.getEmail();
        String phone = book.getPhone();

        String bQualification = book.getQualification() ;
        String bModule = book.getModule();
        String bSpecification = book.getSpecification();

    %>

    <!-- Modal Structure -->
    <div id="bookingModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bookingModalLabel">Booking Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <!-- Applicant Section -->
                        <div class="col-md-6">
                            <h5>Applicant</h5>
                            <p><strong>Name :</strong> <span id="modalName"><%= name %> </span></p>
                            <p><strong>Surname :</strong> <span id="modalEmail"><%= surname %></span></p>

                          <%
                          
                              if(tutorEmails.equals("apexexcellencetutors@gmail.com")){

                                 %>

                                 <p><strong>Phone :</strong> <span id="modalName"><%= phone %> </span></p>
                                 <p><strong>Email :</strong> <span id="modalEmail"><%= email %></span></p>

                                 <%

                              }

                          %>

                            <p><strong>Province :</strong> <span id="modalPhone"><%= province %></span></p>
                            <p><strong>Country :</strong> <span id="modalSubject"><%= country %></span></p>
                            <p><strong>Language of Instruction :</strong> <span id="modalTutoring"><%= instrLanguage %></span></p>

                            <% if(!address.equals("n/a")){
                                %>

                            <p><strong>When To Start :</strong> <span id="modalProvince"><%= address %></span></p>
                            <p><strong>Suburb :</strong> <span id="modalSuburb"><%= suburb %></span></p>
                      
                            <%
                        }
                        %>
                        </div>
                        <!-- Student Details Section -->
                        <div class="col-md-6">
                            <h5>Student Details</h5>

                            <% if(!schName.equals("n/a")){
                                 %>
                                 <p><strong>Student Name :</strong> <span id="modalTutoringFor"><%= schName %></span></p>
                                 <p><strong>Student Surname :</strong> <span id="modalHelpWith"><%= schSurname %></span></p>
                                 <p><strong> Grade:</strong> <span id="modalStudName"><%= schGrade %></span></p>
                                 <p><strong>Syllabus :</strong> <span id="modalStudSurname"><%= schSyllabus %></span></p>
                                 <p><strong>Subject:</strong> <span id="modalGrade"><%= subject %></span></p>
                               <%
                            }
                            else{

                                %>

                                <p><strong>Student Name :</strong> <span id="modalTutoringFor"><%= unName %></span></p>
                                <p><strong>Student Surname :</strong> <span id="modalHelpWith"><%= unSurname %></span></p>
                                <p><strong> Year:</strong> <span id="modalStudName"><%= unYear %></span></p>
                                <p><strong>Qualification:</strong> <span id="modalGrade"><%= bQualification %></span></p>
                                <p><strong>Module:</strong> <span id="modalGrade"><%= bModule %></span></p>
                                <p><strong>Specification of support:</strong> <span id="modalGrade"><%= bSpecification %></span></p>
                       
                              <%
                            }

                            %>
        
                        </div>
                    </div>
                    <!-- Message Section -->
                    <div class="row">
                        <div class="col-md-6">
                            <h5>Tutor</h5>
                            <p><strong>Tutoring Option :</strong> <span id="modalTutorName"><%= tutorOpt %></span></p>
                            <p><strong>package Type :</strong> <span id="modalTutorEmail"><%= packageType %></span></p>
                        </div>
                        <div class="col-md-6">
                            <h5>Progress</h5>
                            <% if(!message.equals("null")){
                                %>
                            <p><strong>Booking Message:</strong> <span id="modalMessage"><%= message %></span></p>

                            <% } %>
                            <p><strong>Status:</strong> <span id="modalStatus"><%= status %></span></p>
                            
                        </div>
                    </div>
                </div>
                <form action="/accept-booking" method="post">
                <div class="modal-footer">
                    <input type="hidden" id="accept-id" name="accept-id" value=' <%= entryId %> '/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <div class="col-sm-6 p-0 flex justify-content-lg-end justify-content-center">

                     <%
                         if(status.equals("approved")){

                            %>
                                <p>Booking approved...</p>
                            <%
                         } 

                            else{

                                %>

                                <button class="btn btn-success" type="submit">Accept</button>

                                <%
                            }

                         %> 
                   
                    </div>
                    
                </div>
                </form>
            </div>
        </div>
    </div>

    <%
        } else {
        %>
            <p>No booking details found.</p>
        <%
        }
        %>

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
    </script>

</body>
</html>
