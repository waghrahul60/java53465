<%@page import="com.dto.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.FlightAdminServiceImple"%>
<%@page import="com.service.FlightAdminService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%
	String user_name = session.getAttribute("user_name").toString();
	if(user_name!=null && user_name.equals("kunal")){
%>


<%@ include file="cache_control.jsp"  %>
<%@ include file="admin_header.jsp"  %>
   
    
<jsp:useBean id="flight" class="com.dto.Flight" scope="page"></jsp:useBean>
<%
	FlightAdminService flightAdminService = new FlightAdminServiceImple();
	ArrayList<Flight> list = flightAdminService.displayAllFlights();
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Flights</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
	<div class="jumbotron d-flex justify-content-center align-items-center bg-secondary">
		<h1>ALL FLIGHTS</h1>
	</div>
		<div class="row justify-content-center align-items-center mt-5">
			<div class="col-10">
				<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Flight No.</th>
      <th scope="col">To</th>
      <th scope="col">From</th>
      <th scope="col">Date</th>
      <th scope="col">Time</th>
      <th scope="col">No of Seats</th>
      <th scope="col">Booked Seats</th>
      <th scope="col">Amount</th>
      <th scope="col">Update</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
  
  <% for(Flight f : list){ %>
    <tr>
      <th scope="row"><%=f.getFlightNo() %></th>
      <td><%=f.getFlightTo() %></td>
      <td><%=f.getFlightFrom() %></td>
      <td><%=f.getDate() %></td>
      <td><%=f.getTime() %></td>
      <td><%=f.getNoOfSeats() %></td>
      <td><%=f.getBookedSeats() %></td>
      <td><%=f.getAmount() %></td>
      <td><a href="update_form.jsp?flightNo=<%=f.getFlightNo()%>">Update</a> </td>
      <td><a href="delete.jsp?flightNo=<%=f.getFlightNo()%>">Delete</a></td>
    </tr>
    <%} %>
  </tbody>
</table>			
			</div>
		</div>
	
	</div>
</body>
</html>

<%
	}
else{
	response.sendRedirect("admin_login.jsp");
}

%>