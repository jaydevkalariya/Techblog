
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Admin"%>
<%@page errorPage="error_page.jsp" %>
<%

    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("login_page.jsp");
    }
%>


<!doctype html>
<html lang="en">
  <head>
  	<title>Contact Us</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    
    
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="contactform/css/style.css">
        
       
	</head>
        <style>
           
        </style>
	<body>
            
         <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="	fa fa-bell-o"></span> JK <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="profile_admin.jsp"> <span class="	fa fa-address-card-o"></span> Home</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="	fa fa-check-square-o"></span>Add Categories
                        </a> 
                        <div class="dropdown-menu text-center mt-2" aria-labelledby="navbarDropdown" style="background-color:lightcyan">
                            <% 
                                   CategoryDao d = new CategoryDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {
                         %>
                            <a class="dropdown-item" href="#"><%= cc.getName() %></a>
                           <%} %>
                          <a class="btn  btn-outline-primary" href="#!" data-toggle="modal" data-target="#addCategory" data-whatever="@getbootstrap">+</a>
                           </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span>Add Premium Code
                        </a> 
                    <div class="dropdown-menu text-center mt-2" aria-labelledby="navbarDropdown" style="background-color:lightcyan"> 
                            <form action="checkPremiumPost"/>
                            <input type="hidden" name="do" value="addCode"/>
                            Enter Premium Code:
                            <div class="form-group ml-3 mr-3 mt-1">
                            <input type="text" name="code" id="code" class="a" />
                            </div>
                            <input type="submit" value="Add"/>
                           </form>
                           </div>
                    </li>
                    

                    <li class="nav-item">
                        <a class="nav-link" href="contact2.jsp"> <span class="	fa fa-address-card-o"></span> Contact</a>
                    </li>




                </ul>
            </div>
        </nav>
            
	<section class="mt-4">
		<div class="container ">
			
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="wrapper">
						<div class="row no-gutters">
							<div class="col-md-6">
								<div class="contact-wrap w-100 p-lg-5 p-4">
									<h3 class="mb-4">Send us a message</h3>
									<div id="form-message-warning" class="mb-4"></div> 
				      		<div id="form-message-success" class="mb-4">
				            Your message was sent, thank you!
				      		</div>
									<form method="POST" id="contactForm" name="contactForm" class="contactForm">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" class="form-control" name="name" id="name" placeholder="Name">
												</div>
											</div>
											<div class="col-md-12"> 
												<div class="form-group">
													<input type="email" class="form-control" name="email" id="email" placeholder="Email">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" class="form-control" name="subject" id="subject" placeholder="Subject">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<textarea name="message" class="form-control" id="message" cols="30" rows="6" placeholder="Message"></textarea>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="submit" value="Send Message" class="btn btn-primary">
													<div class="submitting"></div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="col-md-6 d-flex align-items-stretch">
								<div class="info-wrap w-100 p-lg-5 p-4 ">
									<h2>Contact us</h2>
									<p class="mb-4">We're open for any suggestion or just to have a chat</p>
				        	<div class="dbox w-100 d-flex align-items-start">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-map-marker"></span>
				        		</div>
				        		<div class="text pl-3">
					            <p><span>Address:</span> Pratham Prestige, Mota Bazaar, Vallabh vidhyanagar, Anand, 360110</p>
					          </div>
				          </div>
				        	<div class="dbox w-100 d-flex align-items-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-phone"></span>
				        		</div>
				        		<div class="text pl-3">
					            <p><span>Phone:</span> <a href="tel://1234567920">+ 7990554541</a></p>
					          </div>
				          </div>
				        	<div class="dbox w-100 d-flex align-items-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-paper-plane"></span>
				        		</div>
				        		<div class="text pl-3">
					            <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@Techblog.com</a></p>
					          </div>
				          </div>
				        	<div class="dbox w-100 d-flex align-items-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-globe"></span>
				        		</div>
				        		<div class="text pl-3">
					            <p><span>Website</span> <a href="#">Techblog.com</a></p>
					          </div>
				          </div>
			          </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="contactform/js/jquery.min.js"></script>
  <script src="contactform/js/popper.js"></script>
  <script src="contactform/js/bootstrap.min.js"></script>
  <script src="contactform/js/jquery.validate.min.js"></script>
  <script src="contactform/js/main.js"></script>

	</body>
</html>

