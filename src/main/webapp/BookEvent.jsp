<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Form</title>
<!-- 
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
 -->
<link rel="stylesheet" href="Style.css">
<style>

body {
      font-family: 'Poppins', sans-serif;
      background: url("image/party.jpg") no-repeat center center fixed;
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .card {
      border: none;
      border-radius: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      opacity: 0.9;
      background-color: #000;
      width: 450px;
    }
    .card-header {
      background-color: #000;
      color: #8dcb6c;
      border-bottom: none;
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
    }
    .btn-primary {
      background-color: #8dcb6c;
      border: none;
      border-radius: 200px;
    }
    .btn-primary:hover {
      background-color: #8dcb6c;
    }
    label {
      color: #8dcb6c;
    }
    .form-control {
      width: 100%;
    }


.error{
	color:red;
}

</style>
</head>
<body>
	<%@ include file="Header.jsp" %>
	<script src="formValidation.js"></script>
	 <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card mt-5">
          <div class="card-header text-center">
            <h2>Book Event</h2>
          </div>
          <div class="card-body">

            <%if(request.getAttribute("msg")!=null){ %>
              <h3 style="color:green"><%= request.getAttribute("msg") %></h3>
            <%} %>
            <%if(request.getAttribute("msge")!=null){ %>
              <h3 style="color:red"><%= request.getAttribute("msge") %></h3>
            <%} %>

            <form action="admin" id="formValidation" method="post">
              <div class="form-group">
                <label for="cid">Customer ID:</label>
                <input class="form-control" type="number" id="cid" name="cid" value="<%= session.getAttribute("cid") %>" readonly>
              </div>

              <div class="form-group">
                <label for="et">Event Type</label>
                <select class="form-control" id="et" name="et" required>
                    <option value="select">--select--</option>
                    <%@ page import="com.ps.Model.AdminDAO" %>
                    <%@ page import="com.ps.Model.EventList" %>
                    <%@ page import="java.util.*" %>
                    <% AdminDAO ad=new AdminDAO(session);
                    	ArrayList<EventList> al=ad.getEventList();//control going to PatientDAO.java
                    	Iterator<EventList> i=al.iterator();
                    	while(i.hasNext()){
                    		EventList e=i.next();
                    	
                    %>
                    	<option value="<%= e.getEid() %>"><%= e.getName()%></option>
                    <%} %>
                </select>
            </div>
            
            <div class="form-group">
                <label for="date">Event Date:</label>
                <input class="form-control" type="date" id="edate" name="edate"  required>
            </div>
          
            <button type="submit" class="btn btn-primary btn-block col-lg-4 mx-auto" name="book">Book Event</button>
        

              <!-- <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="number" class="form-control" id="phone" placeholder="Enter phone number" name="phone">
              </div>
              <div class="form-group">
                <label for="email">Email address:</label>
                <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
              </div>
              <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="pwd" placeholder="Enter Password" name="pwd">
              </div>
              <div class="form-group">
                <label for="confirm-password">Confirm Password:</label>
                <input type="password" class="form-control" id="conpwd" placeholder="Confirm password" name="conpwd">
              </div>
              <button type="submit" class="btn btn-primary btn-block" name="register">Sign Up</button> -->
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
    
<script>
$(document).ready(function() {
    // Get today's date in YYYY-MM-DD format
    var today = new Date().toISOString().split('T')[0];

    // Set minimum date for appointmentDate input
    $('#edate').attr('min', today);

    // Initialize form validation
    
});
</script>
</body>
</html>