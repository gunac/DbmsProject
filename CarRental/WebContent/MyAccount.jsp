<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<title>My Account Page</title>
</head>
<body>

<%
//allow access only if session exists
if(session.getAttribute("customerId") == null){
	response.sendRedirect("login.jsp");
}
String userEmail = null;
String sessionID = null;
String username = (String) session.getAttribute("username");
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("customerId")) userEmail = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}
%>

<div class="container">
<h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
  	<h3><em><u>My Account Page</u></em></h3>
  	
  	<br>
		<p>
		<a href="ViewOrderHistory.jsp" id="viewOrderHistory" class="btn btn-warning" type="button"> View My Order History</a>
		</p>
  	
  	<br>
		<p>
		<a href="UpdateUserAccountDetails.jsp" id="updateUserDetails" class="btn btn-warning" type="button"> Update My details</a>
		</p>
		
	<br>
		<p>
		<a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button"> Go to HomePage</a>
		</p>
		<p>
	<form action="/CarRental/logoutAction" method="post">
	<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
	</form>
</div>

</body>
</html>