<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Table with Search and Delete</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url(https://media.istockphoto.com/id/1433126327/photo/festive-glittering-falling-confetti-elegant-colorful-particle-flow-gentle-stream-of-luxury.jpg?s=612x612&w=0&k=20&c=Zim1HKZ-6djGzraE9gk1RKamQdv1GHxytX6diZZv-yI=);
            color: #fff;
            background-size: cover;
            background-repeat: no-repeat;
            padding: 20px;
        }
        .search-bar {
            margin-bottom: 20px;
            border-radius: 25px;
            padding: 10px 20px;
            border: 1px solid #ced4da;
            background-color: #c0b1d8;
            color: #495057;
        }
        .table-wrapper {
            background-color: rgba(141, 135, 194, 0.9);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            border-radius: 15px;
            overflow: hidden;
        }
        thead {
            background-color: #343a40;
            color: #fff;
        }
        tbody tr:nth-child(odd) {
            background-color: rgba(183, 181, 202, 0.9);
        }
        tbody tr:hover {
            background-color: rgba(183, 181, 202, 0.9);
        }
        .table td, .table th {
            vertical-align: middle;
            text-align: center;
        }
    </style>
</head>
<body>
	<%@include file="Header.jsp"%>
    <div class="container">
        <div class="table-wrapper">
            <h2 class="mb-4 text-center text-dark">Event Lists</h2>
            
			<%if(request.getAttribute("msge")!=null){ %>
  				<h3 style="color:red"> <%= request.getAttribute("msge") %> </h3>
  			<%}else if(request.getAttribute("msg")!=null){%>
  				<h3 style="color:green"> <%= request.getAttribute("msg") %> </h3>
  			<%} %>
            
            <div class="container-fluid col-8 mx-auto text-center">
  				<input class="form-control text-center" type="text" id="search" placeholder="Search...">
  			</div><br>
            <table class="table table-bordered">
                <thead class="table table-dark">
                    <tr>
                    	<th>event ID</th>
                        <th>Event Name</th>
                        <th>Description</th>
                        <th>Delete</th>
                    </tr>
                </thead >
                <tbody id="table" class="table table-info">
                	<%@page import="java.util.Iterator"%>
					<%@page import="java.util.ArrayList"%>
					<%@page import="com.ps.Model.EventList"%>
					<%@page import="com.ps.Model.AdminDAO"%>
                    <% if (session.getAttribute("cid") != null && session.getAttribute("cid").equals(501)) {
                        	AdminDAO ad = new AdminDAO(session);
                                ArrayList<EventList> mydata = ad.getEventList();
                                
                                Iterator<EventList> itr = mydata.iterator();
                                while (itr.hasNext()) {
                                	EventList d = itr.next();
                        %>
                        <tr>
                            <td><%= d.getEid() %></td>
							<td><%= d.getName() %></td>
							<td><%= d.getDes() %></td>
                            <td>
                                <form action="admin" method="post">
                                    <input type="hidden" name="id" value="<%=d.getEid()%>"/>
                                    <input type="hidden" name="tname" value="event"/>
                                    <input type="submit" class="btn btn-danger" name="delete" value="delete" />
                                </form>
                            </td>
                        </tr> 

                        <%}
                        }%> 
                    
                </tbody>
            </table>
        </div>
    </div>

    <script>
    	$(document).ready(function(){
    	  $("#search").on("keyup", function() {
    	    var value = $(this).val().toLowerCase();
    	    //alert(value);
    	    $("#table tr").filter(function() {
    	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > 0)
    	      //alert(this);
    	    });
    	  });
    	});
    </script>
</body>
</html>