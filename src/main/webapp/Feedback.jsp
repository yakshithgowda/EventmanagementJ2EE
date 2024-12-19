<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback Page</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: url('image/ev4.avif') no-repeat center center fixed;
      background-size: cover;
      color: lightblue;
    }
    .login-container {
      background-color: rgba(212, 212, 212, 0.5);
      padding: 20px;
      border-radius: 10px;
      margin-top: 100px;
    }
    .form-group input, .form-group textarea {
      border: none;
      border-bottom: 1px solid #ddd;
      border-radius: 0;
      background-color: transparent;
      color: white;
    }
    .form-group input:focus, .form-group textarea:focus {
      outline: none;
      border-color: #007bff;
    }
    .error {
      color: red;
    }
  </style>
</head>
<body>
  <%-- <%@ include file="Header.jsp" %> --%>
  <script src="formValidation.js"></script>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-4">
        <div class="login-container">
          <h2 class="text-center mb-4" style="color: blue;">Feedback Page</h2>
          
          <% if (request.getAttribute("msg") != null) { %>
            <h5 style="color: green;"><%= request.getAttribute("msg") %></h5>
          <% } %>
          <% if (request.getAttribute("msge") != null) { %>
            <h4 style="color: red;"><%= request.getAttribute("msge") %></h4>
          <% } %>
          
          <form action="register" method="post" id="formValidation">
          <%
            String bid = request.getParameter("bid");
          %>
          	<input type="hidden" class="form-control" id="bid" name="bid" value="<%= bid %>">
            <div class="form-group">
              <label for="rating" class="text-dark">Give Rating</label>
              <input type="range" min="0" max="5" value="0" class="form-range" id="rating" name="rating" required>
            </div>
            
            <div class="form-group">
              <label for="com" class="text-dark">Comment</label>
              <textarea class="form-control" id="com" name="com" placeholder="Give feedback" required></textarea>
            </div>
            
            <button type="submit" class="btn btn-primary btn-block col-lg-4 mx-auto" name="feedback">Submit</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
