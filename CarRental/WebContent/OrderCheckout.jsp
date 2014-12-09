<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="ApplicationDao.OrdersDao"%>
    <%@ page import="model.Orders"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<title>Order Checkout Page</title>
</head>
<body>

<%
//allow access only if session exists
String test = request.getParameter("idField");
String modelId = request.getParameter("modelDropdown"+test);
String rentalId = request.getParameter("rentalId"+test);
String location = request.getParameter("location");
String pickUpDay = request.getParameter("pickUpDay");
String dropDay = request.getParameter("dropDay");


System.out.println("ModelId:"+modelId);
System.out.println("RentalId:"+rentalId);
System.out.println("Location:"+location);
System.out.println("pickUpDay:"+pickUpDay);
System.out.println("dropDay:"+dropDay);


if(session.getAttribute("customerId") == null){
	response.sendRedirect("login.jsp");
}
String userId = null;
String sessionID = null;
String useremail = (String) session.getAttribute("useremail");
String username = (String) session.getAttribute("username");
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("customerId")) userId = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}
%>
	
	<div class="container">
		<h1 class="text-center">
			<u>BEST CAR RENTALS</u>
		</h1>
		<h3>
			<em><u>Order Checkout Page</u></em>
		</h3>

		<h4>
			<b>Hi <%=username %>,</b>
		</h4>
			<p>Your Order has been confirmed. Please find the details below.</p>
			
			<% 
				OrdersDao dao = new OrdersDao();
				String id = request.getParameter("orderid");
				int orderid = Integer.parseInt(id);
				
				Orders neworder = dao.getOrderByOrderId(orderid);
			
			%>

			<table id="orderconfirmation" class="table">
			<tr>
			<td> Order Id : </td>
			<td> <%= orderid %> </td>
			</tr>
			
			<tr>
			<td> Drop Off Day : </td>
			<td> <%= neworder.getDropoffDay() %> </td>
			</tr>
			
			<tr>
			<td> Location : </td>
			<td> <%= neworder.getLocation()%> </td>
			</tr>
			
			<tr>
			<td> PickUpDate : </td>
			<td> <%= neworder.getPickupDay()%> </td>
			</tr>
			
			<tr>
			<td> Rental Days : </td>
			<td> <%= neworder.getRentalDays()%> </td>
			</tr>
			
			<tr>
			<td> Sub Total : </td>
			<td> <%= neworder.getSubTotal()%> </td>
			</tr>
				
			<tr>
			<td> Taxes and Fees : </td>
			<td> <%= neworder.getTaxesAndFees()%> </td>
			</tr>
			
			<tr>
			<td> Total Price : </td>
			<td> <%= neworder.getTotalPrice() * neworder.getRentalDays() %> </td>
			</tr>	
			
			</table>
			
		<br>
	<p>
	<a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button">HomePage</a>
		<p>
			<a href="MyAccount.jsp" class="btn btn-warning" role="button">My
				Account</a>
		<p>
		<form action="/CarRental/logoutAction" method="post">
			<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
		</form>
	</div>

</body>
</html>