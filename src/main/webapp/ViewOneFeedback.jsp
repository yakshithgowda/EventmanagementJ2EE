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

</head>
<body>
		<%@page import="com.ps.Model.EventList"%>
        <%@page import="com.ps.Model.AdminDAO"%>
        <%@page import="com.ps.Model.Feedback"%>
        <%@page import="java.util.*"%>
	<%
	AdminDAO ad=new AdminDAO(session);
	int bid =Integer.parseInt( request.getParameter("bid"));
	Feedback f=ad.getFeedback(bid);
	%>
	
	<div class="container-fluid d-flex text-center justify-content-center align-items-center vh-100">
    <div class="col-md-4">
      <div class="card h-100" style="width: 30rem;">
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-dark">Event Name: <%= f.geteName() %></h5>
          <h5 class="card-title text-dark">Rating: <%= f.getRating() %></h5>
          <p class="card-text text-dark flex-grow-1"><b>Comment:</b> <br><%= f.getComment() %></p>
          <button style="width:200px align:center" class="btn btn-primary"><a href="ViewBookEvent.jsp" class="text-white">Back</a></button>
        </div>
      </div>
    </div>
</div>
</body>
</html>
