<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">  
    <!-- 
    <link rel="stylesheet" href="Style.css">
    <script type="text/javascript" src="app.js"></script>
     -->
     <link rel="stylesheet" href="styles.css">
     
<style>
	/* nav links */
.navbar{
    background-color:#F4DFC8;
    opacity: 0.8;
    z-index: 100;
}
.nav-link{
    color:#3C2A21;
    font-weight: 900;
    font-family: optima;
    font-size: large;
}



header{
    width: 1140px;
    max-width: 80%;
    margin: auto;
    height: 50px;
    display: flex;
    align-items: center;
    position: relative;
    z-index: 100;
}
header a{
    color: #eee;
    margin-right: 40px;
}
img{
            width: 50px;
            height: 50px;
            border-radius: 10%;
            text-shadow: -7px 5px 4px rgb(7, 7, 9);
        }
	</style>
</head>
<body>
	<header>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container-fluid" >
              <a class="navbar-brand" href="#"><img class="rounded-pill" src="image/logo.jpg" /></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                  <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                  <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                  	
                  	<li class="nav-item">
                      <a class="nav-link mx-lg-2 " aria-current="page" href="Home.jsp">Home</a>
                    </li>
                  	
                  	<%if(session.getAttribute("cid")!=null && session.getAttribute("cid").equals(501)){ %>
                  	
                  	<li class="nav-item">
                        <a class="nav-link mx-lg-2" href="ViewEvent.jsp">Event List</a>
                    </li>
                  	<li class="nav-item">
                        <a class="nav-link mx-lg-2" href="ViewClient.jsp">View Employee</a>
                    </li>
                  	<li class="nav-item">
                        <a class="nav-link mx-lg-2" href="ViewBookEvent.jsp">View Booked Event</a>
                    </li>
                  	<li class="nav-item">
                        <a class="nav-link mx-lg-2" href="AddEvent.jsp">Add New Event</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="Registration.jsp">Add Employee</a>
                    </li>
                    <%-- <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="register?logout=yes">Logout</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="#"><i class="fa-solid fa-user"></i> <%=session.getAttribute("cname") %></a>
                    </li> --%>
                    
                    <li class="nav-item dropdown">
          				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				<i class="fa-solid fa-user"></i><%=session.getAttribute("cname") %>
          				</a>
          				<ul class="dropdown-menu dropdown-menu-end">
            				<li><a class="dropdown-item" href="ForgorChangePwd.jsp">Change Password</a></li>
            				<li><a class="dropdown-item" href="EditProfile.jsp">Edit Profile</a></li>
            				<li><a class="dropdown-item" href="register?logout=yes">Logout</a></li>
          				</ul>
        			</li>
                    
                  	
                  	<%}else if(session.getAttribute("cid")!=null){ %>
                  
                    
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="Home.jsp#about">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="ClientBookedEvents.jsp">Booked Events</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="BookEvent.jsp">Book Event</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="gallery.jsp">Gallary</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="Home.jsp#footer">Contact</a>
                    </li>
                    <%-- <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="register?logout=yes">Logout</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="#"><i class="fa-solid fa-user"></i> <%=session.getAttribute("cname") %></a>
                    </li> --%>
                    
                    <li class="nav-item dropdown">
          				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				<i class="fa-solid fa-user"></i><%=session.getAttribute("cname") %>
          				</a>
          				<ul class="dropdown-menu dropdown-menu-end">
            				<li><a class="dropdown-item" href="ForgorChangePwd.jsp">Change Password</a></li>
            				<li><a class="dropdown-item" href="EditProfile.jsp">Edit Profile</a></li>
            				<li><a class="dropdown-item" href="register?logout=yes">Logout</a></li>
          				</ul>
        			</li>
                    
                    
                   <%}else { %>
                   
                   <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="Home.jsp#about">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="Home.jsp#event">Events</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="gallery.jsp">Gallary</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="Login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="Registration.jsp">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2" href="Home.jsp#footer">Contact</a>
                    </li>
                   
                   <%} %>
                  </ul>
                </div>
              </div>
            </div>
          </nav>


    </header>
</body>
</html>