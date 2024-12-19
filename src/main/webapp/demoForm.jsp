<%@page import="com.ps.Model.EventList"%>
        <%@page import="com.ps.Model.AdminDAO"%>
        <%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link rel="stylesheet" href="styles.css">
</head>
<body>
<%@ include file="Header.jsp" %>
	<div class="carousel">
        <!-- list item -->
        <div class="list">
        
        <% 
          AdminDAO ad = new AdminDAO(session); 
          List<EventList> event = ad.getEventInfo();
          Iterator<EventList> itr = event.iterator();
          while (itr.hasNext()) {
            EventList e = itr.next();
        %>
        
            <div class="item">
                <img src="image/<%= e.getImg() %>">
                <div class="content">
                    <div class="author">~Dreams Land~</div>
                    <div class="title"><%=e.getName() %></div>
                    
                    <div class="des">
                        <!-- lorem 50 -->
                        <%= e.getDes() %>
                    </div>
                    <div class="buttons">
                        <button>SEE MORE</button>
                        <button>SUBSCRIBE</button>
                    </div>
                </div>
            </div>
        <%} %>
        
        </div>


        <!-- list thumnail -->
        <div class="thumbnail">
        
        <%
        Iterator<EventList> it1 = event.iterator();
        while (it1.hasNext()) {
          EventList e = it1.next();
        %>
            <div class="item">
                <img src="image/<%= e.getImg()%>">
                <div class="content">
                    <div class="title">
                        <%=e.getName() %>
                    </div>
                    <div class="description">
                        <%=e.getDes() %>
                    </div>
                </div>
            </div>
        <%} %>
        </div>
        <!-- next prev -->

        <div class="arrows">
            <button id="prev"><</button>
            <button id="next">></button>
        </div>
        <!-- time running -->
        <div class="time"></div>
    </div>


	<!-- Services -->
<!-- Event List Section -->
  <section id="event" class="about-us-section py-5">
    <div class="container">
      <div class="row">
        
        <% 
          
          Iterator<EventList> it = event.iterator();
          while (it.hasNext()) {
            EventList e = it.next();
        %>
        <div class="col-md-4 p-3">
          <div class="card h-100" style="width: 18rem;">
            <img src="image/<%= e.getImg() %>" class="card-img-top event-img" alt="Event Image">
            <div class="card-body d-flex flex-column">
              <h5 class="card-title text-dark"><%= e.getName() %></h5>
              <p class="card-text text-dark flex-grow-1"><%= e.getDes() %></p>
              <% if(session.getAttribute("cid") != null) { %>
                <a href="BookEvent.jsp" class="btn btn-primary mt-auto">Book</a>
              <% } else { %>
                <a href="Registration.jsp" class="btn btn-primary mt-auto">Book</a>
              <% } %>
            </div>
          </div>
        </div>
        <% } %>
      </div>
    </div>
  </section>
	

     <!-- About Us Section -->
  <section id="about" class="about-us-section py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h2>About Us</h2>
          <p>At Event Management, we specialize in creating unforgettable events that leave lasting impressions. With a dedicated team of professionals and years of experience, we handle everything from intimate gatherings to grand celebrations.</p>
        </div>
        <div class="col-md-6">
          <!-- Team Photos and Bios can go here -->
        </div>
      </div>
    </div>
  </section>


<section id="footer" class="about-us-section py-5">
<!-- footer -->
  <!-- Remove the container if you want to extend the Footer to full width. -->
  <div class="container-fluid bg-dark">
    <div class="container-fluid text-dark fs-7">
      <!-- Footer -->
      <footer class="text-center text-lg-start col-12" style="background-color: #F3D0D7">
        <!-- Grid container -->
        <div class="container p-4">
          <!-- Section: Links -->
          <section class="">
            <!--Grid row-->
            <div class="row">
              <!-- Grid column -->
              <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">
                  Dream Land
                </h6>
                <p>
                  Here you can use rows and columns to organize your footer
                  content. Lorem ipsum dolor sit amet, consectetur adipisicing
                  elit.
                </p>
              </div>
              <!-- Grid column -->
    
              <hr class="w-100 clearfix d-md-none" />
    
              <!-- Grid column -->
              <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">Products</h6>
                <p>
                  <a class="text-dark">Home</a>
                </p>
                <p>
                  <a class="text-dark">Events</a>
                </p>
                <p>
                  <a class="text-dark">Gallary</a>
                </p>
                <p>
                  <a class="text-dark">About US</a>
                </p>
              </div>
              <!-- Grid column -->
    
              <hr class="w-100 clearfix d-md-none" />
    
              <!-- Grid column -->
              <hr class="w-100 clearfix d-md-none" />
    
              <!-- Grid column -->
              <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
                <p><i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
                <p><i class="fas fa-envelope mr-3"></i> dreamland@gmail.com</p>
                <p><i class="fas fa-phone mr-3"></i> +91 9632017126</p>
                <p><i class="fas fa-print mr-3"></i> +91 8264897520</p>
                 
              </div>
              <!-- Grid column -->
    
              <!-- Grid column -->
              <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">Follow us</h6>
    
                <!-- Facebook -->
                <a
                   class="btn btn-primary btn-floating m-1"
                   style="background-color: #3b5998"
                   href="#!"
                   role="button"
                   ><i class="fab fa-facebook-f"></i
                  ></a>
    
                <!-- Twitter -->
                <a
                   class="btn btn-primary btn-floating m-1"
                   style="background-color: #55acee"
                   href="#!"
                   role="button"
                   ><i class="fab fa-twitter"></i
                  ></a>
    
                <!-- Google -->
                <a
                   class="btn btn-primary btn-floating m-1"
                   style="background-color: #dd4b39"
                   href="#!"
                   role="button"
                   ><i class="fab fa-google"></i
                  ></a>
    
                <!-- Instagram -->
                <a
                   class="btn btn-primary btn-floating m-1"
                   style="background-color: #ac2bac"
                   href="#!"
                   role="button"
                   ><i class="fa-brands fa-instagram fa-fade"></i></a>
              </div>
            </div>
            <!--Grid row-->
          </section>
          <!-- Section: Links -->
        </div>
        <!-- Grid container -->
    
        <!-- Copyright -->
        <div
             class="text-center p-3"
             style="background-color: rgba(0, 0, 0, 0.2)"
             >
          © 2023 Copyright:
          <a class="text-white" href="https://DreamLamd.com/"
             >DreamLand.com</a
            >
        </div>
        <!-- Copyright -->
      </footer>
      <!-- Footer -->
    </div>
    <!-- End of .container -->
    
</div>
</section>
    <script src="app.js"></script>
</body>
</html>