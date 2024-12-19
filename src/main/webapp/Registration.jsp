<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      background: url("image/a1.jpg") no-repeat center center fixed;
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
      opacity: 0.7;
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

.hight{
	height:72px;
	width:auto;
}

.error {
    color: red;
}
</style>
</head>
<body>
    <%@ include file="Header.jsp" %>
    <script src="formValidation.js"></script>
 
   <div style="margin-top:130px" class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card mt-5">
        	
        	<% if (session.getAttribute("cid") != null && session.getAttribute("cid").equals(501)) { %>
        			<div class="card-header text-center">
            		<h2>Add Employee</h2>
          			</div>
        	<% } else { %>
        			<div class="card-header text-center">
            		<h2>Register Page</h2>
          			</div>
        	<% } %>
          
          	<% if (request.getAttribute("msg") != null) { %>
				<h3 style="color:green"><%= request.getAttribute("msg") %></h3>
			<% } %>
			<% if (request.getAttribute("msge") != null) { %>
				<h3 style="color:red"><%= request.getAttribute("msge") %></h3>
			<% } %>
          <div class="card-body">
            <form action="register" id="formValidation" method="post">
            	<% if (session.getAttribute("cid") != null && session.getAttribute("cid").equals(501)) { %>
        			<input type="hidden" class="form-control" id="c" name="c" value="client">
        		<% } else { %>
        			<input type="hidden" class="form-control" id="c" name="c" value="customer">
        		<% } %>
              <div class="form-group hight">
                <label for="name">Enter Name:</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter username" required>
              </div>
              <div class="form-group hight">
                <label for="phone">Phone Number:</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number" required>
              </div>
              <div class="form-group">
                <label for="email">Email address:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
              </div>
              <div class="form-group hight">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter Password" required>
              </div>
              <div class="form-group hight">
                <label for="conpwd">Confirm Password:</label>
                <input type="password" class="form-control" id="conpwd" name="conpwd" placeholder="Confirm password" required>
              </div>
              <button type="submit" class="btn btn-primary btn-block" name="register">Register</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
        
    
</body>
</html>
