<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="ApplicationDao.OrdersDao"%>
    <%@ page import="model.Orders"%>
    <%@ page import="ApplicationDao.CarModelDao"%>
    <%@ page import="model.CarModel"%>
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

<style>
body {
    background-image: url("images/p1background.jpg");
    background-size: 100% 100%;
    background-repeat: repeat;
}
</style>


<body>

<%

String test = request.getParameter("idField");
System.out.println(test);
int modelId = Integer.parseInt(request.getParameter("modelDropdown"+test));
int rentalId = Integer.parseInt(request.getParameter("rentalId"+test));
String location = request.getParameter("location");
String pickUpDay = request.getParameter("pickUpDay");
String dropDay = request.getParameter("dropDay");
CarModelDao modelDao = new CarModelDao();
CarModel c = modelDao.getModelById(modelId);
String modelName = c.getModelName();
System.out.println("ModelId:"+modelId);
System.out.println("RentalId:"+rentalId);
System.out.println("Location:"+location);
System.out.println("pickUpDay:"+pickUpDay);
System.out.println("dropDay:"+dropDay);
System.out.println("Model Name:"+modelName);


//allow access only if session exists
if(session.getAttribute("customerId") == null){
	response.sendRedirect("login.jsp");
}
String userId = null;
String sessionID = null;
int idrole = (Integer) session.getAttribute("roleid");
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
	
	<div style="margin-left: 5%;margin-right: 5%; margin-top:2%; margin-bottom: 2%" class="Container">
	<table>
<tr width="100%">
<td width="100%" margin-top:2%;> <a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button">HomePage</a></td>
<td width="20%"><% 
		 if (idrole == 2) { %>
			<a href="MyAccount.jsp" class="btn btn-warning" role="button">My
				Account</a>
		<% } else { %>
			<a href="AdminPage.jsp" class="btn btn-warning" role="button">My
				Account</a>
		<% } %></td>
<td width="20%"><form action="/CarRental/logoutAction" method="post">
	<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
	</form></td>
</tr>
</table>
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
				int id = Integer.parseInt(userId);
			
				int orderid = dao.insertOrder(id, rentalId, modelId,pickUpDay,dropDay,location);
				
				OrdersDao dao1 = new OrdersDao();
				Orders neworder = dao1.getOrderByOrderId(orderid);
			
			%>

			<table id="orderconfirmation" class="table">
			<tr>
			<td> Order Id : </td>
			<td> <%= orderid %> </td>
			</tr>
			
			<tr>
			<td> Location : </td>
			<td> <%= neworder.getLocation()%> </td>
			</tr>
			
			<tr>
			<td> Drop Off Date : </td>
			<td> <%= neworder.getDropoffDay() %> </td>
			</tr>
			
			<tr>
			<td> Pick Up Date : </td>
			<td> <%= neworder.getPickupDay()%> </td>
			</tr>
			
			<tr>
			<td> Model Name : </td>
			<td> <%= modelName%> </td>
			</tr>
			
			<tr>
			<td> Rent Per Day : </td>
			<td> <%= neworder.getDailyRate()%> </td>
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
			<td> <%= neworder.getTotalPrice() %> </td>
			</tr>	
			
			</table>
			
		
	</div>

</body>
</html>