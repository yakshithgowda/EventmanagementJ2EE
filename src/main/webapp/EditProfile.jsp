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
        <h2 class="text-center mb-4"style="color: blue;">Edit Details</h2>
        <% if (request.getAttribute("msg") != null) { %>
          <h5 style="color: green;"><%= request.getAttribute("msg") %></h5>
        <% } %>
        <% if (request.getAttribute("msge") != null) { %>
          <h4 style="color: red;"><%= request.getAttribute("msge") %></h4>
        <% } %>
        <form action="register" id="formValidation" method="post">
        	  <div class="form-group hight">
                <label for="id">ID:</label>
                <input type="number" class="form-control" id="id" name="id" value="<%=session.getAttribute("cid") %>" placeholder="Enter username" readonly>
              </div>
              <div class="form-group hight">
                <label for="name">Enter Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="<%=session.getAttribute("cname") %>" placeholder="Enter username" required>
              </div>
              <div class="form-group hight">
                <label for="phone">Phone Number:</label>
                <input type="text" class="form-control" id="phone" name="phone" value="<%=session.getAttribute("cphone") %>" placeholder="Enter phone number" required>
              </div>
              <div class="form-group">
                <label for="email">Email address:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%=session.getAttribute("cmail") %>" placeholder="Enter email" required>
              </div>
              <button type="submit" class="btn btn-primary btn-block" name="update">Update Details</button>
            </form>
        
        
      </div>
    </div>
  </div>
</div>

</body>
</html>
