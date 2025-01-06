<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
	<%@ page contentType="text/html;charset=UTF-8" language="java" %>
		<%@ page import="com.example.demo.model.Tutor" %>
			<%@ page import="com.example.demo.model.Booking" %>
				<%@ page import="com.example.demo.model.Review" %>
					<%@ page import="com.example.demo.model.OnlineClass" %>
					<%@ page import="com.example.demo.model.MathsClass" %>
						<%@ page import="java.util.List" %>
						<%@ page import="java.time.LocalDateTime" %>
							<%@ page import="java.time.format.DateTimeFormatter" %>
							<%@ page import="java.util.Base64" %>
							<%@ page import="java.text.SimpleDateFormat" %>

							<%@ page import="com.example.demo.model.BecomeTutor" %>

								<!doctype html>
								<html lang="en">

								<head>
									<!-- Required meta tags -->
									<meta charset="utf-8">
									<meta name="viewport"
										content="width=device-width, initial-scale=1, shrink-to-fit=no">
									<meta name="viewport"
										content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

									<title>Admin Dashboard</title>
									<!-- Bootstrap CSS -->
									<link rel="stylesheet" href="css/bootstrap.min.css">
									<!----css3---->
									<link rel="stylesheet" href="css/dashboard.css">

									<!--google fonts -->
									<link rel="preconnect" href="https://fonts.googleapis.com">
									<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
									<link
										href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
										rel="stylesheet">


									<!--google material icon-->
									<link href="https://fonts.googleapis.com/css2?family=Material+Icons"
										rel="stylesheet">
									<style>
										/* Hide the second form by default */
										#form2 {
											display: none;
										}

										.toUse{
											display: none;
										}

										/* Style for input fields on hover */
										input[type="text"]:hover,
										input[type="email"]:hover,
										input[type="tel"]:hover {
											border-color: rgb(128, 255, 255);
											/* Light blue border color */
										}

										/* Style for the button */
										input[type="button"],
										input[type="submit"] {
											background-color: rgb(128, 128, 128);
											/* Blue background color */
											color: white;
											/* White text color */
											padding: 10px 20px;
											/* Padding */
											border: none;
											/* Remove border */
											border-radius: 5px;
											/* Rounded corners */
											cursor: pointer;
											/* Cursor style */
										}

										/* Hover style for the button */
										/*  input[type="button"]:hover {
            background-color: rgb(128, 255, 255); /* Darker blue on hover */
										/* }*/

										.grid-container {
											display: grid;
											grid-template-columns: repeat(2, 1fr);
											/* Two columns layout */
											gap: 1rem;
											/* Space between items */
										}

										.mb-3 {
											margin-bottom: 1rem;
										}

										#fProvince {
											display: none;
											/* Hide province by default */
										}

										.green-link {
											color: #00a550;
											
										}

									</style>

								</head>

								<body>



									<div class="wrapper">

										<div class="body-overlay"></div>

										<!-------sidebar--design------------>

										<div id="sidebar">
											<div class="sidebar-header">
												<h3><span>APEX ACADEMIC CENTRE</span></h3>
											</div>
											<ul class="list-unstyled component m-0">
	
											<li class="dropdown active">
													<a href="#tutorsMenu" data-toggle="collapse" aria-expanded="false"
														class="dropdown-toggle">
														<i class="material-icons">dashboard</i><span>Tutors
														</span></a>
													<ul class="collapse list-unstyled menu" id="tutorsMenu">
														<li  id="tutors">
															<a href="#" class="dashboard"
																onclick="showTutorPanel(); return false;">Registered Tutors </a>
														</li>
														<li id="applicationsTutor">
															<a href="#" class="dashboard"
																onclick="showTutorsApplications(); return false;">
																Tutors applications
															</a>
														</li>

													</ul>
												</li>

												<li id="bookings">
													<a href="#" class="dashboard"
														onclick="showBookingsPanel(); return false;"><i
															class="material-icons">library_books</i>Pending Bookings
													</a>
												</li>

												<li id="blogs">
													<a href="#" class="dashboard"
														onclick="showApprovedPanel(); return false;">
														<i class="material-icons">check_circle</i>Approved Bookings
													</a>
												</li>

												<li class="dropdown">
													<a href="#pageSubmenu5" data-toggle="collapse" aria-expanded="false"
														class="dropdown-toggle">
														<i class="material-icons">border_color</i><span>Matric
															Re-Write</span></a>
													<ul class="collapse list-unstyled menu" id="pageSubmenu5">
														<li id="registered">
															<a href="#" class="dashboard"
																onclick="showRedisterMatricPanel(); return false;">
																Registered
															</a>
														</li>
														<li id="consultMatric">
															<a href="#" class="dashboard"
																onclick="showConsultMatricPanel(); return false;">
																Consultants
															</a>
														</li>

													</ul>
												</li>

												<li class="dropdown">
													<a href="#MathspageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
														<i class="material-icons">calculate</i><span>Maths Classes</span>
													</a>
													<ul class="collapse list-unstyled menu" id="MathspageSubmenu">
														<li id="registeredMaths">
															<a href="#" class="dashboard" onclick="showRedisterMathsClassesPanel(); return false;">
																Registered Maths Classes
															</a>
														</li>
														<li id="consultMaths">
															<a href="#" class="dashboard" onclick="showConsultMathsClassesPanel(); return false;">
																Consultants Maths Classes
															</a>
														</li>
													</ul>
												</li> 
												

												<li id="reviews">
													<a href="#" class="dashboard"
														onclick="showReviewsPanel(); return false;">
														<i class="material-icons">rate_review</i>Reviews
													</a>
												</li>

												<li id="consultants">
													<a href="#" class="dashboard"
														onclick="showConsultantsPanel(); return false;">
														<i class="material-icons">business_center</i>Consultants
													</a>
												</li>

												<li id="others">
													<a href="#" class="dashboard"
														onclick="showOthersPanel(); return false;">
														<i class="material-icons">help_outline</i>Others
													</a>
												</li>

											</ul>
										</div>

										<!-------sidebar--design- close----------->

										<!-------page-content start----------->

										<div id="content">

											<!------top-navbar-start----------->

											<div class="top-navbar">
												<div class="xd-topbar">
													<div class="row">
														<div
															class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
															<div class="xp-menubar">
																<span
																	class="material-icons text-white">signal_cellular_alt</span>
															</div>
														</div>

														<div class="col-md-5 col-lg-3 order-3 order-md-2">
															<div class="xp-searchbar">
																<form id="searchForm">
																	<div class="input-group">
																		<input type="search" class="form-control"
																			placeholder="Search by Email" name="email"
																			id="searchEemail" required>
																		<div class="input-group-append">
																			<button class="btn" type="button"
																				id="button-addon2"
																				onclick="searchTutor()">Go</button>
																		</div>
																	</div>
																</form>
															</div>
														</div>


														<div class="col-10 col-md-6 col-lg-8 order-1 order-md-3">
															<div class="xp-profilebar text-right">
																<nav class="navbar p-0">
																	<ul class="nav navbar-nav flex-row ml-auto">

																		<li class="dropdown nav-item">
																			<a class="nav-link" href="#"
																				data-toggle="dropdown">
																				<img src="image"
																					style="width:40px; border-radius:50%;" />
																				<span class="xp-user-live"></span>
																			</a>
																			<ul class="dropdown-menu small-menu">

																				<li><a href="/logout"
																						onclick="preventBackNavigation()">
																						<span
																							class="material-icons">logout</span>
																						Logout
																					</a></li>

																			</ul>
																		</li>


																	</ul>
																</nav>
															</div>
														</div>

													</div>

													<div class="xp-breadcrumbbar text-center">
														<h4 class="page-title">Dashboard</h4>
														<ol class="breadcrumb">
															<li class="breadcrumb-item"><a href="#">Apex</a></li>
															<li class="breadcrumb-item active" aria-curent="page">
																Dashboard</li>
														</ol>
													</div>


												</div>
											</div>
											<!------top-navbar-end----------->


											<!------main-content-start----------->

											<div class="main-content">
												<!--START HERE-->

												<div class="row" id="tutorPanel">
													<div class="col-md-12">
														<div class="table-wrapper">

															<div class="table-title">
																<div class="row">
																	<div
																		class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																		<h2 class="ml-lg-2">Tutors</h2>
																	</div>
																	<div
																		class="col-sm-6 p-0 flex justify-content-lg-end justify-content-center">
																		<a href="#addEmployeeModal"
																			class="btn btn-success" data-toggle="modal">
																			<i class="material-icons">&#xE147;</i>
																			<span>Add New Tutor</span>
																		</a>

																	</div>
																</div>
															</div>

															<table class="table table-striped table-hover">
																<thead>
																	<tr>
																		<th><span class="custom-checkbox">
																				<input type="checkbox" id="selectAll">
																				<label for="selectAll"></label></th>
																		<th>Name</th>
																		<th>Email</th>
																		<th>Teaching</th>
																		<th>Phone</th>
																		<th>Actions</th>
																	</tr>
																</thead>

																<tbody>

																	<% List<Tutor> tutors = (List<Tutor>)
																			request.getAttribute("tutors");
																			if (tutors != null && !tutors.isEmpty()) {
																			for (Tutor tutor : tutors) {

																			String email = tutor.getEmail();
																			String name = tutor.getFullNames();
																			String surname = tutor.getSurname();
																			String availability =
																			tutor.getAvailability();
																			String phone = tutor.getPhoneNumber();
																			String subjects = tutor.getSubjects();
																			String grades = tutor.getGrades();
																			String address = tutor.getAddress();
																			String bio = tutor.getBio();
																			String about = tutor.getAbout();
																			String hours = tutor.getHoursTutored();
																			byte[] image = tutor.getImage();
																			String syllabus = tutor.getSyllabus();
																			String area = tutor.getArea();
																			String country = tutor.getCountry();

																			%>

																			<tr>
																				<th><span class="custom-checkbox">
																						<input type="checkbox"
																							id="checkbox1"
																							name="option[]" value="1">
																						<label for="checkbox1"></label>
																				</th>
																				<th>
																					<%=tutor.getFullNames()%>
																				</th>
																				<th>
																					<%=tutor.getEmail()%>
																				</th>
																				<th>
																					<%=tutor.getAvailability()%>
																				</th>
																				<th>
																					<%=tutor.getPhoneNumber()%>
																				</th>
																				<th>

																					<a href="#editEmployeeModal"
																						class="edit" data-toggle="modal"
																						data-name="<%= name %>"
																						data-surname="<%= surname %>"
																						data-email="<%= email %>"
																						data-availability="<%= availability %>"
																						data-phone="<%= phone %>"
																						data-subjects="<%= subjects %>"
																						data-grades="<%= grades %>"
																						data-address="<%= address %>"
																						data-bio="<%= bio %>"
																						data-about="<%= about %>"
																						data-hours="<%= hours %>"
																						data-country="<%= country %>"
																						data-image="<%= image %>"
																						data-syllabus="<%= syllabus %>"
																						data-area="<%= area %>">
																						<i class="material-icons"
																							data-toggle="tooltip"
																							title="Edit">&#xE254;</i>
																					</a>

																					<a href="#deleteEmployeeModal"
																						class="delete"
																						data-toggle="modal"
																						data-email="<%= email %>">
																						<i class="material-icons"
																							data-toggle="tooltip"
																							title="Delete">&#xE872;</i>
																					</a>

																				</th>
																			</tr>

																			<% } } else { %>
																				<tr>
																					<th>No Tutor yet..</th>
																				</tr>
																				<% } %>

																</tbody>
															</table>
														</div>
													</div>

													<!--END HERE-->

													<!----add-modal start--------->
													<div class="modal fade" tabindex="-1" id="addEmployeeModal"
														role="dialog">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">Add Tutor</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<!-- Form 1 -->
																	<form id="form1" class="p-4 border rounded">
																		<h1 class="mb-4"></h1>
																		<div class="grid-container">
																			<div class="mb-3">
																				<label for="name">Name</label>
																				<input type="text" id="name" name="name"
																					class="form-control"
																					placeholder="Bongi">
																				<div id="nameError"
																					class="error-message"></div>
																			</div>

																			<div class="mb-3">
																				<label for="name">Surname</label>
																				<input type="text" id="lsurname"
																					name="lsurname" class="form-control"
																					placeholder="Mabhena" required>
																				<div id="lSurnameError"
																					class="error-message"></div>
																			</div>

																			<div class="mb-3">
																				<label for="idnumber">Date of
																					Birth</label>
																				<input type="date" id="idnumber"
																					name="idnumber" class="form-control"
																					required>
																				<div id="idError" class="error-message">
																				</div>
																			</div>



																			<div class="mb-3">
																				<label
																					for="experience">Experience</label>
																				<input type="experience" id="experience"
																					name="experience"
																					class="form-control"
																					placeholder="Enter the year you started tutoring "
																					required>
																				<div id="experienceError"
																					class="error-message"></div>
																			</div>


																			<div class="mb-3">
																				<label for="email">Email Address</label>
																				<input type="email" id="email"
																					name="email" class="form-control"
																					placeholder="Email" required>
																				<div id="emailError"
																					class="error-message"></div>
																			</div>

																			<div class="mb-3">
																				<label for="background">Background
																					check</label>
																				<select id="background"
																					name="background"
																					class="form-control" required>
																					<option value="No">No</option>
																					<option value="Yes">Yes</option>
																				</select>
																				<div id="backError"
																					class="error-message"></div>
																			</div>

																			<div class="mb-3">
																				<label for="country">Country</label>
																				<select id="country" name="country"
																					class="form-control" required
																					onchange="updateCountryCode()">
																					<option value="" disabled selected>
																						Select your country</option>
																					<option value="Afghanistan"
																						data-code="+93">Afghanistan
																					</option>
																					<option value="Albania"
																						data-code="+355">Albania
																					</option>
																					<option value="Algeria"
																						data-code="+213">Algeria
																					</option>
																					<option value="Andorra"
																						data-code="+376">Andorra
																					</option>
																					<option value="Angola"
																						data-code="+244">Angola</option>
																					<option value="Antigua and Barbuda"
																						data-code="+1-268">Antigua and
																						Barbuda</option>
																					<option value="Argentina"
																						data-code="+54">Argentina
																					</option>
																					<option value="Armenia"
																						data-code="+374">Armenia
																					</option>
																					<option value="Australia"
																						data-code="+61">Australia
																					</option>
																					<option value="Austria"
																						data-code="+43">Austria</option>
																					<option value="Azerbaijan"
																						data-code="+994">Azerbaijan
																					</option>
																					<option value="Bahamas"
																						data-code="+1-242">Bahamas
																					</option>
																					<option value="Bahrain"
																						data-code="+973">Bahrain
																					</option>
																					<option value="Bangladesh"
																						data-code="+880">Bangladesh
																					</option>
																					<option value="Barbados"
																						data-code="+1-246">Barbados
																					</option>
																					<option value="Belarus"
																						data-code="+375">Belarus
																					</option>
																					<option value="Belgium"
																						data-code="+32">Belgium</option>
																					<option value="Belize"
																						data-code="+501">Belize</option>
																					<option value="Benin"
																						data-code="+229">Benin</option>
																					<option value="Bhutan"
																						data-code="+975">Bhutan</option>
																					<option value="Bolivia"
																						data-code="+591">Bolivia
																					</option>
																					<option
																						value="Bosnia and Herzegovina"
																						data-code="+387">Bosnia and
																						Herzegovina</option>
																					<option value="Botswana"
																						data-code="+267">Botswana
																					</option>
																					<option value="Brazil"
																						data-code="+55">Brazil</option>
																					<option value="Brunei"
																						data-code="+673">Brunei</option>
																					<option value="Bulgaria"
																						data-code="+359">Bulgaria
																					</option>
																					<option value="Burkina Faso"
																						data-code="+226">Burkina Faso
																					</option>
																					<option value="Burundi"
																						data-code="+257">Burundi
																					</option>
																					<option value="Cabo Verde"
																						data-code="+238">Cabo Verde
																					</option>
																					<option value="Cambodia"
																						data-code="+855">Cambodia
																					</option>
																					<option value="Cameroon"
																						data-code="+237">Cameroon
																					</option>
																					<option value="Canada"
																						data-code="+1">Canada</option>
																					<option
																						value="Central African Republic"
																						data-code="+236">Central African
																						Republic</option>
																					<option value="Chad"
																						data-code="+235">Chad</option>
																					<option value="Chile"
																						data-code="+56">Chile</option>
																					<option value="China"
																						data-code="+86">China</option>
																					<option value="Colombia"
																						data-code="+57">Colombia
																					</option>
																					<option value="Comoros"
																						data-code="+269">Comoros
																					</option>
																					<option
																						value="Congo (Congo-Brazzaville)"
																						data-code="+242">Congo
																						(Congo-Brazzaville)</option>
																					<option value="Costa Rica"
																						data-code="+506">Costa Rica
																					</option>
																					<option value="Croatia"
																						data-code="+385">Croatia
																					</option>
																					<option value="Cuba"
																						data-code="+53">Cuba</option>
																					<option value="Cyprus"
																						data-code="+357">Cyprus</option>
																					<option
																						value="Czechia (Czech Republic)"
																						data-code="+420">Czechia (Czech
																						Republic)</option>
																					<option
																						value="Democratic Republic of the Congo"
																						data-code="+243">Democratic
																						Republic of the Congo</option>
																					<option value="Denmark"
																						data-code="+45">Denmark</option>
																					<option value="Djibouti"
																						data-code="+253">Djibouti
																					</option>
																					<option value="Dominica"
																						data-code="+1-767">Dominica
																					</option>
																					<option value="Dominican Republic"
																						data-code="+1-809">Dominican
																						Republic</option>
																					<option value="Ecuador"
																						data-code="+593">Ecuador
																					</option>
																					<option value="Egypt"
																						data-code="+20">Egypt</option>
																					<option value="El Salvador"
																						data-code="+503">El Salvador
																					</option>
																					<option value="Equatorial Guinea"
																						data-code="+240">Equatorial
																						Guinea</option>
																					<option value="Eritrea"
																						data-code="+291">Eritrea
																					</option>
																					<option value="Estonia"
																						data-code="+372">Estonia
																					</option>
																					<option value="Eswatini"
																						data-code="+268">Eswatini
																					</option>
																					<option value="Ethiopia"
																						data-code="+251">Ethiopia
																					</option>
																					<option value="Fiji"
																						data-code="+679">Fiji</option>
																					<option value="Finland"
																						data-code="+358">Finland
																					</option>
																					<option value="France"
																						data-code="+33">France</option>
																					<option value="Gabon"
																						data-code="+241">Gabon</option>
																					<option value="Gambia"
																						data-code="+220">Gambia</option>
																					<option value="Georgia"
																						data-code="+995">Georgia
																					</option>
																					<option value="Germany"
																						data-code="+49">Germany</option>
																					<option value="Ghana"
																						data-code="+233">Ghana</option>
																					<option value="Greece"
																						data-code="+30">Greece</option>
																					<option value="Grenada"
																						data-code="+1-473">Grenada
																					</option>
																					<option value="Guatemala"
																						data-code="+502">Guatemala
																					</option>
																					<option value="Guinea"
																						data-code="+224">Guinea</option>
																					<option value="Guinea-Bissau"
																						data-code="+245">Guinea-Bissau
																					</option>
																					<option value="Guyana"
																						data-code="+592">Guyana</option>
																					<option value="Haiti"
																						data-code="+509">Haiti</option>
																					<option value="Honduras"
																						data-code="+504">Honduras
																					</option>
																					<option value="Hungary"
																						data-code="+36">Hungary</option>
																					<option value="Iceland"
																						data-code="+354">Iceland
																					</option>
																					<option value="India"
																						data-code="+91">India</option>
																					<option value="Indonesia"
																						data-code="+62">Indonesia
																					</option>
																					<option value="Iran"
																						data-code="+98">Iran</option>
																					<option value="Iraq"
																						data-code="+964">Iraq</option>
																					<option value="Ireland"
																						data-code="+353">Ireland
																					</option>
																					<option value="Israel"
																						data-code="+972">Israel</option>
																					<option value="Italy"
																						data-code="+39">Italy</option>
																					<option value="Jamaica"
																						data-code="+1-876">Jamaica
																					</option>
																					<option value="Japan"
																						data-code="+81">Japan</option>
																					<option value="Jordan"
																						data-code="+962">Jordan</option>
																					<option value="Kazakhstan"
																						data-code="+7">Kazakhstan
																					</option>
																					<option value="Kenya"
																						data-code="+254">Kenya</option>
																					<option value="Kiribati"
																						data-code="+686">Kiribati
																					</option>
																					<option value="Korea, North"
																						data-code="+850">Korea, North
																					</option>
																					<option value="Korea, South"
																						data-code="+82">Korea, South
																					</option>
																					<option value="Kosovo"
																						data-code="+383">Kosovo</option>
																					<option value="Kuwait"
																						data-code="+965">Kuwait</option>
																					<option value="Kyrgyzstan"
																						data-code="+996">Kyrgyzstan
																					</option>
																					<option value="Laos"
																						data-code="+856">Laos</option>
																					<option value="Latvia"
																						data-code="+371">Latvia</option>
																					<option value="Lebanon"
																						data-code="+961">Lebanon
																					</option>
																					<option value="Lesotho"
																						data-code="+266">Lesotho
																					</option>
																					<option value="Liberia"
																						data-code="+231">Liberia
																					</option>
																					<option value="Libya"
																						data-code="+218">Libya</option>
																					<option value="Liechtenstein"
																						data-code="+423">Liechtenstein
																					</option>
																					<option value="Lithuania"
																						data-code="+370">Lithuania
																					</option>
																					<option value="Luxembourg"
																						data-code="+352">Luxembourg
																					</option>
																					<option value="Madagascar"
																						data-code="+261">Madagascar
																					</option>
																					<option value="Malawi"
																						data-code="+265">Malawi</option>
																					<option value="Malaysia"
																						data-code="+60">Malaysia
																					</option>
																					<option value="Maldives"
																						data-code="+960">Maldives
																					</option>
																					<option value="Mali"
																						data-code="+223">Mali</option>
																					<option value="Malta"
																						data-code="+356">Malta</option>
																					<option value="Marshall Islands"
																						data-code="+692">Marshall
																						Islands</option>
																					<option value="Mauritania"
																						data-code="+222">Mauritania
																					</option>
																					<option value="Mauritius"
																						data-code="+230">Mauritius
																					</option>
																					<option value="Mexico"
																						data-code="+52">Mexico</option>
																					<option value="Micronesia"
																						data-code="+691">Micronesia
																					</option>
																					<option value="Moldova"
																						data-code="+373">Moldova
																					</option>
																					<option value="Monaco"
																						data-code="+377">Monaco</option>
																					<option value="Mongolia"
																						data-code="+976">Mongolia
																					</option>
																					<option value="Montenegro"
																						data-code="+382">Montenegro
																					</option>
																					<option value="Morocco"
																						data-code="+212">Morocco
																					</option>
																					<option value="Mozambique"
																						data-code="+258">Mozambique
																					</option>
																					<option value="Myanmar (Burma)"
																						data-code="+95">Myanmar (Burma)
																					</option>
																					<option value="Namibia"
																						data-code="+264">Namibia
																					</option>
																					<option value="Nauru"
																						data-code="+674">Nauru</option>
																					<option value="Nepal"
																						data-code="+977">Nepal</option>
																					<option value="Netherlands"
																						data-code="+31">Netherlands
																					</option>
																					<option value="New Zealand"
																						data-code="+64">New Zealand
																					</option>
																					<option value="Nicaragua"
																						data-code="+505">Nicaragua
																					</option>
																					<option value="Niger"
																						data-code="+227">Niger</option>
																					<option value="Nigeria"
																						data-code="+234">Nigeria
																					</option>
																					<option value="North Macedonia"
																						data-code="+389">North Macedonia
																					</option>
																					<option value="Norway"
																						data-code="+47">Norway</option>
																					<option value="Oman"
																						data-code="+968">Oman</option>
																					<option value="Pakistan"
																						data-code="+92">Pakistan
																					</option>
																					<option value="Palau"
																						data-code="+680">Palau</option>
																					<option value="Panama"
																						data-code="+507">Panama</option>
																					<option value="Papua New Guinea"
																						data-code="+675">Papua New
																						Guinea</option>
																					<option value="Paraguay"
																						data-code="+595">Paraguay
																					</option>
																					<option value="Peru"
																						data-code="+51">Peru</option>
																					<option value="Philippines"
																						data-code="+63">Philippines
																					</option>
																					<option value="Poland"
																						data-code="+48">Poland</option>
																					<option value="Portugal"
																						data-code="+351">Portugal
																					</option>
																					<option value="Qatar"
																						data-code="+974">Qatar</option>
																					<option value="Romania"
																						data-code="+40">Romania</option>
																					<option value="Russia"
																						data-code="+7">Russia</option>
																					<option value="Rwanda"
																						data-code="+250">Rwanda</option>
																					<option
																						value="Saint Kitts and Nevis"
																						data-code="+1-869">Saint Kitts
																						and Nevis</option>
																					<option value="Saint Lucia"
																						data-code="+1-758">Saint Lucia
																					</option>
																					<option
																						value="Saint Vincent and the Grenadines"
																						data-code="+1-784">Saint Vincent
																						and the Grenadines</option>
																					<option value="Samoa"
																						data-code="+685">Samoa</option>
																					<option value="San Marino"
																						data-code="+378">San Marino
																					</option>
																					<option
																						value="Sao Tome and Principe"
																						data-code="+239">Sao Tome and
																						Principe</option>
																					<option value="Saudi Arabia"
																						data-code="+966">Saudi Arabia
																					</option>
																					<option value="Senegal"
																						data-code="+221">Senegal
																					</option>
																					<option value="Serbia"
																						data-code="+381">Serbia</option>
																					<option value="Seychelles"
																						data-code="+248">Seychelles
																					</option>
																					<option value="Sierra Leone"
																						data-code="+232">Sierra Leone
																					</option>
																					<option value="Singapore"
																						data-code="+65">Singapore
																					</option>
																					<option value="Slovakia"
																						data-code="+421">Slovakia
																					</option>
																					<option value="Slovenia"
																						data-code="+386">Slovenia
																					</option>
																					<option value="Solomon Islands"
																						data-code="+677">Solomon Islands
																					</option>
																					<option value="Somalia"
																						data-code="+252">Somalia
																					</option>
																					<option value="South Africa"
																						data-code="+27">South Africa
																					</option>
																					<option value="South Sudan"
																						data-code="+211">South Sudan
																					</option>
																					<option value="Spain"
																						data-code="+34">Spain</option>
																					<option value="Sri Lanka"
																						data-code="+94">Sri Lanka
																					</option>
																					<option value="Sudan"
																						data-code="+249">Sudan</option>
																					<option value="Suriname"
																						data-code="+597">Suriname
																					</option>
																					<option value="Sweden"
																						data-code="+46">Sweden</option>
																					<option value="Switzerland"
																						data-code="+41">Switzerland
																					</option>
																					<option value="Syria"
																						data-code="+963">Syria</option>
																					<option value="Taiwan"
																						data-code="+886">Taiwan</option>
																					<option value="Tajikistan"
																						data-code="+992">Tajikistan
																					</option>
																					<option value="Tanzania"
																						data-code="+255">Tanzania
																					</option>
																					<option value="Thailand"
																						data-code="+66">Thailand
																					</option>
																					<option value="Togo"
																						data-code="+228">Togo</option>
																					<option value="Tonga"
																						data-code="+676">Tonga</option>
																					<option value="Trinidad and Tobago"
																						data-code="+1-868">Trinidad and
																						Tobago</option>
																					<option value="Tunisia"
																						data-code="+216">Tunisia
																					</option>
																					<option value="Turkey"
																						data-code="+90">Turkey</option>
																					<option value="Turkmenistan"
																						data-code="+993">Turkmenistan
																					</option>
																					<option value="Tuvalu"
																						data-code="+688">Tuvalu</option>
																					<option value="Uganda"
																						data-code="+256">Uganda</option>
																					<option value="Ukraine"
																						data-code="+380">Ukraine
																					</option>
																					<option value="United Arab Emirates"
																						data-code="+971">United Arab
																						Emirates</option>
																					<option value="United Kingdom"
																						data-code="+44">United Kingdom
																					</option>
																					<option
																						value="United States of America"
																						data-code="+1">United States of
																						America</option>
																					<option value="Uruguay"
																						data-code="+598">Uruguay
																					</option>
																					<option value="Uzbekistan"
																						data-code="+998">Uzbekistan
																					</option>
																					<option value="Vanuatu"
																						data-code="+678">Vanuatu
																					</option>
																					<option value="Vatican City"
																						data-code="+39">Vatican City
																					</option>
																					<option value="Venezuela"
																						data-code="+58">Venezuela
																					</option>
																					<option value="Vietnam"
																						data-code="+84">Vietnam</option>
																					<option value="Yemen"
																						data-code="+967">Yemen</option>
																					<option value="Zambia"
																						data-code="+260">Zambia</option>
																					<option value="Zimbabwe"
																						data-code="+263">Zimbabwe
																					</option>
																				</select>
																				<div id="countryError"
																					class="error-message"></div>
																			</div>


																			<div class="mb-3">
																				<label for="phone">Phone Number</label>
																				<input type="text" id="phone"
																					name="phone" class="form-control"
																					placeholder="0712345678" required>
																				<div id="phoneError"
																					class="error-message"></div>
																			</div>




																			<div class="mb-3" id="fProvince">
																				<label for="address">Province</label>
																				<select id="address" name="address"
																					class="form-control" required>
																					<option value="" disabled selected>
																						Select your province</option>
																					<option value="Limpopo">Limpopo
																					</option>
																					<option value="Gauteng">Gauteng
																					</option>
																					<option value="Free State">Free
																						State</option>
																					<option value="North West">North
																						West</option>
																					<option value="Northern Cape">
																						Northern Cape</option>
																					<option value="Eastern Cape">Eastern
																						Cape</option>
																					<option value="KwaZulu Natal">
																						KwaZulu Natal</option>
																					<option value="Mpumalanga">
																						Mpumalanga</option>
																					<option value="Western Cape">Western
																						Cape</option>
																				</select>
																				<div id="addressError"
																					class="error-message"></div>
																			</div>
																		</div>

																		<input type="button" value="Next"
																			class="btn btn-primary"
																			onclick="validateForm1()">


																	</form>


																	<!-- Form 2 -->
																	<form id="form2" class="p-4 border rounded">
																		<h1 class="mb-4"></h1>
																		<div class="mb-3">
																			<label>
																				<input type="checkbox" name="university"
																					value="yes" id="universityCheckbox">
																				Do you tutor University Students?
																			</label>
																			<div class="modules" id="modulesDiv"
																				style="display: none;">
																				<label for="unsubjects">Modules
																					(Separate in Comma)</label>
																				<input type="text" id="unSubjects"
																					name="unSubjects"
																					class="form-control" required>
																				<div id="unError" class="error-message">
																				</div>
																			</div>
																		</div>
																		<div class="mb-3">
																			<label for="subject">School
																				Subjects(Seperate by Comma)</label>
																			<input type="text" id="subjects"
																				name="subjects" class="form-control"
																				required>
																			<div id="subjectError"
																				class="error-message"></div>
																		</div>

																		<div class="mb-3">
																			<label for="grades">Select Grades</label>
																			<input type="text" id="grades" name="grades"
																				class="form-control" required readonly
																				onclick="toggleCheckboxes()">
																			<div id="gradesContainer"
																				style="display: none;">
																				<label><input type="checkbox"
																						value="GRD:R"
																						onchange="updateGrades()">
																					R</label>
																				<label><input type="checkbox"
																						value="GRD:1"
																						onchange="updateGrades()">
																					1</label>
																				<label><input type="checkbox"
																						value="GRD:2"
																						onchange="updateGrades()">
																					2</label>
																				<label><input type="checkbox"
																						value="GRD:3"
																						onchange="updateGrades()">
																					3</label>
																				<label><input type="checkbox"
																						value="GRD:4"
																						onchange="updateGrades()">
																					4</label>
																				<label><input type="checkbox"
																						value="GRD:5"
																						onchange="updateGrades()">
																					5</label>
																				<label><input type="checkbox"
																						value="GRD:6"
																						onchange="updateGrades()">
																					6</label>
																				<label><input type="checkbox"
																						value="GRD:7"
																						onchange="updateGrades()">
																					7</label>
																				<label><input type="checkbox"
																						value="GRD:8"
																						onchange="updateGrades()">
																					8</label>
																				<label><input type="checkbox"
																						value="GRD:9"
																						onchange="updateGrades()">
																					9</label>
																				<label><input type="checkbox"
																						value="GRD:10"
																						onchange="updateGrades()">
																					10</label>
																				<label><input type="checkbox"
																						value="GRD:11"
																						onchange="updateGrades()">
																					11</label>
																				<label><input type="checkbox"
																						value="GRD:12"
																						onchange="updateGrades()">
																					12</label>
																			</div>
																			<div id="gradesError" class="error-message">
																			</div>
																		</div>

																		<div class="mb-3">
																			<label for="syllabus">Select
																				Syllabus</label>
																			<input type="text" id="syllabus"
																				name="syllabus" class="form-control"
																				required readonly
																				onclick="toggleSyllabusOptions()">
																			<div id="syllabusContainer"
																				style="display: none;">
																				<label><input type="checkbox"
																						value="CAPs"
																						onchange="updateSyllabus()">
																					CAPs</label>
																				<label><input type="checkbox"
																						value="IEB"
																						onchange="updateSyllabus()">
																					IEB</label>
																				<label><input type="checkbox" value="IB"
																						onchange="updateSyllabus()">
																					IB</label>
																				<label><input type="checkbox"
																						value="Cambridge"
																						onchange="updateSyllabus()">
																					Cambridge</label>
																				<label><input type="checkbox"
																						value="Pearson Edexcel"
																						onchange="updateSyllabus()">
																					Pearson Edexcel</label>
																			</div>
																			<div id="syllabusError"
																				class="error-message"></div>
																		</div>

																		<div class="mb-3">
																			<label for="tutorOptions">Tutoring
																				Options</label>
																			<select id="tutorOptions"
																				name="tutorOptions" class="form-control"
																				required
																				aria-placeholder="Tutoring Options">
																				<option value="Online">Online</option>
																				<option value="In person">In person
																				</option>
																				<option value="Online / In person">
																					Online &
																					In person</option>
																			</select>
																		</div>

																		<div class="mb-3">
																			<label for="area">Area</label>
																			<input type="text" id="area" name="area"
																				class="form-control" required>
																			<div id="areaError" class="error-message">
																			</div>
																		</div>

																		<input type="button" value="Previous"
																			class="btn btn-secondary"
																			onclick="displayForm1()">
																		<button type="button" class="btn btn-secondary"
																			onclick="validateForm2()">Next</button>

																	</form>

																	<!-- Form 3 -->
																	<form id="form3" class="p-4 border rounded"
																		enctype="multipart/form-data">
																		<h1 class="mb-4"></h1>
																		<div class="mb-3">
																			<label for="about">About Tutor</label>
																			<input type="text" id="about" name="about"
																				class="form-control"
																				style="height: 150px;" required />

																		</div>

																		<div class="mb-3">
																			<label for="hours">Bio</label>
																			<input type="text" id="hours" name="hours"
																				class="form-control"
																				style="height: 150px;" required />
																		</div>

																		<div class="mb-3">
																			<label for="bio">Qualification(Separate in
																				Comma)</label>
																			<input type="text" id="bio" name="bio"
																				class="form-control"
																				style="height: 150px;" required>

																		</div>

																		<div class="mb-3">
																			<label for="profile">Profile Picture</label>
																			<input type="file" id="profile"
																				name="profile" class="form-control">
																		</div>

																		<div class="mb-3">
																			<input type="hidden" id="hiddenName"
																				name="hiddenName" class="form-control">
																			<input type="hidden" id="hiddenSurname"
																				name="hiddenSurname"
																				class="form-control">
																			<input type="hidden" id="hiddenModules"
																				name="hiddenModules"
																				class="form-control">
																			<input type="hidden" id="hiddenID"
																				name="hiddenID" class="form-control">
																			<input type="hidden" id="hiddenIdentity"
																				name="hiddenIdentity"
																				class="form-control">
																			<input type="hidden" id="hiddenEmail"
																				name="hiddenEmail" class="form-control">
																			<input type="hidden" id="hiddenPhone"
																				name="hiddenPhone" class="form-control">
																			<input type="hidden" id="hiddenSubjects"
																				name="hiddenSubjects"
																				class="form-control">
																			<input type="hidden" id="hiddenGrades"
																				name="hiddenGrades"
																				class="form-control">
																			<input type="hidden" id="hiddenSyllabus"
																				name="hiddenSyllabus"
																				class="form-control">
																			<input type="hidden" id="tutorOption"
																				name="tutorOption" class="form-control">
																			<input type="hidden" id="hiddenAddress"
																				name="hiddenAddress"
																				class="form-control">
																			<input type="hidden" id="hiddenArea"
																				name="hiddenArea" class="form-control">
																			<input type="hidden" id="hiddenCountry"
																				name="hiddenCountry"
																				class="form-control">
																			<input type="hidden" id="hiddenExp"
																				name="hiddenExp" class="form-control">
																		</div>

																		<input type="button" value="Previous"
																			class="btn btn-secondary"
																			onclick="displayForm2()">
																		<button type="submit"
																			class="btn btn-success">Send</button>

																	</form>
																</div>

															</div>
														</div>
													</div>

													<!----edit-modal end--------->


													<!----edit-modal start--------->
													<div class="modal fade" tabindex="-1" id="editEmployeeModal"
														role="dialog">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">Edit Tutor</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>

																<div class="modal-body">
																	<!--START HERE-->
																	<!-- Form 1 -->
																	<form id="editform1" class="p-4 border rounded">
																		<h1 class="mb-4"></h1>


																		<div class="mb-3">
																			<label for="name">Name</label>
																			<input type="text" id="editname"
																				name="editname" class="form-control"
																				placeholder="Name">
																			<div id="editnameError"
																				class="error-message"></div>
																		</div>

																		<div class="mb-3">
																			<label for="surname">Surname</label>
																			<input type="text" id="editsurname"
																				name="editsurname" class="form-control"
																				placeholder="Surname" required>
																			<div id="editsurnameError"
																				class="error-message"></div>
																		</div>

																		<div class="mb-3">
																			<label for="idnumber">Date of Birth</label>
																			<input type="date" id="idnumber"
																				name="idnumber" class="form-control"
																				required>
																			<div id="idError" class="error-message">
																			</div>
																		</div>


																		<div class="mb-3">
																			<label for="phone">Phone Number</label>
																			<input type="text" id="editphone"
																				name="editphone" class="form-control"
																				required>
																			<div id="editphoneError"
																				class="error-message"></div>
																		</div>




																		<div class="mb-3">
																			<label for="email">Email Address</label>
																			<input type="editemail" id="editemail"
																				name="editemail" class="form-control"
																				placeholder="Email" required readonly>
																			<div id="editemailError"
																				class="error-message"></div>
																		</div>

																		

																		<div class="mb-3">
																			<label for="editcountry">Country</label>
																			<select id="editcountry" name="editcountry"
																				class="form-control" required onchange="toggleProvinceVisibility()">
																				<option value="" disabled selected>Select your Country</option>
																			<option value="South Africa" data-code="+27" data-length="10">South Africa
																			</option>
																			<option value="Afghanistan" data-code="+93" data-length="9">Afghanistan</option>
																			<option value="Albania" data-code="+355" data-length="8">Albania</option>
																			<option value="Algeria" data-code="+213" data-length="9">Algeria</option>
																			<option value="Andorra" data-code="+376" data-length="6">Andorra</option>
																			<option value="Angola" data-code="+244" data-length="9">Angola</option>
																			<option value="Antigua and Barbuda" data-code="+1-268" data-length="7">Antigua
																				and Barbuda</option>
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
																			<option value="Bosnia and Herzegovina" data-code="+387" data-length="8">Bosnia
																				and Herzegovina</option>
																			<option value="Botswana" data-code="+267" data-length="7">Botswana</option>
																			<option value="Brazil" data-code="+55" data-length="11">Brazil</option>
																			<option value="Brunei" data-code="+673" data-length="7">Brunei</option>
																			<option value="Bulgaria" data-code="+359" data-length="8">Bulgaria</option>
																			<option value="Burkina Faso" data-code="+226" data-length="8">Burkina Faso
																			</option>
																			<option value="Burundi" data-code="+257" data-length="8">Burundi</option>
																			<option value="Cabo Verde" data-code="+238" data-length="7">Cabo Verde</option>
																			<option value="Cambodia" data-code="+855" data-length="8">Cambodia</option>
																			<option value="Cameroon" data-code="+237" data-length="9">Cameroon</option>
																			<option value="Canada" data-code="+1" data-length="10">Canada</option>
																			<option value="Central African Republic" data-code="+236" data-length="8">
																				Central African Republic</option>
																			<option value="Chad" data-code="+235" data-length="8">Chad</option>
																			<option value="Chile" data-code="+56" data-length="9">Chile</option>
																			<option value="China" data-code="+86" data-length="11">China</option>
																			<option value="Colombia" data-code="+57" data-length="10">Colombia</option>
																			<option value="Comoros" data-code="+269" data-length="7">Comoros</option>
																			<option value="Congo (Congo-Brazzaville)" data-code="+242" data-length="8">Congo
																				(Congo-Brazzaville)</option>
																			<option value="Costa Rica" data-code="+506" data-length="8">Costa Rica</option>
																			<option value="Croatia" data-code="+385" data-length="9">Croatia</option>
																			<option value="Cuba" data-code="+53" data-length="8">Cuba</option>
																			<option value="Cyprus" data-code="+357" data-length="8">Cyprus</option>
																			<option value="Czechia (Czech Republic)" data-code="+420" data-length="9">
																				Czechia (Czech Republic)</option>
																			<option value="Democratic Republic of the Congo" data-code="+243"
																				data-length="9">Democratic Republic of the Congo</option>
																			<option value="Denmark" data-code="+45" data-length="8">Denmark</option>
																			<option value="Djibouti" data-code="+253" data-length="6">Djibouti</option>
																			<option value="Dominica" data-code="+1-767" data-length="7">Dominica</option>
																			<option value="Dominican Republic" data-code="+1-809" data-length="10">Dominican
																				Republic</option>
																			<option value="Ecuador" data-code="+593" data-length="9">Ecuador</option>
																			<option value="Egypt" data-code="+20" data-length="10">Egypt</option>
																			<option value="El Salvador" data-code="+503" data-length="8">El Salvador
																			</option>
																			<option value="Equatorial Guinea" data-code="+240" data-length="9">Equatorial
																				Guinea</option>
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
																			<option value="Guinea-Bissau" data-code="+245" data-length="7">Guinea-Bissau
																			</option>
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
																			<option value="Liechtenstein" data-code="+423" data-length="8">Liechtenstein
																			</option>
																			<option value="Lithuania" data-code="+370" data-length="8">Lithuania</option>
																			<option value="Luxembourg" data-code="+352" data-length="6">Luxembourg</option>
																			<option value="Madagascar" data-code="+261" data-length="9">Madagascar</option>
																			<option value="Malawi" data-code="+265" data-length="9">Malawi</option>
																			<option value="Malaysia" data-code="+60" data-length="10">Malaysia</option>
																			<option value="Maldives" data-code="+960" data-length="7">Maldives</option>
																			<option value="Mali" data-code="+223" data-length="8">Mali</option>
																			<option value="Malta" data-code="+356" data-length="8">Malta</option>
																			<option value="Marshall Islands" data-code="+692" data-length="7">Marshall
																				Islands</option>
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
																				<option value="Myanmar (Burma)" data-code="+95" data-length="9">Myanmar (Burma)
																				</option>
																				<option value="Namibia" data-code="+264" data-length="9">Namibia</option>
																				<option value="Nauru" data-code="+674" data-length="7">Nauru</option>
																				<option value="Nepal" data-code="+977" data-length="10">Nepal</option>
																				<option value="Netherlands" data-code="+31" data-length="9">Netherlands</option>
																				<option value="New Zealand" data-code="+64" data-length="9">New Zealand</option>
																				<option value="Nicaragua" data-code="+505" data-length="8">Nicaragua</option>
																				<option value="Niger" data-code="+227" data-length="8">Niger</option>
																				<option value="Nigeria" data-code="+234" data-length="10">Nigeria</option>
																				<option value="North Macedonia" data-code="+389" data-length="8">North Macedonia
																				</option>
																				<option value="Norway" data-code="+47" data-length="8">Norway</option>
																				<option value="Oman" data-code="+968" data-length="8">Oman</option>
																				<option value="Pakistan" data-code="+92" data-length="10">Pakistan</option>
																				<option value="Palau" data-code="+680" data-length="7">Palau</option>
																				<option value="Palestine" data-code="+970" data-length="9">Palestine</option>
																				<option value="Panama" data-code="+507" data-length="7">Panama</option>
																				<option value="Papua New Guinea" data-code="+675" data-length="8">Papua New
																					Guinea</option>
																				<option value="Paraguay" data-code="+595" data-length="9">Paraguay</option>
																				<option value="Peru" data-code="+51" data-length="9">Peru</option>
																				<option value="Philippines" data-code="+63" data-length="10">Philippines
																				</option>
																				<option value="Poland" data-code="+48" data-length="9">Poland</option>
																				<option value="Portugal" data-code="+351" data-length="9">Portugal</option>
																				<option value="Qatar" data-code="+974" data-length="8">Qatar</option>
																				<option value="Romania" data-code="+40" data-length="10">Romania</option>
																				<option value="Russia" data-code="+7" data-length="10">Russia</option>
																				<option value="Rwanda" data-code="+250" data-length="9">Rwanda</option>
																				<option value="Saint Kitts and Nevis" data-code="+1-869" data-length="7">Saint
																					Kitts and Nevis</option>
																				<option value="Saint Lucia" data-code="+1-758" data-length="7">Saint Lucia
																				</option>
																				<option value="Saint Vincent and the Grenadines" data-code="+1-784"
																					data-length="7">Saint Vincent and the Grenadines</option>
																				<option value="Samoa" data-code="+685" data-length="7">Samoa</option>
																				<option value="San Marino" data-code="+378" data-length="7">San Marino</option>
																				<option value="Sao Tome and Principe" data-code="+239" data-length="7">Sao Tome
																					and Principe</option>
																				<option value="Saudi Arabia" data-code="+966" data-length="9">Saudi Arabia
																				</option>
																				<option value="Senegal" data-code="+221" data-length="8">Senegal</option>
																				<option value="Serbia" data-code="+381" data-length="9">Serbia</option>
																				<option value="Seychelles" data-code="+248" data-length="7">Seychelles</option>
																				<option value="Sierra Leone" data-code="+232" data-length="8">Sierra Leone
																				</option>
																				<option value="Singapore" data-code="+65" data-length="8">Singapore</option>
																				<option value="Slovakia" data-code="+421" data-length="9">Slovakia</option>
																				<option value="Slovenia" data-code="+386" data-length="8">Slovenia</option>
																				<option value="Solomon Islands" data-code="+677" data-length="7">Solomon Islands
																				</option>
																				<option value="Somalia" data-code="+252" data-length="9">Somalia</option>
																				<option value="South Korea" data-code="+82" data-length="10">South Korea
																				</option>
																				<option value="South Sudan" data-code="+211" data-length="9">South Sudan
																				</option>
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
																				<option value="Timor-Leste" data-code="+670" data-length="7">Timor-Leste
																				</option>
																				<option value="Togo" data-code="+228" data-length="8">Togo</option>
																				<option value="Tonga" data-code="+676" data-length="7">Tonga</option>
																				<option value="Trinidad and Tobago" data-code="+1-868" data-length="7">Trinidad
																					and Tobago</option>
																				<option value="Tunisia" data-code="+216" data-length="8">Tunisia</option>
																				<option value="Turkey" data-code="+90" data-length="10">Turkey</option>
																				<option value="Turkmenistan" data-code="+993" data-length="8">Turkmenistan
																				</option>
																				<option value="Tuvalu" data-code="+688" data-length="7">Tuvalu</option>
																				<option value="Uganda" data-code="+256" data-length="10">Uganda</option>
																				<option value="Ukraine" data-code="+380" data-length="9">Ukraine</option>
																				<option value="United Arab Emirates" data-code="+971" data-length="9">United
																					Arab Emirates</option>
																				<option value="United Kingdom" data-code="+44" data-length="10">United Kingdom
																				</option>
																				<option value="United States" data-code="+1" data-length="10">United States
																				</option>
																				<option value="Uruguay" data-code="+598" data-length="8">Uruguay</option>
																				<option value="Uzbekistan" data-code="+998" data-length="9">Uzbekistan</option>
																				<option value="Vanuatu" data-code="+678" data-length="7">Vanuatu</option>
																				<option value="Vatican City" data-code="+39" data-length="7">Vatican City
																				</option>
																				<option value="Venezuela" data-code="+58" data-length="10">Venezuela</option>
																				<option value="Vietnam" data-code="+84" data-length="10">Vietnam</option>
																				<option value="Yemen" data-code="+967" data-length="9">Yemen</option>
																				<option value="Zambia" data-code="+260" data-length="10">Zambia</option>
																				<option value="Zimbabwe" data-code="+263" data-length="9">Zimbabwe</option>
																			</select>
																			<div id="editcountryError"
																				class="error-message"></div>
																		</div>

																		<div class="mb-3" id="provinceField">
																			<label for="editaddress">Province</label>
																			<select id="editaddress" name="editaddress"
																				class="form-control" required>
																				<option value="" disabled selected>
																					Select your province</option>
																				<option value="Limpopo">Limpopo</option>
																				<option value="Gauteng">Gauteng</option>
																				<option value="Free State">Free State
																				</option>
																				<option value="North West">North West
																				</option>
																				<option value="Northern Cape">Northern
																					Cape</option>
																				<option value="Eastern Cape">Eastern
																					Cape</option>
																				<option value="KwaZulu Natal">KwaZulu
																					Natal</option>
																				<option value="Mpumalanga">Mpumalanga
																				</option>
																				<option value="Western Cape">Western
																					Cape</option>
																			</select>
																			<div id="editaddressError"
																				class="error-message"></div>
																		</div>

																		<input type="button" value="Next"
																			class="btn btn-primary"
																			onclick="editvalidateForm1()">
																	</form>

																	<!-- Form 2 -->
																	<form id="editform2" class="p-4 border rounded">
																		<h1 class="mb-4"></h1>
																		<div class="mb-3">
																			<label for="subject">Subjects(Separate in
																				Comma)</label>
																			<input type="text" id="editsubjects"
																				name="editsubjects" class="form-control"
																				required>
																			<div id="editsubjectError"
																				class="error-message"></div>
																		</div>
																		<div class="mb-3">
																			<label for="grades">Grades(Separate in
																				Comma)</label>
																			<input type="text" id="editgrades"
																				name="editgrades" class="form-control"
																				required>
																			<div id="editgradesError"
																				class="error-message"></div>
																		</div>
																		<div class="mb-3">
																			<label for="syllabus">Syllabus(Separate in
																				Comma)</label>
																			<input type="text" id="editsyllabus"
																				name="editsyllabus" class="form-control"
																				required>
																			<div id="editsyllabusError"
																				class="error-message"></div>
																		</div>

																		<div class="mb-3">
																			<label for="tutorOptions">Tutoring
																				Options</label>
																			<select id="edittutorOptions"
																				name="edittutorOptions"
																				class="form-control" required
																				aria-placeholder="Tutoring Options">
																				<option value="Online">Online</option>
																				<option value="In-Person">In-Person
																				</option>
																				<option value="Online & In-Person">
																					Online &
																					In-Person</option>
																			</select>
																		</div>

																		<div class="mb-3">
																			<label for="area">Area</label>
																			<input type="text" id="editarea"
																				name="editarea" class="form-control"
																				required>
																			<div id="editAreaError"
																				class="error-message"></div>
																		</div>

																		<input type="button" value="Previous"
																			class="btn btn-secondary"
																			onclick="editdisplayForm1()">
																		<button type="button" class="btn btn-secondary"
																			onclick="editvalidateForm2()">Next</button>

																	</form>

																	<!-- Form 3 -->
																	<form id="editform3" class="p-4 border rounded"
																		enctype="multipart/form-data">
																		<h1 class="mb-4"></h1>
																		<div class="mb-3">
																			<label for="editabout">About Tutor</label>
																			<input type="text" id="editabout"
																				name="editabout" class="form-control"
																				style="height: 150px;" required />

																		</div>

																		<div class="mb-3">
																			<label for="hours">Bio</label>
																			<input type="text" id="edithours"
																				name="edithours" class="form-control"
																				style="height: 150px;" required />

																		</div>

																		<div class="mb-3">
																			<label for="editbio">Qualification(Separate
																				in Comma)</label>
																			<input type="text" id="editbio"
																				name="editbio" class="form-control"
																				style="height: 150px;" required>

																		</div>

																		<div class="mb-3">
																			<label for="profile">Profile Picture</label>
																			<input type="file" id="editprofile"
																				name="editprofile" class="form-control">
																		</div>

																		<div class="mb-3">
																			<input type="hidden" id="edithiddenName"
																				name="edithiddenName"
																				class="form-control">
																			<input type="hidden" id="edithiddenSurname"
																				name="edithiddenSurname"
																				class="form-control">
																			<input type="hidden" id="edithiddenCountry"
																				name="edithiddenCountry"
																				class="form-control">
																			<input type="hidden" id="edithiddenEmail"
																				name="edithiddenEmail"
																				class="form-control">
																			<input type="hidden" id="edithiddenPhone"
																				name="edithiddenPhone"
																				class="form-control">
																			<input type="hidden" id="edithiddenSubjects"
																				name="edithiddenSubjects"
																				class="form-control">
																			<input type="hidden" id="edithiddenGrades"
																				name="edithiddenGrades"
																				class="form-control">
																			<input type="hidden" id="edithiddenSyllabus"
																				name="edithiddenSyllabus"
																				class="form-control">
																			<input type="hidden" id="edittutorOption"
																				name="edittutorOption"
																				class="form-control">
																			<input type="hidden" id="edithiddenAddress"
																				name="edithiddenAddress"
																				class="form-control">
																			<input type="hidden" id="edithiddenArea"
																				name="edithiddenArea"
																				class="form-control">
																		</div>

																		<input type="button" value="Previous"
																			class="btn btn-secondary"
																			onclick="editdisplayForm2()">
																		<button type="submit"
																			class="btn btn-success">Save</button>
																	</form>

																	<!--END HERE-->
																</div>

																<!--END HERE-->

															</div>
														</div>
													</div>

													<!----edit-modal end--------->


													<!----delete-modal start--------->
													<div id="deleteEmployeeModal" class="modal fade" tabindex="-1"
														role="dialog">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">Confirm Deletion</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<form action="/deleteTutor" method="post">
																	<div class="modal-body">
																		<p>Are you sure you want to delete the Tutor?
																		</p>
																		<input type="hidden" name="deleteEmail"
																			id="deleteEmail" />
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-dismiss="modal">Cancel</button>
																		<button type="submit" class="btn btn-danger"
																			onclick="confirmDeletion()">Delete</button>
																	</div>
																</form>
															</div>
														</div>
													</div>

													<!----delete-modal end--------->

												</div>


												<!--Booking Panel-->

												<div class="row" id="bookingPanel">
													<div class="col-md-12">
														<div class="table-wrapper">

															<div class="table-title">
																<div class="row">
																	<div
																		class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																		<h2 class="ml-lg-2">Pending Bookings</h2>
																	</div>
																</div>
															</div>

															<table class="table table-striped table-hover">

																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Email</th>
																		<th>Tutoring</th>
																		
																		<th>Tutor Email</th>
																		<th>Creation Date</th>
																		<th>Status</th>
																		<th>View</th>
																	</tr>
																</thead>

																<tbody>

																	<% List<Booking> bookings = (List<Booking>)
																			request.getAttribute("bookings");
																			if (bookings != null && !bookings.isEmpty())
																			{

																			for (Booking book : bookings) {

																			String bName = book.getName();
																			String bSurname = book.getSurname();
																			String bEmail = book.getEmail();
																			String bTutoringOption =
																			book.getTutorStyle();
																			String bTutorName = book.getTutorName();
																			String bTutorEmail = book.getTutorEmail();
																			String bStatus = book.getStatus();
																			String clientName = bName + " " + bSurname;

																			String bPaid = book.getIsPaid();
																			String bPackageType = book.getPackageType();
																			String bTutorOption = book.getTutorOption();
																			String bMessage = book.getMessage();
																			String bSuburb = book.getSuburb();
																			String bAddress = book.getAddress();
																			String bSubject = book.getSubject();
																			String bPhone = book.getPhone();
																			String bProvince = book.getProvince();
																			String bCountry = book.getCountry();
																			String bInstrLanguage =
																			book.getInstrLanguage();
																			String bTutorFor = book.getTutorFor();
																			String bHelpWith = book.getHelpWith();
																			String bSchName = book.getSchName() ;
																			String bSchSurname = book.getSchSurname();
																			String bSchGrade = book.getSchGrade();
																			String bSchSyllabus = book.getSchSyllabus();
																			String bnName = book.getUnName();
																			String bnSurname = book.getUnSurname();
																			String bnYear = book.getUnYear();
																			String amountPaid = book.getPaidAmount();
																			String bQualification =
																			book.getQualification() ;
																			String bModule = book.getModule();
																			String bSpecification =
																			book.getSpecification();


																			if(amountPaid.equals("")){

																			amountPaid = "Not paid.";
																			}

																			String numSessions = book.getSessions();

																			if(numSessions.equals("")){

																			numSessions = "Not Selected.";
																			}

																			LocalDateTime createdAtStampP = book.getCreatedAt();
																			DateTimeFormatter dateFormatP = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");
																			String formattedTimestampsP = (createdAtStampP != null) ? createdAtStampP.format(dateFormatP) : "N/A";


																			if(bStatus.equalsIgnoreCase("pending")){

																			%>
																			<tr>

																				<th>
																					<%= bName %>
																						<%= bSurname %>
																				</th>
																				<th>
																					<%= bEmail %>
																				</th>
																				<th>
																					<%= bTutoringOption %>
																				</th>
																				
																				<th>
																					<%= bTutorEmail %>
																				</th>
																				<th>
																					<%= formattedTimestampsP %>
																				</th>
																				<th>
																					<%= bStatus %>
																				</th>
																				<th>


																					<a href="#" class="view"
																						data-toggle="modal"
																						data-target="#bookingModal"
																						data-name="<%= clientName%>"
																						data-phone="<%= bPhone %> "
																						data-email="<%= bEmail %> "
																						data-country="<%= bCountry %> "
																						data-province="<%= bProvince %> "
																						data-language="<%= bInstrLanguage %> "
																						data-tutoringfor="<%= bTutorFor %> "
																						data-helpwith="<%= bHelpWith %> "
																						data-sname="<%= bSchName %> "
																						data-ssurname="<%= bSchSurname %> "
																						data-sgrade="<%= bSchGrade %> "
																						data-ssyllabus="<%= bSchSyllabus %> "
																						data-ssubject="<%= bSubject %> "
																						data-syear="<%= bnYear%> "
																						data-uname="<%= bnName %> "
																						data-usurname="<%= bnSurname %>"
																						data-address="<%= bAddress %>"
																						data-suburb="<%= bSuburb %>"
																						data-message="<%= bMessage %>"
																						data-status="<%= bStatus %>"
																						data-tutorname="<%= bTutorName %>"
																						data-tutoremail="<%= bTutorEmail %>"
																						data-tutoropt="<%= bTutoringOption %>"
																						data-secondopt="<%= bTutorOption %>"
																						data-package="<%= bPackageType %>"
																						data-session="<%= numSessions %>"
																						data-paid="<%= amountPaid %>"
																						data-qualification="<%= bQualification %>"
																						data-module="<%= bModule %>"
																						data-specification="<%= bSpecification %>">
																						<i class="material-icons"
																							data-toggle="tooltip"
																							title="View">&#xE8F4;</i>
																					</a>

																				</th>
																			</tr>

																			<% } } } else { %>
																				<tr>
																					<th>No Bookings yet..</th>
																				</tr>
																				<% } %>

																</tbody>
															</table>
														</div>
													</div>

												</div>

												<!--Approved Booking Panel-->



												<!--End Book a tutor Application-->

												<div class="row" id="becomeTutorPanel">
													<div class="col-md-12">
														<div class="table-wrapper">
															<div class="table-title">
																<div class="row">
																	<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																		<h2 class="ml-lg-2">Become a Tutor Applications</h2>
																	</div>
																</div>
															</div>
												
															<table class="table table-striped table-hover">
																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Surname</th>
																		<th>Email</th>
																		<th>Phone</th>
																		<th>Creation Date</th>
																		<th>View</th>
																	</tr>
																</thead>
																<tbody>
																	<%
																	List<BecomeTutor> tutorApplicationsList = (List<BecomeTutor>) request.getAttribute("becomeTutor");
																	if (tutorApplicationsList != null && !tutorApplicationsList.isEmpty()) {
																		for (BecomeTutor tutorApplicationEntry : tutorApplicationsList) {
																			String tutorFirstName = tutorApplicationEntry.getName();
																			String tutorLastName = tutorApplicationEntry.getSurname();
																			String tutorEmailAddress = tutorApplicationEntry.getEmail();
																			String tutorPhone = tutorApplicationEntry.getPhone();
																			String tutorCountry = tutorApplicationEntry.getCountry();
																			java.util.Date tutorDob = tutorApplicationEntry.getDob();
																			int tutorExperience = tutorApplicationEntry.getExperience();
																			String tutorArea = tutorApplicationEntry.getArea();
																			String tutorAddress = tutorApplicationEntry.getAddress();
																			String tutorProvince = tutorApplicationEntry.getProvince();
																			String tutorSubjects = tutorApplicationEntry.getSubjects();
																			String tutorGrades = tutorApplicationEntry.getGrades();
																			String tutorSyllabus = tutorApplicationEntry.getSyllabus();
																			String tutorOptions = tutorApplicationEntry.getTutorOptions();
																			String tutorQualification = tutorApplicationEntry.getQualification();
																			String tutorSpecification = tutorApplicationEntry.getSpecification();
																			String tutorBio = tutorApplicationEntry.getBio();
																			String tutorAbout = tutorApplicationEntry.getAbout();
																			String tutorAchievements = tutorApplicationEntry.getAchievements();
																			
												
																			LocalDateTime createdAtStamp = tutorApplicationEntry.getCreatedAt();
																			DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");
																			String formattedTimestamps = (createdAtStamp != null) ? createdAtStamp.format(dateFormat) : "N/A";
																	%>
																	<tr>
																		<td><%= tutorFirstName %></td>
																		<td><%= tutorLastName %></td>
																		<td><%= tutorEmailAddress %></td>
																		<td><%= tutorPhone %></td>
																		
																		<td><%= formattedTimestamps %></td>
																		<td>
																			<a href="#" class="becomeTutorView" 
																			data-toggle="modal"
																			data-tutorname="<%= tutorFirstName %>"
																			data-tutorsurname="<%= tutorLastName %>"
																			data-tutoremail="<%= tutorEmailAddress %>"
																			data-tutorphone="<%= tutorPhone %>"
																			data-country="<%= tutorCountry %>"
																			data-dob='<%= (tutorDob != null) ? new SimpleDateFormat("dd/MM/yyyy").format(tutorDob) : "" %>'
																			
																			data-experience="<%= tutorApplicationEntry.getExperience() %>"
																			data-area="<%= tutorApplicationEntry.getArea() %>"
																			data-address = "<%= tutorApplicationEntry.getAddress() %>"
																			data-province="<%= tutorApplicationEntry.getProvince() %>"
																			data-subjects="<%= tutorApplicationEntry.getSubjects() %>"
																			data-grades="<%= tutorApplicationEntry.getGrades() %>"
																			data-syllabus="<%= tutorApplicationEntry.getSyllabus() %>"
																			data-options="<%= tutorApplicationEntry.getTutorOptions() %>"
																			data-qualification="<%= tutorApplicationEntry.getQualification() %>"
																			data-specification="<%= tutorApplicationEntry.getSpecification() %>"
																			data-bio="<%= tutorApplicationEntry.getBio() %>"
																			data-about="<%= tutorApplicationEntry.getAbout() %>"
																			data-achievements = "<%= tutorApplicationEntry.getAchievements() %>"
																			data-cv='<%= tutorApplicationEntry.getCv() != null ? Base64.getEncoder().encodeToString(tutorApplicationEntry.getCv()) : "" %>'
																			data-education='<%= tutorApplicationEntry.getEducation() != null ?  Base64.getEncoder().encodeToString(tutorApplicationEntry.getEducation()) : "" %>'
																			data-idpassport='<%= tutorApplicationEntry.getIdPassport() != null ? Base64.getEncoder().encodeToString(tutorApplicationEntry.getIdPassport()) : "" %>'
																			data-image='<%= tutorApplicationEntry.getImage() != null ? Base64.getEncoder().encodeToString(tutorApplicationEntry.getImage()) : "" %>'
																			data-isithombe = '<%= tutorApplicationEntry.getImage() %>'
																			data-datedate = '<%= tutorApplicationEntry.getDob() %>'
																			data-target="#registeredTutorModal">
																			<i class="material-icons" data-toggle="tooltip" title="View">&#xE8F4;</i>
																			</a>

																		</td>
																	</tr>
																	<%
																		}
																	} else {
																	%>
																	<tr>
																		<td colspan="18">No applications yet.</td>
																	</tr>
																	<%
																	}
																	%>
																</tbody>
															</table>
														</div>
													</div>
												</div>








												<!--End Book a tutor application-->



												<!--Reviews Panel-->

												<div class="row" id="reviewsPanel">
													<div class="col-md-12">
														<div class="table-wrapper">

															<div class="table-title">
																<div class="row">
																	<div
																		class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																		<h2 class="ml-lg-2">Reviews</h2>
																	</div>
																</div>
															</div>

															<table class="table table-striped table-hover">

																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Rating</th>
																		<th>Message</th>

																		<th>Tutor Email</th>
																		<th>View</th>
																	</tr>
																</thead>

																<tbody>

																	<% List<Review> reviews = (List<Review>)
																			request.getAttribute("reviews");
																			if (reviews != null && !reviews.isEmpty()) {

																			for (Review rv : reviews) {

																			String message = rv.getMessage();
																			String msg = message;
																			String useMessage = msg;

																			String rName = rv.getName();
																			String rTutorEmail = rv.getTutorEmail();
																			int rRating = rv.getRating();
																			Long rEntryId = rv.getEntryId();
																			String rStatus = rv.getStatus();

																			if(rStatus.equals("pending")){

																			%>

																			<tr>
																				<th>
																					<%= rName %>
																				</th>
																				<th>
																					<%= rRating %>
																				</th>
																				<th>
																					<%= useMessage %>
																				</th>
																				<th>
																					<%= rTutorEmail %>
																				</th>
																				<th>

																					<a href="#" class="review"
																						data-toggle="modal"
																						data-target="#reviewModal"
																						data-name="<%= rName %>"
																						data-message="<%= message %>"
																						data-rating="<%= rRating %>"
																						data-message="<%= message %>"
																						data-tutor="<%= rEntryId %>"
																						data-email="rTutorEmail">
																						<i class="material-icons"
																							data-toggle="tooltip"
																							title="View">&#xE8F4;</i>
																					</a>

																				</th>
																			</tr>
																			<% } } } else { %>
																				<tr>
																					<th>No Reviews yet..</th>
																				</tr>
																				<% } %>


																</tbody>
															</table>
														</div>
													</div>

												</div>


												<!--Reviews Panel-->

												<!--Start Consultans Panel-->

												<div class="row" id="consultantsPanel">
													<div class="col-md-12">
														<div class="table-wrapper">

															<div class="table-title">
																<div class="row">
																	<div
																		class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																		<h2 class="ml-lg-2">Pending Consultations</h2>
																	</div>
																</div>
															</div>

															<table class="table table-striped table-hover">

																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Email</th>
																		<th>Tutoring</th>
																		<th>Consultant Email</th>
																		<th>Creation Date</th>
																		<th>Status</th>
																		<th>View</th>
																	</tr>
																</thead>

																<tbody>

																	<% List<Booking> consultations = (List<Booking>)
																			request.getAttribute("bookings");
																			if (consultations != null &&
																			!consultations.isEmpty()) {

																			for (Booking consultation : consultations) {

																			String cbName = consultation.getName();
																			String cbSurname =
																			consultation.getSurname();
																			String cbEmail = consultation.getEmail();
																			String cbTutoringOption =
																			consultation.getTutorStyle();
																			String cbTutorName =
																			consultation.getTutorName();
																			String cbTutorEmail =
																			consultation.getTutorEmail();
																			String cbStatus = consultation.getStatus();
																			String cclientName = cbName + " " +
																			cbSurname;

																			String cbPaid = consultation.getIsPaid();
																			String cbPackageType =
																			consultation.getPackageType();
																			String cbTutorOption =
																			consultation.getTutorOption();
																			String cbMessage =
																			consultation.getMessage();
																			String cbSuburb = consultation.getSuburb();
																			String cbAddress =
																			consultation.getAddress();
																			String cbSubject =
																			consultation.getSubject();
																			String cbPhone = consultation.getPhone();
																			String cbProvince =
																			consultation.getProvince();
																			String cbCountry =
																			consultation.getCountry();
																			String cbInstrLanguage =
																			consultation.getInstrLanguage();
																			String cbTutorFor =
																			consultation.getTutorFor();
																			String cbHelpWith =
																			consultation.getHelpWith();
																			String cbSchName = consultation.getSchName()
																			;
																			String cbSchSurname =
																			consultation.getSchSurname();
																			String cbSchGrade =
																			consultation.getSchGrade();
																			String cbSchSyllabus =
																			consultation.getSchSyllabus();
																			String cbnName = consultation.getUnName();
																			String cbnSurname =
																			consultation.getUnSurname();
																			String cbnYear = consultation.getUnYear();

																			String cqualification =
																			consultation.getQualification() ;
																			String cmodule = consultation.getModule();
																			String cspecification =
																			consultation.getSpecification();

																			Long cId = consultation.getEntry();

																			LocalDateTime createdAtStampC = consultation.getCreatedAt();
																			DateTimeFormatter dateFormatC = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");
																			String formattedTimestampsC = (createdAtStampC != null) ? createdAtStampC.format(dateFormatC) : "N/A";

																			if(cbStatus.equalsIgnoreCase("consult")) {

																			%>
																			<tr>

																				<th>
																					<%= cclientName %>
																				</th>
																				<th>
																					<%= cbEmail %>
																				</th>
																				<th>
																					<%= cbTutoringOption %>
																				</th>
																				
																				<th>
																					<%= cbTutorEmail %>
																				</th>
																				<th>
																					<%= formattedTimestampsC %>
																				</th>
																				<th>
																					<%= cbStatus %>
																				</th>
																				<th>

																					<a href="#" class="consultView"
																						data-toggle="modal"
																						data-target="#consultationModal"
																						data-name="<%= cclientName%>"
																						data-phone="<%= cbPhone %> "
																						data-email="<%= cbEmail %> "
																						data-country="<%= cbCountry %> "
																						data-province="<%= cbProvince %> "
																						data-language="<%= cbInstrLanguage %> "
																						data-tutoringfor="<%= cbTutorFor %> "
																						data-helpwith="<%= cbHelpWith %> "
																						data-sname="<%= cbSchName %> "
																						data-ssurname="<%= cbSchSurname %> "
																						data-sgrade="<%= cbSchGrade %> "
																						data-ssyllabus="<%= cbSchSyllabus %> "
																						data-ssubject="<%= cbSubject %> "
																						data-syear="<%= cbnYear%> "
																						data-uname="<%= cbnName %> "
																						data-usurname="<%= cbnSurname %>"
																						data-address="<%= cbAddress %>"
																						data-suburb="<%= cbSuburb %>"
																						data-message="<%= cbMessage %>"
																						data-status="<%= cbStatus %>"
																						data-tutorname="<%= cbTutorName %>"
																						data-tutoremail="<%= cbTutorEmail %>"
																						data-tutoropt="<%= cbTutoringOption %>"
																						data-secondopt="<%= cbTutorOption %>"
																						data-package="<%= cbPackageType %>"
																						data-sid="<%= cId %>"
																						data-cqualification="<%= cqualification %>"
																						data-cmodule="<%= cmodule %>"
																						data-cspecification="<%= cspecification %>">

																						<i class="material-icons"
																							data-toggle="tooltip"
																							title="View">&#xE8F4;</i>

																					</a>

																				</th>


																			</tr>

																			<% } } } else { %>
																				<tr>
																					<th>No Consultations yet..</th>
																				</tr>
																				<% } %>

																</tbody>
															</table>
														</div>
													</div>
												</div>

												<!--End Consultans Panel-->

												<!--Start others panel-->

												<div class="row" id="othersPanel">
													<div class="col-md-12">
														<div class="table-wrapper">

															<div class="table-title">
																<div class="row">
																	<div
																		class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																		<h2 class="ml-lg-2">Pending Others</h2>
																	</div>
																</div>
															</div>

															<table class="table table-striped table-hover">

																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Email</th>
																		<th>Contacts</th>
																		<th>Creation Date</th>
																		<th>View</th>
																	</tr>
																</thead>

																<tbody>

																	<% List<Booking> othersBookings = (List<Booking>)
																			request.getAttribute("bookings");
																			if (othersBookings != null &&
																			!othersBookings.isEmpty()) {
																			for (Booking other : othersBookings) {

																			String obName = other.getName();
																			String obSurname = other.getSurname();
																			String obEmail = other.getEmail();
																			String obTutoringOption =
																			other.getTutorStyle();
																			String obTutorName = other.getTutorName();
																			String obTutorEmail = other.getTutorEmail();
																			String obStatus = other.getStatus();
																			String oclientName = obName + " " +
																			obSurname;

																			String obPaid = other.getIsPaid();
																			String obPackageType =
																			other.getPackageType();
																			String obTutorOption =
																			other.getTutorOption();
																			String obMessage = other.getMessage();
																			String obSuburb = other.getSuburb();
																			String obAddress = other.getAddress();
																			String obSubject = other.getSubject();
																			String obPhone = other.getPhone();
																			String obProvince = other.getProvince();
																			String obCountry = other.getCountry();
																			String obInstrLanguage =
																			other.getInstrLanguage();
																			String obTutorFor = other.getTutorFor();
																			String obHelpWith = other.getHelpWith();
																			String obSchName = other.getSchName() ;
																			String obSchSurname = other.getSchSurname();
																			String obSchGrade = other.getSchGrade();
																			String obSchSyllabus =
																			other.getSchSyllabus();
																			String obnName = other.getUnName();
																			String obnSurname = other.getUnSurname();
																			String obnYear = other.getUnYear();

																			String oQualification =
																			other.getQualification() ;
																			String oModule = other.getModule();
																			String oSpecification =
																			other.getSpecification();

																			Long oid = other.getEntry();

																			LocalDateTime createdAtStampO = other.getCreatedAt();
																			DateTimeFormatter dateFormatO = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");
																			String formattedTimestamps0 = (createdAtStampO != null) ? createdAtStampO.format(dateFormatO) : "N/A";

																			if (obSchSyllabus.equalsIgnoreCase("other"))
																			{
																			%>
																			<tr>
																				<th>
																					<%= oclientName %>
																				</th>
																				<th>
																					<%= obEmail %>
																				</th>
																				<th>
																					<%= obPhone %>
																				</th>
																				<th>
																					<%= formattedTimestamps0 %>
																				</th>


																				<th>
																					<a href="#" class="otherView"
																						data-toggle="modal"
																						data-target="#otherModal"
																						data-name="<%= oclientName%>"
																						data-phone="<%= obPhone %> "
																						data-email="<%= obEmail %> "
																						data-country="<%= obCountry %> "
																						data-province="<%= obProvince %> "
																						data-language="<%= obInstrLanguage %> "
																						data-tutoringfor="<%= obTutorFor %> "
																						data-helpwith="<%= obHelpWith %> "
																						data-sname="<%= obSchName %> "
																						data-ssurname="<%= obSchSurname %> "
																						data-sgrade="<%= obSchGrade %> "
																						data-ssyllabus="<%= obSchSyllabus %> "
																						data-ssubject="<%= obSubject %> "
																						data-syear="<%= obnYear%> "
																						data-uname="<%= obnName %> "
																						data-usurname="<%= obnSurname %>"
																						data-address="<%= obAddress %>"
																						data-suburb="<%= obSuburb %>"
																						data-message="<%= obMessage %>"
																						data-status="<%= obStatus %>"
																						data-tutorname="<%= obTutorName %>"
																						data-tutoremail="<%= obTutorEmail %>"
																						data-tutoropt="<%= obTutoringOption %>"
																						data-secondopt="<%= obTutorOption %>"
																						data-package="<%= obPackageType %>"
																						data-oid="<%= oid %>"
																						data-oqualification="<%= oQualification %>"
																						data-omodule="<%= oModule %>"
																						data-ospecification="<%= oSpecification %>">
																						<i class="material-icons"
																							data-toggle="tooltip"
																							title="View">&#xE8F4;</i>
																					</a>
																				</th>
																			</tr>

																			<% } } } else { %>
																				<tr>
																					<th>No Others yet..</th>
																				</tr>
																				<% } %>

																</tbody>
															</table>
														</div>
													</div>
												</div>


												<!--End others panel-->


												<!--Start Matric-ReWrite Registered panel-->

												<div class="row" id="matricRegisteredPanel">
													<div class="col-md-12">
														<div class="table-wrapper">

															<div class="table-title">
																<div class="row">
																	<div
																		class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																		<h2 class="ml-lg-2">Matric Re-Write Registered Students</h2>
																	</div>
																</div>
															</div>

															<table class="table table-striped table-hover">

																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Email</th>
																		<th>Mobile</th>
																		<th>Creation Date</th>
																		<th>Status</th>
																		<th>View</th>
																	</tr>
																</thead>

																<tbody>
																	<% List<OnlineClass> metric = (List<OnlineClass>)
																			request.getAttribute("rewrite");
																			if (metric != null &&
																			!metric.isEmpty()) {
																			for (OnlineClass re : metric) {

																			String mName = re.getName();
																			String mSurname = re.getSurname();
																			String mEmail = re.getEmail();
																			String mMobile = re.getPhone();
																			String mID = re.getIdNumber() ;
																			String mGender = re.getGender();
																			
																			String mFullName = mName + " " + mSurname;

																			String mProvince = re.getProvince();
																			String mWritingDate = re.getDate();
																			String mSubjects = re.getSubject();
																			String mAvailability = re.getAvailableDays();
																			String mMessage = re.getMessage();
                                                                            String mStatus = re.getStatus();
																			String mViewed = re.getAction();


																			Long mEntry = re.getEntry();

																			LocalDateTime createdAtStampX = re.getCreatedAt();
																			DateTimeFormatter dateFormatX = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");
																			String formattedTimestampsX = (createdAtStampX != null) ? createdAtStampX.format(dateFormatX) : "N/A";


																			if (mStatus.equalsIgnoreCase("paid"))
																			{
																			%>
																			<tr>
																				<th>
																					<%= mFullName %>
																				</th>
																				<th>
																					<%= mEmail %>
																				</th>

																				<th>
																					<%= mMobile %>
																				</th>

																				<th>
																					<%= formattedTimestampsX %>
																				</th>

																			
																					<%
																						   if(mViewed.equals("Pending")){
 
																							%>
																							<th>

																								<span id="matricViewR<%=mEntry%>" style="color: red ; font-weight: bold;">Not opened</span>
																							</th>

																							<%
																						   }

																						     else{

																								%>

																								<th>

																									<span style="color: green ; font-weight: bold;">Opened</span>
																								</th>


																								<%
																							 }

																						   %>
																		
																				<th>
																					<a href="#" class="registeredView"
																					data-toggle="modal"
                                                                                   
																					data-mname="<%= mFullName %>"
																					data-memail="<%= mEmail %>"
																					data-mmobile="<%= mMobile %>"
																					data-mid="<%= mID %>"
																					data-mgender="<%= mGender %>"
																					data-mprovince="<%= mProvince%>"
																					data-mwritingdate="<%= mWritingDate %>"
																					data-msubjects="<%= mSubjects %>"
																					data-mavailability="<%= mAvailability %>"
																					data-mmessage="<%= mMessage%>"
																					data-mstatus="<%= mStatus %>"
																					data-cmentry = "<%= mEntry %>"
																					data-target="#registeredModal" 
																						>
																						<i class="material-icons"
																							data-toggle="tooltip"
																							title="View">&#xE8F4;</i>
																					</a>
																				</th>
																			</tr>

																			<% } } } else { %>
																				<tr>
																					<th>No Others yet..</th>
																				</tr>
																				<% } %>

																</tbody>

																</tbody>
															</table>
														</div>
													</div>
												</div>


												<!--End Matric-ReWrite Registered panel-->

													<!--Start Matric-ReWrite Consult panel-->

													<div class="row" id="cmatricRegisteredPanel">
														<div class="col-md-12">
															<div class="table-wrapper">
	
																<div class="table-title">
																	<div class="row">
																		<div
																			class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																			<h2 class="ml-lg-2">Matric re-Write Consultants</h2>
																		</div>
																	</div>
																</div>
	
																<table class="table table-striped table-hover">
	
																	<thead>
																		<tr>
																			<th>Name</th>
																			<th>Email</th>
																			<th>Mobile</th>
																			<th>Creation Date</th>
	                                                                        <th>Status</th>
																			<th>View</th>
																		</tr>
																	</thead>
	
																	<tbody>
																		<% List<OnlineClass> cmetric = (List<OnlineClass>)
																				request.getAttribute("rewrite");
																				if (cmetric != null &&
																				!cmetric.isEmpty()) {
																				for (OnlineClass cre : cmetric) {
	
																				String cmName = cre.getName();
																				String cmSurname = cre.getSurname();
																				String cmEmail = cre.getEmail();
																				String cmMobile = cre.getPhone();
																				String cmID = cre.getIdNumber() ;
																				String cmGender = cre.getGender();
																				
																				String cmFullName = cmName + " " + cmSurname;
	
																				String cmProvince = cre.getProvince();
																				String cmWritingDate = cre.getDate();
																				String cmSubjects = cre.getSubject();
																				String cmAvailability = cre.getAvailableDays();
																				String cmMessage = cre.getMessage();
																				String cmStatus = cre.getStatus();
	
																				String cmViewed = cre.getAction();
	
																				Long cmEntry = cre.getEntry();

																				LocalDateTime createdAtStampA = cre.getCreatedAt();
																				DateTimeFormatter dateFormatA = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");
																				String formattedTimestampsA = (createdAtStampA != null) ? createdAtStampA.format(dateFormatA) : "N/A";
	
																				if (cmStatus.equalsIgnoreCase("consult"))
																				{
																				%>
																				<tr>
																					<th>
																						<%= cmFullName %>
																					</th>
																					<th>
																						<%= cmEmail %>
																					</th>
																					<th>
																						<%= cmMobile %>
																					</th>
																					<th>
																						<%= formattedTimestampsA %>
																					</th>
	
																				
																						<%
																						   if(cmViewed.equals("Pending")){
 
																							%>
																							<th>

																								<span id="matricView<%=cmEntry%>" style="color: red ; font-weight: bold;">Not opened</span>
																							</th>

																							<%
																						   }

																						     else{

																								%>

																								<th>

																									<span style="color: green ; font-weight: bold;">Opened</span>
																								</th>


																								<%
																							 }

																						   %>
																				
	
																					<th>
																						<a href="#" class="registeredView"
																						data-toggle="modal"
																					   
																						data-mname="<%= cmFullName %>"
																						data-memail="<%= cmEmail %>"
																						data-mmobile="<%= cmMobile %>"
																						data-mid="<%= cmID %>"
																						data-mgender="<%= cmGender %>"
																						data-mprovince="<%= cmProvince%>"
																						data-mwritingdate="<%= cmWritingDate %>"
																						data-msubjects="<%= cmSubjects %>"
																						data-mavailability="<%= cmAvailability %>"
																						data-mmessage="<%= cmMessage%>"
																						data-mstatus="<%= cmStatus %>"
																				        data-cmentry = "<%= cmEntry %>"
																						data-target="#registeredModal"
																							>
																							<i class="material-icons"
																								data-toggle="tooltip"
																								title="View">&#xE8F4;</i>
																						</a>
																					</th>
																				</tr>
	
																				<% } } } else { %>
																					<tr>
																						<th>No Others yet..</th>
																					</tr>
																					<% } %>
	
																	</tbody>
	
																	</tbody>
																</table>
															</div>
														</div>
													</div>
	
	
													<!--End Matric-ReWrite Consult panel-->
												



													<!--Start MathsClass Registered panel-->


													<div class="row" id="mathsRegisteredPanel">
														<div class="col-md-12">
															<div class="table-wrapper">
																<div class="table-title">
																	<div class="row">
																		<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																			<h2 class="ml-lg-2">Maths Classes Registered Students</h2>
																		</div>
																	</div>
																</div>
													
																<table class="table table-striped table-hover">
																	<thead>
																		<tr>
																			<th>Parent Name</th>
																			<th>Parent Surname</th>
																			<th>Parent Email</th>
																			<th>Creation Date</th>
																			<th>Status</th>
																			<th>View</th>
																		</tr>
																	</thead>
																	<tbody>
																		<%
																		List<MathsClass> mathsClassesList = (List<MathsClass>) request.getAttribute("mathsClasses");
																		if (mathsClassesList != null && !mathsClassesList.isEmpty()) {
																			for (MathsClass mathsClassEntry : mathsClassesList) {
																				String parentFirstName = mathsClassEntry.getPname();
																				String parentLastName = mathsClassEntry.getPsurname();
																				String parentEmailAddress = mathsClassEntry.getPemail();
																				String parentContact = mathsClassEntry.getPphone();
																				String studentFirstName = mathsClassEntry.getSname();
																				String studentLastName = mathsClassEntry.getSsurname();
																				String studentGrade = mathsClassEntry.getGrade();
																				String studentSubject = mathsClassEntry.getSubject();
																				String currentStatus = mathsClassEntry.getStatus();
																				String studentMsg = mathsClassEntry.getMessage();
																				String studCurriculum = mathsClassEntry.getCurriculum();
																				String studMarks = mathsClassEntry.getMarks();
																				Long entryIdentifier = mathsClassEntry.getEntry();
																				String entryView = mathsClassEntry.getAction();
													
																				LocalDateTime createdAtStampM = mathsClassEntry.getCreatedAt();
																				DateTimeFormatter dateFormatM = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");
																				String formattedTimestampsM = (createdAtStampM != null) ? createdAtStampM.format(dateFormatM) : "N/A";
	
																				// Check if the currentStatus is "approved"
																				if ("approved".equals(currentStatus)) {
																		%>
																			<tr>
																				<td><%= parentFirstName %></td>
																				<td><%= parentLastName %></td>
																				<td><%= parentEmailAddress %></td>
																				<td><%= formattedTimestampsM %></td>
																				<td>
																					<%
																					if ("Pending".equals(entryView)) {
																					%>
																						<span id="rgsView<%= entryIdentifier %>" style="color: red; font-weight: bold;">Not opened</span>
																					<%
																					} else {
																					%>
																						<span style="color: green; font-weight: bold;">Opened</span>
																					<%
																					}
																					%>
																				</td>
																				<td>
																					<a href="#" class="approvedMathsView"
																					   data-toggle="modal"
																					   data-parentname="<%= parentFirstName %>"
																					   data-parentsurname="<%= parentLastName %>"
																					   data-parentemail="<%= parentEmailAddress %>"
																					   data-parentphone="<%= parentContact %>"
																					   data-studentname="<%= studentFirstName %>"
																					   data-studentsurname="<%= studentLastName %>"
																					   data-grade="<%= studentGrade %>"
																					   data-subject="<%= studentSubject %>"
																					   data-status="<%= currentStatus %>"
																					   data-entryid="<%= entryIdentifier %>"
																					   data-curriculum="<%= studCurriculum %>"
																					   data-marks="<%= studMarks %>"
																					   data-message="<%= studentMsg %>"
																					   data-action="<%= entryView %>"
																					   data-target="#registeredMathsClassModal">
																					   <i class="material-icons" data-toggle="tooltip" title="View">&#xE8F4;</i>
																					</a>
																				</td>
																			</tr>
																		<%
																				}
																			}
																		} else {
																		%>
																			<tr>
																				<td colspan="5">No registered students yet.</td>
																			</tr>
																		<%
																		}
																		%>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
													
													
													



													<!--Start MathsClass Registered panel-->



													<!--Start MathsClass Consult panel-->

													<div class="row" id="consultMathsRegisteredPanel">
														<div class="col-md-12">
															<div class="table-wrapper">
																<div class="table-title">
																	<div class="row">
																		<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																			<h2 class="ml-lg-2">Maths Classes Consultants</h2>
																		</div>
																	</div>
																</div>
													
																<table class="table table-striped table-hover">
																	<thead>
																		<tr>
																			<th>Parent Name</th>
																			<th>Parent Phone</th>
																			<th>Creation Date</th>
																			<th>Status</th>
																			<th>View</th>
																		</tr>
																	</thead>
																	<tbody>
																		<%
																		List<MathsClass> mathsClasses = (List<MathsClass>) request.getAttribute("mathsClasses");
																		if (mathsClasses != null && !mathsClasses.isEmpty()) {
																			for (MathsClass mathsClass : mathsClasses) {
																				String parentName = mathsClass.getPname() + " " + mathsClass.getPsurname();
																				String parentEmail = mathsClass.getPemail();
																				String parentPhone = mathsClass.getPphone();
																				String studentName = mathsClass.getSname() + " " + mathsClass.getSsurname();
																				String grade = mathsClass.getGrade();
																				String subject = mathsClass.getSubject();
																				String status = mathsClass.getStatus();
																				String parentCurriculum = mathsClass.getCurriculum();
																				String cMarks = mathsClass.getMarks();
																				String parentMessage = mathsClass.getMessage();
																				Long cnsEntryId = mathsClass.getEntry(); 
																				String consultMathsView = mathsClass.getAction();

																				LocalDateTime createdAtStampB = mathsClass.getCreatedAt();
																				DateTimeFormatter dateFormatB = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");
																				String formattedTimestampsB = (createdAtStampB != null) ? createdAtStampB.format(dateFormatB) : "N/A";
													
																				if ("consult".equalsIgnoreCase(status)) {
																		%>
																				<tr>
																					<td><%= parentName %></td>
																					<td><%= parentPhone %></td>
																					<td><%= formattedTimestampsB %></td>
																		
																					<td>
																						<%
																						if ("Pending".equals(consultMathsView)) {
																						%>
																							<span id="mathematicsView<%= cnsEntryId %>" style="color: red; font-weight: bold;">Not opened</span>
																						<%
																						} else {
																						%>
																							<span style="color: green; font-weight: bold;">Opened</span>
																						<%
																						}
																						%>
																					</td>
																					<td>
																						<a href="#" class="consultregisteredView"
																						   data-toggle="modal"
																						   data-parentname="<%= parentName %>"
																						   data-parentemail="<%= parentEmail %>"
																						   data-parentphone="<%= parentPhone %>"
																						   data-studentname="<%= studentName %>"
																						   data-grade="<%= grade %>"
																						   data-subject="<%= subject %>"
																						   data-status="<%= status %>"
																						   data-entryid="<%= cnsEntryId %>"  
																						   data-curriculum="<%= parentCurriculum %>" 
																						   data-marks="<%= cMarks %>"   
																						   data-message="<%= parentMessage %>"
																						   data-target="#ConsultantModal">
																						   <i class="material-icons" data-toggle="tooltip" title="View">&#xE8F4;</i>
																						</a>
																					</td>
																				</tr>
																		<%
																				}
																			}
																		} else {
																		%>
																			<tr>
																				<td colspan="6">No consultants registered yet.</td>
																			</tr>
																		<%
																		}
																		%>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
													
													
													

													<!--End MathsClass Consult panel-->



												<div class="row" id="approvedBookingPanel">
													<div class="col-md-12">
														<div class="table-wrapper">

															<div class="table-title">
																<div class="row">
																	<div
																		class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																		<h2 class="ml-lg-2">Approved Bookings</h2>
																	</div>
																</div>
															</div>

															<table class="table table-striped table-hover">

																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Email</th>
																		<th>Online / In-person</th>
																		<th>Tutor Name</th>
																	
																		<th>Status</th>
																		<th>Creation Date</th>
																		<th>View</th>
																	</tr>
																</thead>

																<tbody>

																	<% List<Booking> bk = (List<Booking>)
																			request.getAttribute("bookings");
																			if (bk != null && !bk.isEmpty()) {

																			for (Booking bks : bk) {

																			String aName = bks.getName();
																			String aSurname = bks.getSurname();
																			String aEmail = bks.getEmail();
																			String aTutoringOption =
																			bks.getTutorStyle();
																			String aTutorName = bks.getTutorName();
																			String aTutorEmail = bks.getTutorEmail();
																			String aStatus = bks.getStatus();

																			String aPaid = bks.getIsPaid();
																			String aPackageType = bks.getPackageType();
																			String aTutorOption = bks.getTutorOption();
																			String aMessage = bks.getMessage();
																			String aSuburb = bks.getSuburb();
																			String aAddress = bks.getAddress();
																			String aSubject = bks.getSubject();
																			String aPhone = bks.getPhone();
																			String aProvince = bks.getProvince();
																			String aCountry = bks.getCountry();
																			String aInstrLanguage =
																			bks.getInstrLanguage();
																			String aTutorFor = bks.getTutorFor();
																			String aHelpWith = bks.getHelpWith();
																			String aSchName = bks.getSchName() ;
																			String aSchSurname = bks.getSchSurname();
																			String aSchGrade = bks.getSchGrade();
																			String aSchSyllabus = bks.getSchSyllabus();
																			String anName = bks.getUnName();
																			String anSurname = bks.getUnSurname();
																			String anYear = bks.getUnYear();
																			String aPackage = bks.getPackageType();
																			String aamountPaid = bks.getPaidAmount();

																			String aQualification =
																			bks.getQualification() ;
																			String aModule = bks.getModule();
																			String aSpecification =
																			bks.getSpecification();

																			if(aamountPaid.equals("")){

																			aamountPaid = "Not paid.";
																			}

																			String anumSessions = bks.getSessions();

																			if(anumSessions.equals("")){

																			anumSessions = "Not Selected.";
																			}

																			
																			LocalDateTime createdAt = bks.getCreatedAt();

																			
																			DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");

																			
																			String formattedTimestamp = "N/A"; 

																			
																			if (createdAt != null) {
																				formattedTimestamp = createdAt.format(dateFormat);
																			}



																			if(aStatus.equalsIgnoreCase("approved")){


																			%>
																			<tr>
																				<th>
																					<%= aName %>
																						<%= aSurname %>
																				</th>
																				<th>
																					<%= aEmail %>
																				</th>
																				<th>
																					<%= aTutoringOption %>
																				</th>
																				<th>
																					<%= aTutorName%>
																				</th>
																				
																				<th>
																					<%= aStatus %>
																				</th>

																				<th>
																					<%= formattedTimestamp %>
																				</th>
																				<th>

																					<a href="#" class="view"
																						data-toggle="modal"
																						data-target="#bookingModal"
																						data-name="<%= aName %> <%= aSurname %>"
																						data-phone="<%= aPhone %> "
																						data-email="<%= aEmail %> "
																						data-country="<%= aCountry %> "
																						data-province="<%= aProvince %> "
																						data-language="<%= aInstrLanguage %> "
																						data-tutoringfor="<%= aTutorFor %> "
																						data-helpwith="<%= aHelpWith %> "
																						data-sname="<%= aSchName %> "
																						data-ssurname="<%= aSchSurname %> "
																						data-sgrade="<%= aSchGrade %> "
																						data-ssyllabus="<%= aSchSyllabus %> "
																						data-ssubject="<%= aSubject %> "
																						data-syear="<%= anYear%> "
																						data-uname="<%= anName %> "
																						data-usurname="<%= anSurname %>"
																						data-address="<%= aAddress %>"
																						data-suburb="<%= aSuburb %>"
																						data-message="<%= aMessage %>"
																						data-status="<%= aStatus %>"
																						data-tutorname="<%= aTutorName %>"
																						data-tutoremail="<%= aTutorEmail %>"
																						data-tutoropt="<%= aTutoringOption %>"
																						data-secondopt="<%= aTutorOption %>"
																						data-package="<%= aPackage %>"
																						data-session="<%= anumSessions %>"
																						data-paid="<%= aamountPaid %>"
																						data-qualification="<%= aQualification %>"
																						data-module="<%= aModule %>"
																						data-specification="<%= aSpecification %>">
																						<i class="material-icons"
																							data-toggle="tooltip"
																							title="View">&#xE8F4;</i>
																					</a>

																				</th>
																			</tr>

																			<% } } } else { %>
																				<tr>
																					<th>No Tutor yet..</th>
																				</tr>
																				<% } %>

																</tbody>
															</table>
														</div>
													</div>

												</div>



												<!--Approved Booking Panel-->

												<!--View Booking modal-->

												<!-- Modal Structure -->
												<div id="bookingModal" class="modal fade" tabindex="-1" role="dialog"
													aria-labelledby="bookingModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="bookingModalLabel">Booking
																	Details</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<!-- Applicant Section -->
																	<div class="col-md-6">
																		<h5>Applicant</h5>
																		<p><strong>Name:</strong> <span
																				id="modalName"></span></p>
																		<p><strong>Email:</strong> <span
																				id="modalEmail"></span></p>
																		<p><strong>Phone:</strong> <span
																				id="modalPhone"></span></p>
																		<p><strong>Country:</strong> <span
																				id="modalCountry"></span></p>
																		<p><strong>Province:</strong> <span
																				id="modalProvince"></span></p>
																		<p><strong>Language oF Instruction:</strong>
																			<span id="modalLanguage"></span></p>
																		<p><strong>Package Type:</strong> <span
																				id="modalPackage"></span></p>
																	</div>
																	<!-- Student Details Section -->
																	<div class="col-md-6">
																		<h5>Student Details</h5>
																		<p><strong>Tutoring For:</strong> <span
																				id="modalTutoringFor"></span></p>
																		<p><strong>Help with:</strong> <span
																				id="modalHelpWith"></span></p>
																		<p><strong>Student Name:</strong> <span
																				id="modalStudName"></span></p>
																		<p><strong>Student Surname:</strong> <span
																				id="modalStudSurname"></span></p>
																		<p id="schGrade"><strong>Grade:</strong> <span
																				id="modalGrade"></span></p>
																		<p id="schSyllabus"><strong>Syllabus:</strong>
																			<span id="modalSyllabus"></span></p>
																		<p id="schSubject"><strong>Subject:</strong>
																			<span id="modalSubject"></span></p>
																		<p id="unvYear"><strong>Year:</strong> <span
																				id="modalYear"></span></p>

																		<!--University addition-->
																		<p id="unvQualification">
																			<strong>Qualification:</strong> <span
																				id="modalQualification"></span></p>
																		<p id="unvModule"><strong>Module:</strong> <span
																				id="modalModule"></span></p>
																		<p id="unvSpecification">
																			<strong>Specification:</strong> <span
																				id="modalSpecification"></span></p>
																		<!--University addition-->
																	</div>
																</div>
																<!-- Message Section -->
																<div class="row">
																	<div class="col-md-6">
																		<h5>Process</h5>
																		<p><strong>Booking Message:</strong> <span
																				id="modalMessage"></span></p>
																		<p><strong>Status:</strong><span
																				id="modalStatus"></span></p>
																		<p><strong>Platform:</strong><span
																				id="modalPlatform"></span></p>
																		<p id="fOne"><strong>Suburb:</strong><span
																				id="modalSuburb"></span></p>
																		<p id="fSec"><strong>Address:</strong><span
																				id="modalAddress"></span></p>
																		<p><strong>Amount Paid:</strong><span
																				id="modalAmountPaid"></span></p>
																		<p><strong>Sessions:</strong><span
																				id="modalSessions"></span></p>


																	</div>

																	<div class="col-md-6">
																		<h5>Tutor</h5>
																		<p><strong>Tutor Name:</strong> <span
																				id="modalTutorName"></span></p>
																		<p><strong>Tutor Email:</strong> <span
																				id="modalTutorEmail"></span></p>
																		<p><strong>Second Tutor Option?</strong> <span
																				id="modalSecondOpt"></span></p>
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Close</button>
															</div>
														</div>
													</div>
												</div>

												<!--View Booking modal-->

													<!-- Tutor Application Modal -->
													<div id="registeredTutorModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="bookingModalLabel">Tutor Application Details</h5>
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
	
	
																<div class="modal-body">
																	<div class="row">
																		<!-- Applicant Section -->
																		<div class="col-md-6">
																			<h5>Applicant Details</h5>
																			<p><strong>Name:</strong> <span id="cmodalName"></span></p>
																			<p><strong>Surname:</strong> <span id="cmodalSurname"></span></p>
																			<p><strong>Email:</strong> <span id="cmodalEmail"></span></p>
																			<p><strong>Phone:</strong> <span id="cmodalPhone"></span></p>
																			<p><strong>Country:</strong> <span id="cmodalCountry"></span></p>
																			<p><strong>Date of Birth:</strong> <span id="cmodalDob"></span></p>
																		</div>
																		<!-- Experience Section -->
																		<div class="col-md-6">
																			<h5>Experience</h5>
																			<p><strong>Experience:</strong> <span id="cmodalExperience"></span></p>
																			<p><strong>Area:</strong> <span id="cmodalArea"></span></p>
																			<p><strong>Province:</strong> <span id="cmodalProvince"></span></p>
																			<p><strong>Address:</strong> <span id="bModalAddress"></span></p>
	
																			
																		</div>
																	</div>
																	<!-- Message Section -->
																	<div class="row">
																		<div class="col-md-6">
																			<h5>Subjects and Qualifications</h5>
																			<p><strong>Subjects:</strong> <span id="cmodalSubjects"></span></p>
																			<p><strong>Grades:</strong> <span id="cmodalGrades"></span></p>
																			<p><strong>Syllabus:</strong> <span id="cmodalSyllabus"></span></p>
																			<p><strong>Tutor Options:</strong> <span id="cmodalTutorOptions"></span></p>
	
	
																		</div>
	
																		<div class="col-md-6">
																			<h5>Qualifications </h5>
																			<p><strong>Qualification:</strong> <span id="cmodalQualification"></span></p>
																			<p><strong>Specification:</strong> <span id="cmodalSpecification"></span></p>
																			<p><strong>Achievements:</strong> <span id="amodalAchievements"></span></p>
																			
																		</div>
																	</div>
	
																	<!--Documents-->
																	<div class="row">

																		<div class="col-md-6">
																			<h5>About and Bio</h5>
																			
																			<p><strong>Bio:</strong> <span id="cmodalBio"></span></p>
																			<p><strong>About:</strong> <span id="cmodalAbout"></span></p>
																		</div>


																		<div class="col-md-6">
																			<h5>Documents</h5>
																			<p>
																				<strong>CV:</strong>
																				<a href="#" id="cmodalCvLink" download class="green-link">View CV</a>
																			</p>
																			<p>
																				<strong>Education:</strong>
																				<a href="#" id="cmodalEducationLink" download class="green-link">View Qualifications</a>
																			</p>
																			<p>
																				<strong>ID Passport:</strong>
																				<a href="#" id="cmodalIdPassportLink" download class="green-link">View ID</a>
																			</p>
																			<p>
																				<strong>Image:</strong>
																				<a href="#" id="cmodalImageLink" download class="green-link">View Tutor's Image</a>
																			</p><br>
																		</div>
	
																		
																	</div>
																</div>
	
	
																

																<form action="/add-accepted-tutor" method="post" enctype="multipart/form-data">
																<div class="modal-footer">
																
																	<input type="hidden" id="rProfile" name="rProfile" class="form-control"/>
																	<input type="hidden" id="rName" name="rName" class="form-control"/>
																	<input type="hidden" id="rID" name="rID" class="form-control"/>
																	<input type="hidden" id="rEmail" name="rEmail" class="form-control"/>
																	<input type="hidden" id="rPhone" name="rPhone" class="form-control"/>
																	<input type="hidden" id="rSubjects" name="rSubjects" class="form-control"/>
																	<input type="hidden" id="rGrades" name="rGrades" class="form-control"/>
																	<input type="hidden" id="rSyllabus" name="rSyllabus" class="form-control"/>
																	<input type="hidden" id="rTutorOption" name="rTutorOption" class="form-control"/>
																	<input type="hidden" id="rAddress" name="rAddress" class="form-control"/>
																	<input type="hidden" id="rQualification" name="rQualification" class="form-control"/>
																	<input type="hidden" id="rAchievements" name="rAchievements" class="form-control"/>
																	<input type="hidden" id="rAbout" name="rAbout" class="form-control"/>
																	<input type="hidden" id="rHours" name="rHours" class="form-control"/>
																	<input type="hidden" id="rArea" name="rArea" class="form-control"/>
																	<input type="hidden" id="rCountry" name="rCountry" class="form-control"/>
																	<input type="date" id="rDOB" name="rDOB" class="toUse"/>
																	<input type="hidden" id="rSurname" name="rSurname" class="form-control"/>
																	<input type="hidden" id="rModules" name="rModules" class="form-control"/>
																	<input type="hidden" id="rExp" name="rExp" class="form-control"/>
																	<button  type="submit" class="btn btn-danger" form="myFormform" id="uns" onclick="unsuccessfulApp()">Delete</button>
																	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
																	<button type="submit" class="btn btn-success" id="praise" onclick="sendOut()">Accept</button>
																
																</div>

															</form>
															</div>
														</div>
													</div>
													
													
													<form id="myFormform" action="/deleteApplicant" method="post"> 
													   <input type="hidden" id="emailApplicant" name="emailApplicant" required>
													</form>		
								  
												<!--View Reviews Modal-->

												<div id="reviewModal" class="modal fade" tabindex="-1" role="dialog"
													aria-labelledby="bookingModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="bookingModalLabel">Review
																</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>

															<form action="/approve-review" method="post">
																<div class="modal-body">
																	<div class="row">
																		<!-- Applicant Section -->
																		<div class="col-md-6">

																			<p><strong>Name:</strong> <span
																					id="modalNameReview"></span></p>
																			<p><strong>Message:</strong> <span
																					id="modalMessageReview"></span></p>
																			<p><strong>Rating:</strong> <span
																					id="modalRatingReview"></span></p>
																			<input type="hidden" id="rEntryId"
																				name="rEntryId" />
																			<input type="hidden" id="rTutorEmail"
																				name="rTutorEmail" />
																		</div>

																	</div>

																</div>
																<div class="modal-footer">
																	<button  type="submit" class="btn btn-danger" form="deleteReview" id="dr" onclick="deleteReview()">Delete</button>
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>
																	<button class="btn btn-success"
																		type="submit" id="dc">Accept</button>
																</div>
															</form>

														</div>
													</div>
												</div>
												
												
												<form id="deleteReview" action="/deleteReview" method="post"> 
												 <input type="hidden" id="entryReview" name="entryReview" required>
												</form>	

												<!--View Reviews Modal-->


												<!--CONSULTATION MODAL-->

												<div id="consultationModal" class="modal fade" tabindex="-1"
													role="dialog" aria-labelledby="bookingModalLabel"
													aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="bookingModalLabel">
																	Consultant Details</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<!-- Applicant Section -->
																	<div class="col-md-6">
																		<h5>Applicant</h5>
																		<p><strong>Name:</strong> <span
																				id="cmodalNameB"></span></p>
																		<p><strong>Email:</strong> <span
																				id="cmodalEmailB"></span></p>
																		<p><strong>Phone:</strong> <span
																				id="cmodalPhoneB"></span></p>
																		<p><strong>Country:</strong> <span
																				id="cmodalCountryB"></span></p>
																		<p><strong>Province:</strong> <span
																				id="cmodalProvinceB"></span></p>
																		<p><strong>Language oF Instruction:</strong>
																			<span id="cmodalLanguage"></span></p>
																		<p><strong>Package Type:</strong> <span
																				id="cmodalPackage"></span></p>
																	</div>
																	<!-- Student Details Section -->
																	<div class="col-md-6">
																		<h5>Student Details</h5>
																		<p><strong>Tutoring For:</strong> <span
																				id="cmodalTutoringFor"></span></p>
																		<p><strong>Help with:</strong> <span
																				id="cmodalHelpWith"></span></p>
																		<p><strong>Student Name:</strong> <span
																				id="cmodalStudName"></span></p>
																		<p><strong>Student Surname:</strong> <span
																				id="cmodalStudSurname"></span></p>
																		<p id="cschGrade"><strong>Grade:</strong> <span
																				id="cmodalGrade"></span></p>
																		<p id="cschSyllabus"><strong>Syllabus:</strong>
																			<span id="cmodalSyllabusB"></span></p>
																		<p id="csSubject"><strong>Subject:</strong>
																			<span id="cmodalSubject"></span></p>
																		<p id="cunvYear"><strong>Year:</strong> <span
																				id="cmodalYear"></span></p>
																		<!--University addition-->
																		<p id="cunvQualification">
																			<strong>Qualification:</strong> <span
																				id="cmodalQualification"></span></p>
																		<p id="cunvModule"><strong>Module:</strong>
																			<span id="cmodalModule"></span></p>
																		<p id="cunvSpecification">
																			<strong>Specification:</strong> <span
																				id="cmodalSpecification"></span></p>
																		<!--University addition-->
																	</div>
																</div>
																<!-- Message Section -->
																<div class="row">
																	<div class="col-md-6">
																		<h5>Process</h5>
																		<p><strong>Booking Message:</strong> <span
																				id="cmodalMessage"></span></p>
																		<p><strong>Status:</strong><span
																				id="cmodalStatus"></span></p>
																		<p><strong>Platform:</strong><span
																				id="cmodalPlatform"></span></p>
																		<p id="cfOne"><strong>Suburb:</strong><span
																				id="cmodalSuburb"></span></p>
																		<p id="cfSec"><strong>Address:</strong><span
																				id="cmodalAddress"></span></p>
																	</div>

																	<div class="col-md-6">
																		<h5>Tutor</h5>
																		<p><strong>Tutor Name:</strong> <span
																				id="cmodalTutorName"></span></p>
																		<p><strong>Tutor Email:</strong> <span
																				id="cmodalTutorEmail"></span></p>
																		<p><strong>Second Tutor Option?</strong> <span
																				id="cmodalSecondOpt"></span></p>
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<form action="/deleteConsult" method="post">
																	<div class="modal-body">
																		<p>Before you remove the consultant, make sure
																			you have reach to.</p>
																		<input type="hidden" name="deleteEmailConsult"
																			id="deleteEmailConsult" />
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-dismiss="modal">Close</button>
																		<button type="submit" class="btn btn-danger"
																			onclick="confirmDeletionConsult()">Delete</button>
																	</div>
																</form>

															</div>
														</div>
													</div>
												</div>


												<!--CONSULTATION MODAL-->


												<!--OTHER MODAL-->


												<div id="otherModal" class="modal fade" tabindex="-1" role="dialog"
													aria-labelledby="bookingModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="bookingModalLabel">Other
																	Details</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<!-- Applicant Section -->
																	<div class="col-md-6">
																		<h5>Applicant</h5>
																		<p><strong>Name:</strong> <span
																				id="omodalName"></span></p>
																		<p><strong>Email:</strong> <span
																				id="omodalEmail"></span></p>
																		<p><strong>Phone:</strong> <span
																				id="omodalPhone"></span></p>
																		<p><strong>Country:</strong> <span
																				id="omodalCountry"></span></p>
																		<p><strong>Province:</strong> <span
																				id="omodalProvince"></span></p>
																		<p><strong>Language oF Instruction:</strong>
																			<span id="omodalLanguage"></span></p>
																		<p><strong>Package Type:</strong> <span
																				id="omodalPackage"></span></p>
																	</div>
																	<!-- Student Details Section -->
																	<div class="col-md-6">
																		<h5>Student Details</h5>
																		<p><strong>Tutoring For:</strong> <span
																				id="omodalTutoringFor"></span></p>
																		<p><strong>Help with:</strong> <span
																				id="omodalHelpWith"></span></p>
																		<p><strong>Student Name:</strong> <span
																				id="omodalStudName"></span></p>
																		<p><strong>Student Surname:</strong> <span
																				id="omodalStudSurname"></span></p>
																		<p id="oschGrade"><strong>Grade:</strong> <span
																				id="omodalGrade"></span></p>
																		<p id="oschSyllabus"><strong>Syllabus:</strong>
																			<span id="omodalSyllabus"></span></p>
																		<p><strong>Subject:</strong> <span
																				id="omodalSubject"></span></p>
																		<p id="ounvYear"><strong>Year:</strong> <span
																				id="omodalYear"></span></p>
																		<!--University addition-->
																		<p id="ounvQualification">
																			<strong>Qualification:</strong> <span
																				id="omodalQualification"></span></p>
																		<p id="ounvModule"><strong>Module:</strong>
																			<span id="omodalModule"></span></p>
																		<p id="ounvSpecification">
																			<strong>Specification:</strong> <span
																				id="omodalSpecification"></span></p>
																		<!--University addition-->
																	</div>
																</div>
																<!-- Message Section -->
																<div class="row">
																	<div class="col-md-6">
																		<h5>Process</h5>
																		<p><strong>Booking Message:</strong> <span
																				id="omodalMessage"></span></p>
																		<p><strong>Status:</strong><span
																				id="omodalStatus"></span></p>
																		<p><strong>Platform:</strong><span
																				id="omodalPlatform"></span></p>
																		<p id="ofOne"><strong>Suburb:</strong><span
																				id="omodalSuburb"></span></p>
																		<p id="ofSec"><strong>Address:</strong><span
																				id="omodalAddress"></span></p>
																	</div>

																	<div class="col-md-6">
																		<h5>Tutor</h5>
																		<p><strong>Tutor Name:</strong> <span
																				id="omodalTutorName"></span></p>
																		<p><strong>Tutor Email:</strong> <span
																				id="omodalTutorEmail"></span></p>
																		<p><strong>Second Tutor Option?</strong> <span
																				id="omodalSecondOpt"></span></p>
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<form action="/deleteOther" method="post">
																	<div class="modal-body">
																		<p>Before you remove the applicant, make sure
																			you have reach to.</p>
																		<input type="hidden" name="deleteEmailOther"
																			id="deleteEmailOther" />
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-dismiss="modal">Close</button>
																		<button type="submit" class="btn btn-danger"
																			onclick="confirmDeletionOther()">Delete</button>
																	</div>
																</form>
															</div>
														</div>
													</div>
												</div>


												<!--OTHER MODAL-->

												<!--MATRIC REGISTERED MODAL-->


												<div id="registeredModal" class="modal fade" tabindex="-1" role="dialog"
													aria-labelledby="bookingModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="bookingModalLabel">Registered Student Details</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<!-- Applicant Section -->
																	<div class="col-md-6">
																		<h5>Personal Information</h5>
																		<p><strong>Name:</strong> <span
																				id="mFullName"></span></p>
																		<p><strong>Email:</strong> <span
																				id="mEmail"></span></p>
																		<p><strong>Phone:</strong> <span
																				id="mMobile"></span></p>
																		
																		<p><strong>ID/Passport:</strong> <span
																				id="mID"></span></p>
																		<p><strong>Gender:</strong>
																			<span id="mGender"></span></p>
																	
																	</div>
																	<!-- Student Details Section -->
																	<div class="col-md-6">
																		<h5>Course Information</h5>
																		<p><strong>Province:</strong> <span
																				id="mProvince"></span></p>
																		<p><strong>Subjects:</strong> <span
																				id="mSubjects"></span></p>
																		<p><strong>When To Start:</strong> <span
																				id="mStartDate"></span></p>
																		<p><strong>Available:</strong> <span
																				id="mAvailability"></span></p>
																	
																	</div>
																</div>
																<!-- Message Section -->
																<div class="row">
																	<div class="col-md-6">
																		<h5>Process</h5>
																		<p><strong>Message:</strong> <span
																				id="mMessage"></span></p>
																		<p><strong>Status:</strong><span
																				id="mStatus"></span></p>
																		<p id="mmPackage"><strong>Package:</strong><span
																				id="mPackage"></span></p>
																		
																	</div>

																</div>
															</div>
															<div class="modal-footer">
																<!--<form action="/deleteOther" method="post">-->
																	<div class="modal-body">
																		<!--<p>Before you remove the applicant, make sure
																			you have reach to.</p>-->
																		<input type="hidden" name="deleteEmailOther"
																			id="deleteEmailOther" />
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-dismiss="modal">Close</button>
																		<!--<button type="submit" class="btn btn-danger"
																			onclick="confirmDeletionOther()">Delete</button> -->
																	</div>
																</form>
															</div>
														</div>
													</div>
												</div>


												<!--MATRIC REGISTERED  MODAL-->




												<!--Start MAThS CONSULTATIONS  MODAL-->


												<div id="ConsultantModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="consultantModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="consultantModalLabel">Maths Consultations</h5>
																<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<!-- Parent Information -->
																	<div class="col-md-6">
																		<h5>Parent Information</h5>
																		<p><strong>Parent Name:</strong> <span id="ConsultantParentName"></span></p>
																		<p><strong>Parent Email:</strong> <span id="ConsultantParentEmail"></span></p>
																		<p><strong>Parent Phone:</strong> <span id="ConsultantParentPhone"></span></p>
																	</div>
												
																	<!-- Student Information -->
																	<div class="col-md-6">
																		<h5>Student Information</h5>
																		<p><strong>Student Name:</strong> <span id="ConsultantStudentName"></span></p>
																		<p><strong>Grade:</strong> <span id="ConsultantGrade"></span></p>
																		<p><strong>Subject:</strong> <span id="ConsultantSubject"></span></p>
																	</div>
												
																	<!-- Additional Course Information -->
																	<div class="col-md-12">
																		<h5>Course Information</h5>
																		<p><strong>Curriculum:</strong> <span id="ConsultantCurriculum"></span></p>
																		<p><strong>Marks:</strong> <span id="ConsultantMarks"></span></p>
																		<p><strong>Message:</strong> <span id="ConsultantMessage"></span></p>
																		<p><strong>Status:</strong> <span id="ConsultantStatus"></span></p> 
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
															</div>
														</div>
													</div>
												</div>
												



												<!--End MAThS CONSULTATIONS  MODAL-->




												<!-- maths registered panel-->

												<div id="registeredMathsClassModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="registeredMathsClassModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="registeredMathsClassModalLabel">Registered Maths Class Details</h5>
																<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<!-- Personal Information -->
																	<div class="col-md-6">
																		<h5>Personal Information</h5>
																		<p><strong>Parent Name:</strong> <span id="RegisteredParentName"></span></p>
																		<p><strong>Parent Surname:</strong> <span id="RegisteredParentSurname"></span></p>
																		<p><strong>Parent Email:</strong> <span id="RegisteredParentEmail"></span></p>
																		<p><strong>Parent Phone:</strong> <span id="RegisteredParentPhone"></span></p>
																		<p><strong>Student Name:</strong> <span id="RegisteredStudentName"></span></p>
																		<p><strong>Student Surname:</strong> <span id="RegisteredStudentSurname"></span></p>
																	</div>
																	<!-- Course Information -->
																	<div class="col-md-6">
																		<h5>Course Information</h5>
																		<p><strong>Grade:</strong> <span id="RegisteredGrade"></span></p>
																		<p><strong>Subject:</strong> <span id="RegisteredSubject"></span></p>
																		<p><strong>Status:</strong> <span id="RegisteredStatus"></span></p>
																	</div>
																</div>
																<div class="row">
																	<!-- Additional Information -->
																	<div class="col-md-12">
																		<h5>Additional Information</h5>
																		<p><strong>Curriculum:</strong> <span id="RegisteredCurriculum"></span></p>
																		<p><strong>Marks:</strong> <span id="RegisteredMarks"></span></p>
																		<p><strong>Message:</strong> <span id="RegisteredMessage"></span></p>
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
															</div>
														</div>
													</div>
												</div>
												
												

												<!--End registered maths panel -->






												<!--Search Panel-->

												<div class="row" id="searchPanel">
													<div class="col-md-12">
														<div class="table-wrapper">

															<div class="table-title">
																<div class="row">
																	<div
																		class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
																		<h2 class="ml-lg-2">Search Result</h2>
																	</div>

																</div>
															</div>

															<table class="table table-striped table-hover">
																<thead>
																	<tr>

																		<th>Name</th>
																		<th>Email</th>
																		<th>Availability</th>
																		<th>Address</th>
																		<th>Phone Number</th>
																		<th>Actions</th>
																	</tr>
																</thead>

																<tbody>

																	<th>
																		<span id="searchName"></span>
																	</th>
																	<th>
																		<span id="searchEmail"></span>
																	</th>
																	<th>
																		<span id="searchAvail"></span>
																	</th>
																	<th>
																		<span id="searchLocation"></span>
																	</th>
																	<th>
																		<span id="searchPhone"></span>
																	</th>
																	<th>

																		<a href="#editEmployeeModal" class="edit">
																			<i class="material-icons"
																				data-toggle="tooltip"
																				title="Edit">&#xE254;</i>
																		</a>

																		<a href="#deleteEmployeeModal" class="delete"
																			data-toggle="modal">
																			<i class="material-icons"
																				data-toggle="tooltip"
																				title="Delete">&#xE872;</i>
																		</a>

																	</th>


																</tbody>
															</table>
														</div>
													</div>
												</div>


												<!--Search Panel-->





												<!------main-content-end----------->



											</div>


											<script src="js/jquery-3.3.1.slim.min.js"></script>
											<script src="js/popper.min.js"></script>
											<script src="js/bootstrap.min.js"></script>
											<script src="js/jquery-3.3.1.min.js"></script>
											<script type="text/javascript">

												$('a.delete').on('click', function () {
													// Get the email from the data attribute
													var email = $(this).data('email');

													var deleteEmail = document.getElementById('deleteEmail');
													deleteEmail.value = email;
													deleteEmail.placeholder = email;

													// Set the email in the modal
													$('#emailToDelete').text(email);
												});


												$(document).ready(function () {
													$('a.registeredView').on('click', function () {

                                                        /*Consultations*/
														var statusIdSend = $(this).data('cmentry');
														var checkStatus = "matricView"+statusIdSend;
														
														
															var matricView = document.getElementById(checkStatus); 


															if (matricView) {
																matricView.innerText = "Opened";
																matricView.style.color = "green";
																matricView.style.fontWeight = "bold";
															}

															/*Registered*/

													   var checkStatusR = "matricViewR"+statusIdSend;
														
														
														var matricViewR = document.getElementById(checkStatusR); 


														if (matricViewR) {
															matricViewR.innerText = "Opened";
															matricViewR.style.color = "green";
															matricViewR.style.fontWeight = "bold";
														}

														

														const dataToSend = {
															 status: statusIdSend
														};

														fetch('/update-view-status', { 
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



														var name = $(this).data('mname');
														var email = $(this).data('memail');
														var phone = $(this).data('mmobile');

														var id = $(this).data('mid');
														var gender = $(this).data('mgender');
														var province = $(this).data('mprovince');

														var writingDate = $(this).data('mwritingdate');
														var subjects = $(this).data('msubjects');
														var available = $(this).data('mavailability');

														var message = $(this).data('mmessage');
														var status = $(this).data('mstatus');
														
														$('#mFullName').text(name);
														$('#mEmail').text(email);
														$('#mMobile').text(phone);
														$('#mID').text(id);
														$('#mGender').text(gender);

														$('#mProvince').text(province);
														$('#mSubjects').text(subjects);
														$('#mStartDate').text(writingDate);
														$('#mAvailability').text(available);
														$('#mMessage').text(message);

														$('#mStatus').text(status);

														var subjectsArray = subjects.split(",");


														if(status !== "paid"){

															document.getElementById("mmPackage").style.display = 'none';
															$('#mPackage').hide();

														}

														  else{

															if (subjectsArray.length === 1) {
																document.getElementById("mmPackage").style.display = 'block';
                                                                $('#mPackage').text("1 Subject : R550").show();
															}
															else{
																if (subjectsArray.length === 2) {
																	document.getElementById("mmPackage").style.display = 'block';
                                                                $('#mPackage').text("2 Subjects : R1050").show();
															  }
															  else{
																if (subjectsArray.length === 3) {
																	document.getElementById("mmPackage").style.display = 'block';
                                                                $('#mPackage').text("3 Subjects : R1550").show();
															}
															else{
																if (subjectsArray.length === 4) {
																	document.getElementById("mmPackage").style.display = 'block';
																	$('#mPackage').text("4 Subjects : R1950").show();
															}
															else{
																if (subjectsArray.length === 5) {
																	document.getElementById("mmPackage").style.display = 'block';
																	$('#mPackage').text("5 Subjects : R2350").show();
															}
															else{
																if (subjectsArray.length === 6) {
																	document.getElementById("mmPackage").style.display = 'block';
																	$('#mPackage').text("6 Subjects : R2750").show();
															}
															else{
																if (subjectsArray.length === 7) {
																	document.getElementById("mmPackage").style.display = 'block';
																	$('#mPackage').text("7 Subjects : R3300").show();
															}
															

															}
															
														}}}}}
														  }

												
														});



													});


												$(document).ready(function () {
													$('a.consultView').on('click', function () {

														$('#cmodalStudName').hide();
														$('#cmodalStudSurname').hide();
														$('#cmodalGrade').hide();
														$('#cmodalSyllabus').hide();
														$('#cmodalSubject').hide();
														$('#cmodalYear').hide();
														$('#cunvQualification').hide();
														$('#cunvYear').hide();

														$('#cschGrade').hide();
														$('#cschSyllabus').hide();
														$('#csSubject').hide();


														$('#cunvModule').hide();
														$('#cunvSpecification').hide();

														// Get data from attributes
														var name = $(this).data('name');
														var email = $(this).data('email');
														var phone = $(this).data('phone');
														var country = $(this).data('country');
														var province = $(this).data('province');
														var language = $(this).data('language');
														var tutoringFor = $(this).data('tutoringfor');
														var helpWith = $(this).data('helpwith');
														var sName = $(this).data('sname');
														var sSurname = $(this).data('ssurname');
														var uName = $(this).data('uname');
														var uSurname = $(this).data('usurname');
														var sGrade = $(this).data('sgrade');
														var sSyllabus = $(this).data('ssyllabus');
														var sSubject = $(this).data('ssubject');
														var sYear = $(this).data('syear');
														var tutorOpt = $(this).data('tutoropt');
														var address = $(this).data('address');
														var suburb = $(this).data('suburb');
														var message = $(this).data('message');
														var status = $(this).data('status');
														var tutorName = $(this).data('tutorname');
														var tutorEmail = $(this).data('tutoremail');
														var secondOpt = $(this).data('secondopt');
														var package = $(this).data('package');
														var cIs = $(this).data('sid');

														var qualification = $(this).data('cqualification');
														var module = $(this).data('cmodule');
														var specification = $(this).data('cspecification');

														var deleteEmailConsult = document.getElementById('deleteEmailConsult');
														deleteEmailConsult.value = cIs;
														deleteEmailConsult.placeholder = cIs;


														// Populate modal with the data
														$('#cmodalNameB').text(name);
														$('#cmodalEmailB').text(email);
														$('#cmodalPhoneB').text(phone);
														$('#cmodalCountryB').text(country);
														$('#cmodalProvinceB').text(province);
														$('#cmodalLanguage').text(language);
														$('#cmodalTutoringFor').text(tutoringFor);
														$('#cmodalHelpWith').text(helpWith);

														$('#cmodalQualification').text(qualification);
														$('#cmodalModule').text(module);
														$('#cmodalSpecification').text(specification);

														helpWith = helpWith.replace(/\s+/g, '');
														tutorOpt = tutorOpt.replace(/\s+/g, '');

														if (helpWith === "school") {
															// Set values for the modal fields and show them
															$('#cschGrade').show();
															$('#cschSyllabus').show();
															$('#csSubject').show();
															$('#cmodalStudName').text(sName).show();
															$('#cmodalStudSurname').text(sSurname).show();
															$('#cmodalGrade').text(sGrade).show();
															$('#cmodalSyllabusB').text(sSyllabus).show();
															$('#cmodalSubject').text(sSubject).show();
															schGrade.style.display = 'block';
															schSyllabus.style.display = 'block';

														} else {
															// Set values for the modal fields and show them

															$('#cmodalStudName').text(uName).show();
															$('#cmodalStudSurname').text(uSurname).show();
															$('#cmodalYear').text(sYear).show();
															$('#cmodalSubject').text(sSubject).show();
															$('#cunvYear').show();

															$('#cunvQualification').show();
															$('#cunvModule').show();
															$('#cunvSpecification').show();

														}

														$('#cmodalPlatform').text(tutorOpt);
														$('#cmodalAddress').text(address);
														$('#cmodalSuburb').text(suburb);

														if (tutorOpt === "Online") {

															var addrSub = document.getElementById('cfOne');
															addrSub.style.display = 'none';
															var subAdrr = document.getElementById('cfSec');
															subAdrr.style.display = 'none';
														}

														else {

															var addrSub = document.getElementById('cfOne');
															addrSub.style.display = 'block';
															var subAdrr = document.getElementById('cfSec');
															subAdrr.style.display = 'block';
														}

														$('#cmodalMessage').text(message);
														$('#cmodalStatus').text(status);
														$('#cmodalTutorName').text(tutorName);
														$('#cmodalTutorEmail').text(tutorEmail);
														$('#cmodalSecondOpt').text(secondOpt);
														$('#cmodalPackage').text(package);


													});
												});



												$(document).ready(function () {

													$('a.otherView').on('click', function () {

														$('#omodalStudName').hide();
														$('#omodalStudSurname').hide();
														$('#omodalGrade').hide();
														$('#omodalSyllabus').hide();
														$('#omodalSubject').hide();
														$('#omodalYear').hide();

														$('#ounvQualification').hide();
														$('#ounvYear').hide();

														$('#ounvModule').hide();
														$('#ounvSpecification').hide();


														// Get data from attributes
														var name = $(this).data('name');
														var email = $(this).data('email');
														var phone = $(this).data('phone');
														var country = $(this).data('country');
														var province = $(this).data('province');
														var language = $(this).data('language');
														var tutoringFor = $(this).data('tutoringfor');
														var helpWith = $(this).data('helpwith');
														var sName = $(this).data('sname');
														var sSurname = $(this).data('ssurname');
														var uName = $(this).data('uname');
														var uSurname = $(this).data('usurname');
														var sGrade = $(this).data('sgrade');
														var sSyllabus = $(this).data('ssyllabus');
														var sSubject = $(this).data('ssubject');
														var sYear = $(this).data('syear');
														var tutorOpt = $(this).data('tutoropt');
														var address = $(this).data('address');
														var suburb = $(this).data('suburb');
														var message = $(this).data('message');
														var status = $(this).data('status');
														var tutorName = $(this).data('tutorname');
														var tutorEmail = $(this).data('tutoremail');
														var secondOpt = $(this).data('secondopt');
														var package = $(this).data('package');

														var qualification = $(this).data('oqualification');
														var module = $(this).data('omodule');
														var specification = $(this).data('ospecification');

														var cIs = $(this).data('oid');

														var deleteEmailOther = document.getElementById('deleteEmailOther');
														deleteEmailOther.value = cIs;
														deleteEmailOther.placeholder = cIs;


														// Populate modal with the data
														$('#omodalName').text(name);
														$('#omodalEmail').text(email);
														$('#omodalPhone').text(phone);
														$('#omodalCountry').text(country);
														$('#omodalProvince').text(province);
														$('#omodalLanguage').text(language);
														$('#omodalTutoringFor').text(tutoringFor);
														$('#omodalHelpWith').text(helpWith);

														$('#omodalQualification').text(qualification);
														$('#omodalModule').text(module);
														$('#omodalSpecification').text(specification);

														helpWith = helpWith.replace(/\s+/g, '');
														tutorOpt = tutorOpt.replace(/\s+/g, '');

														if (helpWith === "school") {
															// Set values for the modal fields and show them
															$('#omodalStudName').text(sName).show();
															$('#omodalStudSurname').text(sSurname).show();
															$('#omodalGrade').text(sGrade).show();
															$('#omodalSyllabus').text(sSyllabus).show();
															$('#omodalSubject').text(sSubject).show();
															schGrade.style.display = 'block';
															schSyllabus.style.display = 'block';

														} else {
															// Set values for the modal fields and show them

															$('#omodalStudName').text(uName).show();
															$('#omodalStudSurname').text(uSurname).show();
															$('#omodalYear').text(sYear).show();
															$('#omodalSubject').text(sSubject).show();

															$('#ounvYear').show();

															$('#ounvQualification').show();
															$('#ounvModule').show();
															$('#ounvSpecification').show();

														}

														$('#omodalPlatform').text(tutorOpt);
														$('#omodalAddress').text(address);
														$('#omodalSuburb').text(suburb);

														if (tutorOpt === "Online") {

															var addrSub = document.getElementById('ofOne');
															addrSub.style.display = 'none';
															var subAdrr = document.getElementById('ofSec');
															subAdrr.style.display = 'none';
														}

														else {

															var addrSub = document.getElementById('ofOne');
															addrSub.style.display = 'block';
															var subAdrr = document.getElementById('ofSec');
															subAdrr.style.display = 'block';
														}

														$('#omodalMessage').text(message);
														$('#omodalStatus').text(status);
														$('#omodalTutorName').text(tutorName);
														$('#omodalTutorEmail').text(tutorEmail);
														$('#omodalSecondOpt').text(secondOpt);
														$('#omodalPackage').text(package);


													});

												});


												document.getElementById('bookingPanel').style.display = 'none';
												document.getElementById('searchPanel').style.display = 'none';
												document.getElementById('approvedBookingPanel').style.display = 'none';
												document.getElementById('reviewsPanel').style.display = 'none';
												document.getElementById('consultantsPanel').style.display = 'none';
												document.getElementById('othersPanel').style.display = 'none';
												document.getElementById('matricRegisteredPanel').style.display = 'none';
												document.getElementById('cmatricRegisteredPanel').style.display = 'none';
												document.getElementById('mathsRegisteredPanel').style.display="none";
												document.getElementById('consultMathsRegisteredPanel').style.display="none";
												document.getElementById('becomeTutorPanel').style.display="none";

												$(document).ready(function () {
													$(".xp-menubar").on('click', function () {
														$("#sidebar").toggleClass('active');
														$("#content").toggleClass('active');
													});

													$('.xp-menubar,.body-overlay').on('click', function () {
														$("#sidebar,.body-overlay").toggleClass('show-nav');
													});

												});

												var schGrade = document.getElementById('schGrade');
												schGrade.style.display = 'none';
												var schSyllabus = document.getElementById('schSyllabus');
												schSyllabus.style.display = 'none';
												var unvYear = document.getElementById('unvYear');
												unvYear.style.display = 'none';

												/*View Booking Details*/
												$(document).ready(function () {
													// Event listener for the "View" icon
													$('.view').on('click', function () {

														$('#modalStudName').hide();
														$('#modalStudSurname').hide();
														$('#modalGrade').hide();
														$('#modalSyllabus').hide();
														$('#schSubject').hide();

														$('#modalYear').hide();

														$('#unvQualification').hide();
														$('#unvModule').hide();
														$('#unvSpecification').hide();

														// Get data from attributes
														var name = $(this).data('name');
														var email = $(this).data('email');
														var phone = $(this).data('phone');
														var country = $(this).data('country');
														var province = $(this).data('province');
														var language = $(this).data('language');
														var tutoringFor = $(this).data('tutoringfor');
														var helpWith = $(this).data('helpwith');
														var sName = $(this).data('sname');
														var sSurname = $(this).data('ssurname');
														var uName = $(this).data('uname');
														var uSurname = $(this).data('usurname');
														var sGrade = $(this).data('sgrade');
														var sSyllabus = $(this).data('ssyllabus');
														var sSubject = $(this).data('ssubject');
														var sYear = $(this).data('syear');
														var tutorOpt = $(this).data('tutoropt');
														var address = $(this).data('address');
														var suburb = $(this).data('suburb');
														var message = $(this).data('message');
														var status = $(this).data('status');
														var tutorName = $(this).data('tutorname');
														var tutorEmail = $(this).data('tutoremail');
														var secondOpt = $(this).data('secondopt');
														var package = $(this).data('package');
														var ses = $(this).data('session');
														var paid = $(this).data('paid');

														var qualification = $(this).data('qualification');
														var module = $(this).data('module');
														var specification = $(this).data('specification');

														// Populate modal with the data
														$('#modalName').text(name);
														$('#modalEmail').text(email);
														$('#modalPhone').text(phone);
														$('#modalCountry').text(country);
														$('#modalProvince').text(province);
														$('#modalLanguage').text(language);
														$('#modalTutoringFor').text(tutoringFor);
														$('#modalHelpWith').text(helpWith);
														$('#modalAmountPaid').text(paid);
														$('#modalSessions').text(ses);

														$('#modalQualification').text(qualification);
														$('#modalModule').text(module);
														$('#modalSpecification').text(specification);
														$('#modalSubject').text(sSubject);



														helpWith = helpWith.replace(/\s+/g, '');
														tutorOpt = tutorOpt.replace(/\s+/g, '');

														if (helpWith === "school") {
															// Set values for the modal fields and show them
															$('#modalStudName').text(sName).show();
															$('#modalStudSurname').text(sSurname).show();
															$('#modalGrade').text(sGrade).show();
															$('#modalSyllabus').text(sSyllabus).show();
															$('#schSubject').show();
															schGrade.style.display = 'block';
															schSyllabus.style.display = 'block';

														} else {
															// Set values for the modal fields and show them

															$('#modalStudName').text(uName).show();
															$('#modalStudSurname').text(uSurname).show();
															$('#modalYear').text(sYear).show();

															$('#unvYear').show();

															$('#unvQualification').show();
															$('#unvModule').show();
															$('#unvSpecification').show();

														}

														$('#modalPlatform').text(tutorOpt);
														$('#modalAddress').text(address);
														$('#modalSuburb').text(suburb);

														if (tutorOpt === "Online") {

															var addrSub = document.getElementById('fOne');
															addrSub.style.display = 'none';
															var subAdrr = document.getElementById('fSec');
															subAdrr.style.display = 'none';
														}

														else {

															var addrSub = document.getElementById('fOne');
															addrSub.style.display = 'block';
															var subAdrr = document.getElementById('fSec');
															subAdrr.style.display = 'block';
														}

														$('#modalMessage').text(message);
														$('#modalStatus').text(status);
														$('#modalTutorName').text(tutorName);
														$('#modalTutorEmail').text(tutorEmail);
														$('#modalSecondOpt').text(secondOpt);
														$('#modalPackage').text(package);

													});
												});

												function setActive(id) {
													// Remove 'active' class from all list items
													document.querySelectorAll('#sidebar ul li').forEach(function (item) {
														item.classList.remove('active');
													});

													// Add 'active' class to the selected list item
													document.getElementById(id).classList.add('active');
												}

									

												function showTutorPanel() {

													setActive('tutors');
													document.getElementById('bookingPanel').style.display = 'none';
													document.getElementById('reviewsPanel').style.display = 'none';
													document.getElementById('tutorPanel').style.display = 'block';
													document.getElementById('searchPanel').style.display = 'none';
													document.getElementById('searchEemail').style.display = 'block';
													document.getElementById('button-addon2').style.display = 'block';
													document.getElementById('approvedBookingPanel').style.display = 'none';
													document.getElementById('consultantsPanel').style.display = 'none';
													document.getElementById('othersPanel').style.display = 'none';
													document.getElementById('matricRegisteredPanel').style.display = 'none';
													document.getElementById('cmatricRegisteredPanel').style.display = 'none';
													document.getElementById('mathsRegisteredPanel').style.display="none";
													document.getElementById('consultMathsRegisteredPanel').style.display="none";
													document.getElementById('becomeTutorPanel').style.display="none";

												}

												function showTutorsApplications() {

												setActive('applicationsTutor');
												document.getElementById('bookingPanel').style.display = 'none';
												document.getElementById('reviewsPanel').style.display = 'none';
												document.getElementById('tutorPanel').style.display = 'none';
												document.getElementById('searchPanel').style.display = 'none';
												document.getElementById('searchEemail').style.display = 'block';
												document.getElementById('button-addon2').style.display = 'block';
												document.getElementById('approvedBookingPanel').style.display = 'none';
												document.getElementById('consultantsPanel').style.display = 'none';
												document.getElementById('othersPanel').style.display = 'none';
												document.getElementById('matricRegisteredPanel').style.display = 'none';
												document.getElementById('cmatricRegisteredPanel').style.display = 'none';
												document.getElementById('mathsRegisteredPanel').style.display="none";
												document.getElementById('consultMathsRegisteredPanel').style.display="none";
												document.getElementById('becomeTutorPanel').style.display="block";
												}


												function showBookingsPanel() {

													setActive('bookings');
													document.getElementById('searchEemail').style.display = 'none';
													document.getElementById('button-addon2').style.display = 'none';
													document.getElementById('searchPanel').style.display = 'none';
													document.getElementById('tutorPanel').style.display = 'none';
													document.getElementById('bookingPanel').style.display = 'block';
													document.getElementById('reviewsPanel').style.display = 'none';
													document.getElementById('approvedBookingPanel').style.display = 'none';
													document.getElementById('consultantsPanel').style.display = 'none';
													document.getElementById('othersPanel').style.display = 'none';
													document.getElementById('matricRegisteredPanel').style.display = 'none';
													document.getElementById('cmatricRegisteredPanel').style.display = 'none';
													document.getElementById('mathsRegisteredPanel').style.display="none";
													document.getElementById('consultMathsRegisteredPanel').style.display="none";
													document.getElementById('becomeTutorPanel').style.display="none";
												}

												function showApprovedPanel() {

													setActive('blogs');
													document.getElementById('searchEemail').style.display = 'none';
													document.getElementById('button-addon2').style.display = 'none';
													document.getElementById('searchPanel').style.display = 'none';
													document.getElementById('tutorPanel').style.display = 'none';
													document.getElementById('bookingPanel').style.display = 'none';
													document.getElementById('reviewsPanel').style.display = 'none';
													document.getElementById('approvedBookingPanel').style.display = 'block';
													document.getElementById('consultantsPanel').style.display = 'none';
													document.getElementById('othersPanel').style.display = 'none';
													document.getElementById('matricRegisteredPanel').style.display = 'none';
													document.getElementById('cmatricRegisteredPanel').style.display = 'none';
													document.getElementById('mathsRegisteredPanel').style.display="none";
													document.getElementById('consultMathsRegisteredPanel').style.display="none";
													document.getElementById('becomeTutorPanel').style.display="none";
												}

												function showReviewsPanel() {

													setActive('reviews');
													document.getElementById('searchEemail').style.display = 'none';
													document.getElementById('button-addon2').style.display = 'none';
													document.getElementById('searchPanel').style.display = 'none';
													document.getElementById('tutorPanel').style.display = 'none';
													document.getElementById('bookingPanel').style.display = 'none';
													document.getElementById('approvedBookingPanel').style.display = 'none';
													document.getElementById('reviewsPanel').style.display = 'block';
													document.getElementById('consultantsPanel').style.display = 'none';
													document.getElementById('othersPanel').style.display = 'none';
													document.getElementById('matricRegisteredPanel').style.display = 'none';
													document.getElementById('cmatricRegisteredPanel').style.display = 'none';
													document.getElementById('mathsRegisteredPanel').style.display="none";
													document.getElementById('consultMathsRegisteredPanel').style.display="none";
													document.getElementById('becomeTutorPanel').style.display="none";
												}


												function showConsultantsPanel() {

													setActive('consultants');
													document.getElementById('searchEemail').style.display = 'none';
													document.getElementById('button-addon2').style.display = 'none';
													document.getElementById('searchPanel').style.display = 'none';
													document.getElementById('tutorPanel').style.display = 'none';
													document.getElementById('bookingPanel').style.display = 'none';
													document.getElementById('approvedBookingPanel').style.display = 'none';
													document.getElementById('reviewsPanel').style.display = 'none';
													document.getElementById('consultantsPanel').style.display = 'block';
													document.getElementById('othersPanel').style.display = 'none';
													document.getElementById('matricRegisteredPanel').style.display = 'none';
													document.getElementById('cmatricRegisteredPanel').style.display = 'none';
													document.getElementById('mathsRegisteredPanel').style.display="none";
													document.getElementById('consultMathsRegisteredPanel').style.display="none";
													document.getElementById('becomeTutorPanel').style.display="none";
												}


												function showOthersPanel() {

													setActive('others');
													document.getElementById('searchEemail').style.display = 'none';
													document.getElementById('button-addon2').style.display = 'none';
													document.getElementById('searchPanel').style.display = 'none';
													document.getElementById('tutorPanel').style.display = 'none';
													document.getElementById('bookingPanel').style.display = 'none';
													document.getElementById('approvedBookingPanel').style.display = 'none';
													document.getElementById('reviewsPanel').style.display = 'none';
													document.getElementById('consultantsPanel').style.display = 'none';
													document.getElementById('othersPanel').style.display = 'block';
													document.getElementById('matricRegisteredPanel').style.display = 'none';
													document.getElementById('cmatricRegisteredPanel').style.display = 'none';
													document.getElementById('mathsRegisteredPanel').style.display="none";
													document.getElementById('consultMathsRegisteredPanel').style.display="none";
													document.getElementById('becomeTutorPanel').style.display="none";
												}

												function showRedisterMatricPanel() {

													setActive('registered');
													document.getElementById('searchEemail').style.display = 'none';
													document.getElementById('button-addon2').style.display = 'none';
													document.getElementById('searchPanel').style.display = 'none';
													document.getElementById('tutorPanel').style.display = 'none';
													document.getElementById('bookingPanel').style.display = 'none';
													document.getElementById('approvedBookingPanel').style.display = 'none';
													document.getElementById('reviewsPanel').style.display = 'none';
													document.getElementById('consultantsPanel').style.display = 'none';
													document.getElementById('othersPanel').style.display = 'none';
													document.getElementById('matricRegisteredPanel').style.display = 'block';
													document.getElementById('cmatricRegisteredPanel').style.display = 'none';
													document.getElementById('mathsRegisteredPanel').style.display="none";
													document.getElementById('consultMathsRegisteredPanel').style.display="none";
													document.getElementById('becomeTutorPanel').style.display="none";
												}

												
											function showConsultMatricPanel(){

													setActive('consultMatric');
													document.getElementById('searchEemail').style.display = 'none';
													document.getElementById('button-addon2').style.display = 'none';
													document.getElementById('searchPanel').style.display = 'none';
													document.getElementById('tutorPanel').style.display = 'none';
													document.getElementById('bookingPanel').style.display = 'none';
													document.getElementById('approvedBookingPanel').style.display = 'none';
													document.getElementById('reviewsPanel').style.display = 'none';
													document.getElementById('consultantsPanel').style.display = 'none';
													document.getElementById('othersPanel').style.display = 'none';
													document.getElementById('matricRegisteredPanel').style.display = 'none';
													document.getElementById('cmatricRegisteredPanel').style.display = 'block';
													document.getElementById('mathsRegisteredPanel').style.display="none";
													document.getElementById('consultMathsRegisteredPanel').style.display="none";
													document.getElementById('becomeTutorPanel').style.display="none";
												}


												function showRedisterMathsClassesPanel() {

												setActive('registeredMaths');
												document.getElementById('searchEemail').style.display = 'none';
												document.getElementById('button-addon2').style.display = 'none';
												document.getElementById('searchPanel').style.display = 'none';
												document.getElementById('tutorPanel').style.display = 'none';
												document.getElementById('bookingPanel').style.display = 'none';
												document.getElementById('approvedBookingPanel').style.display = 'none';
												document.getElementById('reviewsPanel').style.display = 'none';
												document.getElementById('consultantsPanel').style.display = 'none';
												document.getElementById('othersPanel').style.display = 'none';
												document.getElementById('matricRegisteredPanel').style.display = 'none';
												document.getElementById('cmatricRegisteredPanel').style.display = 'none';
												document.getElementById('mathsRegisteredPanel').style.display="block";
												document.getElementById('consultMathsRegisteredPanel').style.display="none";
												document.getElementById('becomeTutorPanel').style.display="none";
												}

												function showConsultMathsClassesPanel() {

												setActive('consultMaths');
												document.getElementById('searchEemail').style.display = 'none';
												document.getElementById('button-addon2').style.display = 'none';
												document.getElementById('searchPanel').style.display = 'none';
												document.getElementById('tutorPanel').style.display = 'none';
												document.getElementById('bookingPanel').style.display = 'none';
												document.getElementById('approvedBookingPanel').style.display = 'none';
												document.getElementById('reviewsPanel').style.display = 'none';
												document.getElementById('consultantsPanel').style.display = 'none';
												document.getElementById('othersPanel').style.display = 'none';
												document.getElementById('matricRegisteredPanel').style.display = 'none';
												document.getElementById('cmatricRegisteredPanel').style.display = 'none';
												document.getElementById('mathsRegisteredPanel').style.display="none";
												document.getElementById('consultMathsRegisteredPanel').style.display="block"
												document.getElementById('becomeTutorPanel').style.display="none";

												}


												document.getElementById("form3").style.display = "none";

												// Function to display Form 2
												function displayForm2() {
													document.getElementById("form1").style.display = "none";
													document.getElementById("form2").style.display = "block";
													document.getElementById("form3").style.display = "none";


												}

												// Function to display Form 1
												function displayForm1() {
													document.getElementById("form2").style.display = "none";
													document.getElementById("form3").style.display = "none";
													document.getElementById("form1").style.display = "block";

												}

												function displayForm3() {
													document.getElementById("form2").style.display = "none";
													document.getElementById("form1").style.display = "none";
													document.getElementById("form3").style.display = "block";
												}

												// Function to redirect to home page
												function redirectToHome() {

													window.location.href = "/";

												}

												function validateForm1() {


													// Check if name, phone, and email are filled
													var name = document.getElementById("name").value;
													var phone = document.getElementById("phone").value;
													var email = document.getElementById("email").value;
													var experience = document.getElementById("experience").value;
													var background = document.getElementById("background").value;
													var address = document.getElementById("address").value;
													var country = document.getElementById("country").value;
													var id = document.getElementById("idnumber").value;
													var lsurname = document.getElementById("lsurname").value;


													//Get error message divs
													var nameError = document.getElementById("nameError");
													var phoneError = document.getElementById("phoneError");
													var emailError = document.getElementById("emailError");
													var experienceError = document.getElementById("experienceError");
													var addressError = document.getElementById("addressError");
													var backError = document.getElementById("backError");
													var countryError = document.getElementById("countryError");
													var idError = document.getElementById("idError");
													var lSurnameError = document.getElementById("lSurnameError");


													// Clear previous error messages
													nameError.innerText = "";
													phoneError.innerText = "";
													emailError.innerText = "";
													experienceError.innerText = "";
													addressError.innerText = "";
													backError.innerText = "";
													countryError.innerText = "";
													idError.innerText = "";
													lSurnameError.innerText = "";



													if (name === "") {
														nameError.innerText = "Full Name is required.";
														nameError.style.color = "red"; // Set text color to red
													}


													if (phone === "") {
														phoneError.innerText = "Phone Number is required.";
														phoneError.style.color = "red"; // Set text color to red

													}


													if (email === "") {
														emailError.innerText = "Email is required.";
														emailError.style.color = "red"; // Set text color to red

													}



													if (experience === "") {
														experienceError.innerText = "Experience  is required.";
														experienceError.style.color = "red"; // Set text color to red

													}


													if (background === "No") {
														backError.innerText = "Tutors background must be checked first.";
														backError.style.color = "red"; // Set text color to red

													}

													if (address === "") {
														addressError.innerText = "Province Required";
														addressError.style.color = "red"; // Set text color to red

													}



													if (country === "") {
														countryError.innerText = "Country is required.";
														countryError.style.color = "red"; // Set text color to red

													}



													if (id === "") {
														idError.innerText = "DOB number is required.";
														idError.style.color = "red"; // Set text color to red

													}



													if (lsurname === "") {
														lSurnameError.innerText = "Surname is required.";
														lSurnameError.style.color = "red"; // Set text color to red

													}

													// If any field is empty, return without proceeding
													if (name === "" || phone === "" || email === "" || experience === "" || background == "No" || country === "" || id === "" || lsurname === "") {
														return;
													}
													else {
														if (country === "South Africa") {

															if (address === "") {
																return;
															}

														}

													}

													displayForm2();

												}

												function validateForm2() {

													var name = document.getElementById("name").value;
													var phone = document.getElementById("phone").value;
													var email = document.getElementById("email").value;
													var background = document.getElementById("background").value;
													var address = document.getElementById("address").value;
													var country = document.getElementById("country").value;
													var id = document.getElementById("idnumber").value;
													var lsurname = document.getElementById("lsurname").value;
													var modules = document.getElementById("unSubjects").value;
													var exp = document.getElementById("experience").value;

													var subject = document.getElementById("subjects").value;
													var grades = document.getElementById("grades").value;
													var syllabus = document.getElementById("syllabus").value;
													var tutor = document.getElementById("tutorOptions").value;
													var area = document.getElementById("area").value;


													var subjectError = document.getElementById("subjectError");
													var gradesError = document.getElementById("gradesError");
													var syllabusError = document.getElementById("syllabusError");
													var areaError = document.getElementById("areaError");



													subjectError.innerText = "";
													gradesError.innerText = "";
													syllabusError.innerText = "";
													areaError.innerText = "";


													if (subject === "") {
														subjectError.innerText = "Subjects cannot be null";
														subjectError.style.color = "red"; // Set text color to red
													}

													if (grades === "") {
														gradesError.innerText = "Grades cannot be null";
														gradesError.style.color = "red"; // Set text color to red
													}

													if (syllabus === "") {
														syllabusError.innerText = "Syllabus cannot be null";
														syllabusError.style.color = "red"; // Set text color to red
													}

													if (area === "") {
														areaError.innerText = "Area cannot be null";
														areaError.style.color = "red"; // Set text color to red
													}

													if (subject === "" || grades === "" || syllabus === "" || area === "") {
														return;
													}

													subjectError.innerText = "";
													gradesError.innerText = "";
													syllabusError.innerText = "";
													areaError.innerText = "";

													var hiddenName = document.getElementById('hiddenName');
													hiddenName.value = name;

													var hiddenEmail = document.getElementById('hiddenEmail');
													hiddenEmail.value = email;

													var hiddenID = document.getElementById('hiddenIdentity');
													hiddenID.value = id;

													var hiddenPhone = document.getElementById('hiddenPhone');
													hiddenPhone.value = phone;

													var hiddenModules = document.getElementById('hiddenModules');
													hiddenModules.value = modules;

													var hiddenCountry = document.getElementById('hiddenCountry');
													hiddenCountry.value = country;

													var hiddenBack = document.getElementById('hiddenID');
													hiddenBack.value = background;

													var hiddenSubjects = document.getElementById('hiddenSubjects');
													hiddenSubjects.value = subject;

													var hiddenSurname = document.getElementById('hiddenSurname');
													hiddenSurname.value = lsurname;


													var hiddenGrades = document.getElementById('hiddenGrades');
													hiddenGrades.value = grades;

													var hiddenSyllabus = document.getElementById('hiddenSyllabus');
													hiddenSyllabus.value = syllabus;

													var tutorOption = document.getElementById('tutorOption');
													tutorOption.value = tutor;


													var addressTutor = document.getElementById('hiddenAddress');
													addressTutor.value = address;

													var areaTutor = document.getElementById('hiddenArea');
													areaTutor.value = area;

													var hiddenExp = document.getElementById('hiddenExp');
													hiddenExp.value = exp;

													displayForm3();

												}

												document.getElementById('form3').addEventListener('submit', async function (event) {
													event.preventDefault(); // Prevent default form submission

													alert("Tutor Successfully Registered.");

													const form = event.target;
													const formData = new FormData(form);

													try {
														const response = await fetch('/addTutor', {
															method: 'POST',
															body: formData
														});



														if (response.ok) {
															const result = await response.text(); // Read response as text
															console.log('Upload successful:', result);


															window.location.href = '/admin';
														} else {
															console.error('Upload failed:', response.statusText);
														}
													} catch (error) {
														console.error('Error during upload:', error);
													}
												});

												/*TO HERE*/

												function confirmDeletion() {

													alert("Tutor Deleted");
												}

												function confirmDeletionConsult() {

													alert("Consultant deleted.");
												}

												function confirmDeletionOther() {

													alert("Applicant deleted.");
												}


												/*START HERE*/

												document.getElementById("editform3").style.display = "none";
												document.getElementById("editform2").style.display = "none";

												// Function to display Form 2
												function editdisplayForm2() {
													document.getElementById("editform1").style.display = "none";
													document.getElementById("editform2").style.display = "block";
													document.getElementById("editform3").style.display = "none";


												}

												// Function to display Form 1
												function editdisplayForm1() {
													document.getElementById("editform2").style.display = "none";
													document.getElementById("editform3").style.display = "none";
													document.getElementById("editform1").style.display = "block";

												}

												function editdisplayForm3() {
													document.getElementById("editform2").style.display = "none";
													document.getElementById("editform1").style.display = "none";
													document.getElementById("editform3").style.display = "block";
												}

												// Function to redirect to home page
												function editredirectToHome() {

													window.location.href = "/";

												}

												function editvalidateForm1() {
													// Check if name, phone, email, country, and address (if applicable) are filled
													var name = document.getElementById("editname").value;
													var surname = document.getElementById("editsurname").value;
													var phone = document.getElementById("editphone").value;
													var email = document.getElementById("editemail").value;
													var address = document.getElementById("editaddress").value;
													var country = document.getElementById("editcountry").value;

													// Get error message divs
													var nameError = document.getElementById("editnameError");
													var surnameError = document.getElementById("editsurnameError");
													var phoneError = document.getElementById("editphoneError");
													var emailError = document.getElementById("editemailError");
													var addressError = document.getElementById("editaddressError");
													var editcountryError = document.getElementById("editcountryError");

													// Clear previous error messages
													nameError.innerText = "";
													surnameError.innerText = "";
													phoneError.innerText = "";
													emailError.innerText = "";
													addressError.innerText = "";
													editcountryError.innerText = "";

													// Validate Full Name
													if (name === "") {
														nameError.innerText = "Full Name is required.";
														nameError.style.color = "red"; // Set text color to red
													}

													// Validate Surname
													if (name === "") {
														surnameError.innerText = "Surname is required.";
														surnameError.style.color = "red"; // Set text color to red
													}

													// Validate Phone Number
													if (phone === "") {
														phoneError.innerText = "Phone Number is required.";
														phoneError.style.color = "red"; // Set text color to red
													}

													// Validate Email
													if (email === "") {
														emailError.innerText = "Email is required.";
														emailError.style.color = "red"; // Set text color to red
													}

													// Validate Country
													if (country === "") {
														editcountryError.innerText = "Country is required.";
														editcountryError.style.color = "red"; // Set text color to red
													}

													// Only validate the address (province) if the country is South Africa
													if (country === "South Africa" && address === "") {
														addressError.innerText = "Province is required.";
														addressError.style.color = "red"; // Set text color to red
													}

													// If any field is empty, return without proceeding
													if (name === "" || phone === "" || email === "" || country === "" || (country === "South Africa" && address === "")) {
														return; // Stop form submission
													}

													// Proceed to the next form or action
													editdisplayForm2();
												}

												function editvalidateForm2() {

													var name = document.getElementById("editname").value;
													var phone = document.getElementById("editphone").value;
													var email = document.getElementById("editemail").value;
													var country = document.getElementById("editcountry").value;

													var address = document.getElementById("editaddress").value;
													var area = document.getElementById("editarea").value;

													var subject = document.getElementById("editsubjects").value;
													var grades = document.getElementById("editgrades").value;
													var syllabus = document.getElementById("editsyllabus").value;
													var tutor = document.getElementById("edittutorOptions").value;


													var subjectError = document.getElementById("editsubjectError");
													var gradesError = document.getElementById("editgradesError");
													var syllabusError = document.getElementById("editsyllabusError");


													subjectError.innerText = "";
													gradesError.innerText = "";
													syllabusError.innerText = "";


													if (subject === "") {
														editsubjectError.innerText = "Subjects cannot be null";
														editsubjectError.style.color = "red"; // Set text color to red
													}

													if (grades === "") {
														editgradesError.innerText = "Grades cannot be null";
														editgradesError.style.color = "red"; // Set text color to red
													}

													if (syllabus === "") {
														editsyllabusError.innerText = "Syllabus cannot be null";
														editsyllabusError.style.color = "red"; // Set text color to red
													}

													if (subject === "" || grades === "" || syllabus === "") {
														return;
													}

													editsubjectError.innerText = "";
													editgradesError.innerText = "";
													editsyllabusError.innerText = "";

													var hiddenName = document.getElementById('edithiddenName');
													hiddenName.value = name;

													var hiddenEmail = document.getElementById('edithiddenEmail');
													hiddenEmail.value = email;

													var hiddenPhone = document.getElementById('edithiddenPhone');
													hiddenPhone.value = phone;

													var hiddenSubjects = document.getElementById('edithiddenSubjects');
													hiddenSubjects.value = subject;

													var hiddenGrades = document.getElementById('edithiddenGrades');
													hiddenGrades.value = grades;

													var hiddenSyllabus = document.getElementById('edithiddenSyllabus');
													hiddenSyllabus.value = syllabus;

													var tutorOption = document.getElementById('edittutorOption');
													tutorOption.value = tutor;


													var addressTutor = document.getElementById('edithiddenAddress');
													addressTutor.value = address;

													var areaTutor = document.getElementById('edithiddenArea');
													areaTutor.value = area;

													var countryTutor = document.getElementById('edithiddenCountry');
													countryTutor.value = country;

													editdisplayForm3();

												}

												document.getElementById('editform3').addEventListener('submit', async function (event) {
													event.preventDefault(); // Prevent default form submission

													alert("Update in progress");

													const form = event.target;
													const formData = new FormData(form);

													try {
														const response = await fetch('/editTutor', {
															method: 'POST',
															body: formData
														});



														if (response.ok) {
															const result = await response.text(); // Read response as text
															console.log('Upload successful:', result);
															alert("Tutor Successfully Updated.");

															window.location.href = '/admin';

														} else {
															console.error('Upload failed:', response.statusText);
														}
													} catch (error) {
														console.error('Error during upload:', error);
													}
												});

												/*END HERE*/


												/*EDIT STARTS HERE*/

												$('a.edit').on('click', function () {
													// Get the email from the data attribute
													var email = $(this).data('email');
													var name = $(this).data('name');
													var phone = $(this).data('phone');
													var availability = $(this).data('availability');
													var subjects = $(this).data('subjects');
													var grades = $(this).data('grades');
													var address = $(this).data('address');
													var bio = $(this).data('bio');
													var about = $(this).data('about');
													var hours = $(this).data('hours');
													var image = $(this).data('image');
													var syllabus = $(this).data('syllabus');
													var area = $(this).data('area');
													var country = $(this).data('country');

													var editCountry = document.getElementById('editcountry');
													editCountry.value = country;
													editCountry.placeholder = email;

													var editEmail = document.getElementById('editemail');
													editEmail.value = email;
													editEmail.placeholder = country;

													var editName = document.getElementById('editname');
													editName.value = name;
													editName.placeholder = name;

													var editPhone = document.getElementById('editphone');
													editPhone.value = phone;
													editPhone.placeholder = phone;

													var editAddress = document.getElementById('editaddress');
													editAddress.value = address;
													editAddress.placeholder = address;


													var editArea = document.getElementById('editarea');
													editArea.value = area;
													editArea.placeholder = area;

													/*Next Button*/

													var editOpt = document.getElementById('edittutorOptions');
													editOpt.value = availability;
													editOpt.placeholder = availability;

													var editGrades = document.getElementById('editgrades');
													editGrades.value = grades;
													editGrades.placeholder = grades;

													var editSub = document.getElementById('editsubjects');
													editSub.value = subjects;
													editSub.placeholder = subjects;

													var editSy = document.getElementById('editsyllabus');
													editSy.value = syllabus;
													editSy.placeholder = syllabus;

													/*Save Button*/

													var editBio = document.getElementById('editbio');
													editBio.value = bio;
													editBio.placeholder = bio;

													var editAbout = document.getElementById('editabout');
													editAbout.value = about;
													editAbout.placeholder = about;

													var editHours = document.getElementById('edithours');
													editHours.value = hours;
													editHours.placeholder = hours;

													/*var editImage = document.getElementById('editprofile');
													editImage.value = image;
													editImage.placeholder = image;*/

													

												});

												function searchTutor() {

													// Get the email from the input field
													var email = document.getElementById('searchEemail').value;

													// Prepare the request options
													var requestOptions = {
														method: 'POST',
														headers: {
															'Content-Type': 'application/json'
														},
														body: JSON.stringify({ searchEmail: email }) // Include studentId in the request body
													};

													// Send the fetch request
													fetch('/searchTutor', requestOptions)
														.then(response => response.json())
														.then(tutor => {
															// Check if the tutor is not empty
															if (tutor && tutor.email === email) {
																alert("Tutor found");
																document.getElementById('searchEemail').value = "";
																document.getElementById('tutorPanel').style.display = 'none';

																/*Initialise Values*/
																document.getElementById('searchName').textContent = tutor.fullNames;
																document.getElementById('searchEmail').textContent = tutor.email;
																document.getElementById('searchAvail').textContent = tutor.availability;
																document.getElementById('searchLocation').textContent = tutor.address;
																document.getElementById('searchPhone').textContent = tutor.phoneNumber;

																document.getElementById('searchPanel').style.display = 'block';

															} else {
																alert("Not Found"); // Display error if not found
																document.getElementById('searchEemail').value = "";
															}
														})
														.catch(error => {
															console.error('Error:', error); // Handle any errors
														});


												}

												$(document).ready(function () {
													// Event listener for the "View" icon
													$('.review').on('click', function () {
														// Get data from attributes
														var name = $(this).data('name');
														var message = $(this).data('message');
														var rating = $(this).data('rating');
														var tutor = $(this).data('tutor');
														var email = $(this).data('email');


														// Populate modal with the data
														$('#modalNameReview').text(name);
														$('#modalMessageReview').text(message);
														$('#modalRatingReview').text(rating);


														document.getElementById("rEntryId").value = tutor;
														document.getElementById("entryReview").value = tutor;
														document.getElementById("rTutorEmail").value = email;

													});
												});

												function toggleCheckboxes() {
													const container = document.getElementById('gradesContainer');
													container.style.display = container.style.display === 'none' ? 'block' : 'none';
												}

												function updateGrades() {
													const checkboxes = document.querySelectorAll('#gradesContainer input[type="checkbox"]');
													const selectedGrades = [];

													checkboxes.forEach((checkbox) => {
														if (checkbox.checked) {
															selectedGrades.push(checkbox.value);
														}
													});

													document.getElementById('grades').value = selectedGrades.join(', ');
												}

												function toggleSyllabusOptions() {
													const container = document.getElementById('syllabusContainer');
													container.style.display = container.style.display === 'none' ? 'block' : 'none';
												}

												function updateSyllabus() {
													const checkboxes = document.querySelectorAll('#syllabusContainer input[type="checkbox"]');
													const selectedSyllabi = [];

													checkboxes.forEach((checkbox) => {
														if (checkbox.checked) {
															selectedSyllabi.push(checkbox.value);
														}
													});

													document.getElementById('syllabus').value = selectedSyllabi.join(', ');
												}

												function toggleSubjectOptions() {
													const container = document.getElementById('subjectContainer');
													container.style.display = container.style.display === 'none' ? 'block' : 'none';
												}

												function updateSubjects() {
													const checkboxes = document.querySelectorAll('#subjectContainer input[type="checkbox"]');
													const selectedSubjects = [];

													checkboxes.forEach((checkbox) => {
														if (checkbox.checked) {
															selectedSubjects.push(checkbox.value);
														}
													});

													document.getElementById('subjects').value = selectedSubjects.join(', ');
												}

												const checkbox = document.getElementById('universityCheckbox');
												const modulesDiv = document.getElementById('modulesDiv');

												checkbox.addEventListener('change', function () {
													if (this.checked) {
														modulesDiv.style.display = 'block';
													} else {
														modulesDiv.style.display = 'none';
													}
												});

												function preventBackNavigation() {
													// Push a new state to the history
													window.history.pushState(null, null, window.location.href);
													// Listen for the popstate event
													window.onpopstate = function () {
														// Redirect to a specific page when the back button is pressed
														window.location.href = '/adminpanel'; // Change this to your desired page
													};
												}


												document.addEventListener("DOMContentLoaded", function () {
													const countrySelect = document.getElementById("country");
													const provinceGroup = document.getElementById("fProvince");

													function toggleProvince() {
														if (countrySelect.value === "South Africa") {
															provinceGroup.style.display = "block";
														} else {
															provinceGroup.style.display = "none";
															document.getElementById("address").value = "";
														}
													}

													toggleProvince();
													countrySelect.addEventListener("change", toggleProvince);
												});


												//For countries and their codes


												function updateCountryCode() {
													const countrySelect = document.getElementById("country");
													const phoneInput = document.getElementById("phone");

													// Get the selected option
													const selectedOption = countrySelect.options[countrySelect.selectedIndex];
													const code = selectedOption.getAttribute("data-code");

													// Update the phone input with the country code
													phoneInput.value = code + " ";
												}

												//beacome a tutor
												$(document).on('click', '.becomeTutorView', function() {
												// Populate modal fields with data attributes
												var name = $(this).data('tutorname');
												var surname = $(this).data('tutorsurname');
												var email = $(this).data('tutoremail');
												var phone = $(this).data('tutorphone');
												var country = $(this).data('country')
												var dob = $(this).data('dob');
												var exp = $(this).data('experience');
												var area = $(this).data('area');
												var tutAddress = $(this).data('address');
												var province = $(this).data('province');
												var sub = $(this).data('subjects');
												var grd = $(this).data('grades');
												var syl = $(this).data('syllabus');
												var opt = $(this).data('options');
												var qual = $(this).data('qualification');
												var spec = $(this).data('specification');
												var bio = $(this).data('bio');
												var about = $(this).data('about');
												var achv = $(this).data('achievements');
												var opp = $(this).data('isithombe');


												$('#cmodalName').text(name);
												$('#cmodalSurname').text(surname);
												$('#cmodalEmail').text(email);
												$('#cmodalPhone').text(phone);
												$('#cmodalCountry').text(country);
												$('#cmodalDob').text(dob);
												$('#cmodalExperience').text(exp);
												$('#cmodalArea').text(area);
												$('#bModalAddress').text(tutAddress);
												$('#cmodalProvince').text(province);
												$('#cmodalSubjects').text(sub);
												$('#cmodalGrades').text(grd);
												$('#cmodalSyllabus').text(syl);
												$('#cmodalTutorOptions').text(opt);
												$('#cmodalQualification').text(qual);
												$('#cmodalSpecification').text(spec);
												$('#cmodalBio').text(bio);
												$('#cmodalAbout').text(about);
												$('#amodalAchievements').text(achv);

												const dateString = $(this).data('datedate'); // Assuming this returns a date string
												const dateOnly = String(dateString.substring(0, 10)); // Ensure it's a string

												var oName = document.getElementById("rName");
												  oName.value = name;

												  var oProfile = document.getElementById("rProfile");
												  oProfile.value = opp;

												document.getElementById("rEmail").value =  email;
												document.getElementById("rPhone").value = phone;
												document.getElementById("rSubjects").value = sub;
												document.getElementById("rGrades").value = grd;
												document.getElementById("rSyllabus").value = syl;
												document.getElementById("rTutorOption").value = opt;
												document.getElementById("rAddress").value = province;
												document.getElementById("rQualification").value = qual;
												document.getElementById("rAchievements").value = achv;
												document.getElementById("rAbout").value = about;
												document.getElementById("rHours").value = bio;
												document.getElementById("rArea").value = area;
												document.getElementById("rCountry").value =country;
												document.getElementById("rDOB").value = dateOnly;
												document.getElementById("rSurname").value = surname;
												document.getElementById("rModules").value = qual;
												document.getElementById("rExp").value = exp;
											

												// Set download links
												const cvBase64 = $(this).data('cv');
												const educationBase64 = $(this).data('education');
												const idPassportBase64 = $(this).data('idpassport');
												const imageBase64 = $(this).data('image');

												// Set CV link
												if (cvBase64) {
													$('#cmodalCvLink').attr('href', 'data:application/pdf;base64,' + cvBase64);
												} else {
													$('#cmodalCvLink').attr('href', '#').text('N/A');
												}

												// Set Education link
												if (educationBase64) {
													$('#cmodalEducationLink').attr('href', 'data:application/pdf;base64,' + educationBase64);
												} else {
													$('#cmodalEducationLink').attr('href', '#').text('N/A');
												}

												// Set ID Passport link
												if (idPassportBase64) {
													$('#cmodalIdPassportLink').attr('href', 'data:application/pdf;base64,' + idPassportBase64);
												} else {
													$('#cmodalIdPassportLink').attr('href', '#').text('N/A');
												}

												// Set Image link
												if (imageBase64) {
													$('#cmodalImageLink').attr('href', 'data:image/jpeg;base64,' + imageBase64);
												} else {
													$('#cmodalImageLink').attr('href', '#').text('N/A');
												}



											});
				


												//Maths consultants

												$(document).ready(function () {
													$('a.consultregisteredView').on('click', function () {
														var statusIdSend = $(this).data('entryid'); // Updated to use data-entryid
														var checkStatus = "mathematicsView" + statusIdSend; // Updated span ID

														var mathematicsView = document.getElementById(checkStatus);

														if (mathematicsView) {
															mathematicsView.innerText = "Opened";
															mathematicsView.style.color = "green";
															mathematicsView.style.fontWeight = "bold";
														}

														const dataToSend = {
															status: statusIdSend
														};

														fetch('/mark-as-viewed', { 
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

														// Get data attributes from the clicked link
														var name = $(this).data('parentname');
														var email = $(this).data('parentemail');
														var phone = $(this).data('parentphone');
														var studentName = $(this).data('studentname');
														var grade = $(this).data('grade');
														var curriculum = $(this).data('curriculum');
        												var marks = $(this).data('marks');
														var subject = $(this).data('subject');
														var message = $(this).data('message');
														var status = $(this).data('status');

														// Populate the modal with data
														$('#ConsultantParentName').text(name);
														$('#ConsultantParentEmail').text(email);
														$('#ConsultantParentPhone').text(phone);
														$('#ConsultantStudentName').text(studentName);
														$('#ConsultantGrade').text(grade);
														$('#ConsultantCurriculum').text(curriculum); 
        												$('#ConsultantMarks').text(marks); 
														$('#ConsultantSubject').text(subject);
														$('#ConsultantMessage').text(message);
														$('#ConsultantStatus').text(status); 

														// Show the modal
														$('#ConsultantModal').modal('show');
													});
												});


												//for maths class registered
												$(document).ready(function () {
												$('a.approvedMathsView').on('click', function () {
													var statusIdSend = $(this).data('entryid'); // Use data-entryid
													var checkStatus = "rgsView" + statusIdSend; // Updated span ID

													var rgsView = document.getElementById(checkStatus);

													if (rgsView) {
														rgsView.innerText = "Opened";
														rgsView.style.color = "green";
														rgsView.style.fontWeight = "bold";
													}

													const dataToSend = {
														status: statusIdSend
													};

													fetch('/update-view-status', { 
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

													// Get data attributes from the clicked link
													var name = $(this).data('parentname');
													var surname = $(this).data('parentsurname'); // Include surname if needed
													var email = $(this).data('parentemail');
													var phone = $(this).data('parentphone');
													var studentName = $(this).data('studentname');
													var studentSurname = $(this).data('studentsurname'); // Include surname if needed
													var grade = $(this).data('grade');
													var subject = $(this).data('subject');
													var message = $(this).data('message');
													var status = $(this).data('status');
													var curriculum = $(this).data('curriculum'); // If needed
													var marks = $(this).data('marks'); // If needed

													// Populate the modal with data
													$('#RegisteredParentName').text(name);
													$('#RegisteredParentSurname').text(surname);
													$('#RegisteredParentEmail').text(email);
													$('#RegisteredParentPhone').text(phone);
													$('#RegisteredStudentName').text(studentName);
													$('#RegisteredStudentSurname').text(studentSurname);
													$('#RegisteredGrade').text(grade);
													$('#RegisteredSubject').text(subject);
													$('#RegisteredStatus').text(status);
													$('#RegisteredCurriculum').text(curriculum); // If needed
													$('#RegisteredMarks').text(marks); // If needed
													$('#RegisteredMessage').text(message);

													// Show the registered maths class modal
													$('#registeredMathsClassModal').modal('show');
												});
											});


											function sendOut(){

													alert("Tutor Successfully Added.");
													document.getElementById("praise").style.display = 'none';
						             			
											}

											
											function unsuccessfulApp(){

													alert("Tutor Application Deleted");
													document.getElementById("uns").style.display = 'none';
													document.getElementById("praise").style.display = 'none';
													
													var email = document.getElementById("rEmail").value;
													
													document.getElementById("emailApplicant").value = email;
																
									
											}
											
													
													function deleteReview(){

														alert("Review Deleted");
													
															document.getElementById("dr").style.display = 'none';
															document.getElementById("dc").style.display = 'none';
															
													}

											
											//edit the country and province 
											function toggleProvinceVisibility() {
												var country = document.getElementById("editcountry").value;
												var provinceField = document.getElementById("provinceField");

												// Hide province field if the country is not South Africa
												if (country !== "South Africa") {
													provinceField.style.display = "none";
												} else {
													provinceField.style.display = "block";
												}
											}

											// Call this function when the page loads to ensure the correct visibility
											window.onload = function() {
												toggleProvinceVisibility(); // Check initial country selection (if any)
											};

											</script>
								</body>

								</html>