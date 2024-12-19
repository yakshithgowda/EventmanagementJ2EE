<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>

    <!-- Uncomment these links for Bootstrap and jQuery validation libraries -->
    <!-- 
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    -->

    <style>
        .body {
            background: url("image/th.jpg") no-repeat center center;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .card {
            background-color: black;
            opacity: 0.7;
            color: aqua;
            font-weight: 900;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body class="body">
    <%@ include file="Header.jsp" %>
    <script src="formValidation.js"></script>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="card mt-5">
                    <div class="card-header text-center">
                        <h3>Login</h3>
                        <% if (request.getAttribute("msg") != null) { %>
                            <h3 style="color: green;"><%= request.getAttribute("msg") %></h3>
                        <% } %>
                        <% if (request.getAttribute("msge") != null) { %>
                            <h3 style="color: red;"><%= request.getAttribute("msge") %></h3>
                        <% } %>
                    </div>
                    <div class="card-body">
                        <form action="register" id="formValidation" method="post">
                            <div class="form-group">
                                <label for="pm">Email address</label>
                                <input type="email" class="form-control" id="pm" name="pm" placeholder="Enter email" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password</label>
                                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block" name="login">Login</button>
                            <div class="text-center mt-3">
                                <a href="ForgorChangePwd.jsp" class="text-primary">Forgot Password?</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Uncomment these scripts for Bootstrap JS and dependencies -->
    <!-- 
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    -->
</body>
</html>
