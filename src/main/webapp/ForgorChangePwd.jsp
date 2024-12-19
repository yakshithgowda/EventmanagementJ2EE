<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: url('image/ev4.avif') no-repeat center center fixed;
      background-size: cover;
      color: lightblue;
    }
    .login-container {
      background-color: rgba(212, 212, 212, 0.8);
      padding: 20px;
      border-radius: 10px;
      margin-top: 100px;
    }
    .form-group input, textarea {
      border: none;
      border-bottom: 1px solid #ddd; /* Add a bottom border */
      border-radius: 0; /* Remove border-radius */
      background-color: transparent; /* Make background transparent */
      color: black; /* Set text color to white */
    }
    .form-group input:focus, textarea {
      outline: none;
      border-color: #007bff; /* Change border color on focus */
    }
    .error {
      color: red;
    }
  </style>
</head>
<body>
<%@ include file="Header.jsp" %>
<script src="formValidation.js"></script>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-4">
      <div class="login-container">
        
        
        		<% if (session.getAttribute("cid") != null) { %>
        			<h2 class="text-center mb-4"style="color: blue;">Change Password</h2>
        		<% } else { %>
        			<h2 class="text-center mb-4"style="color: blue;">Forgot Password</h2>
        		<% } %>
        
        <% if (request.getAttribute("msg") != null) { %>
          <h5 style="color: green;"><%= request.getAttribute("msg") %></h5>
        <% } %>
        <% if (request.getAttribute("msge") != null) { %>
          <h4 style="color: red;"><%= request.getAttribute("msge") %></h4>
        <% } %>
        
        <form action="register" id="formValidation" method="post">
            <% if (session.getAttribute("cid") != null) { %>
        	  <div class="form-group">
                <label for="email">Email address:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%=session.getAttribute("cmail") %>" placeholder="Enter email" required>
              </div>
        	<% } else { %>
        	  <div class="form-group">
                <label for="email">Email address:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
              </div>
        	<% } %>
        	
              <div class="form-group hight">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter Password" required>
              </div>
              <div class="form-group hight">
                <label for="conpwd">Confirm Password:</label>
                <input type="password" class="form-control" id="conpwd" name="conpwd" placeholder="Confirm password" required>
              </div>
              <button type="submit" class="btn btn-primary btn-block" name="pass">Change Password</button>
            </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>
