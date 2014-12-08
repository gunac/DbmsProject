<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<title>Admin's Page</title>
</head>
<body>

<%
//allow access only if session exists
String customerId= null;
if(session.getAttribute("customerId") == null){
	response.sendRedirect("login.jsp");
}else customerId = (String) session.getAttribute("customerId");
int userId = 0;
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
  	<h3><em><u>Admin's Page</u></em></h3>
  	
  	<h3>Hi <%=username %></h3>
  	
		<br>
		<p>
	<a href="SignUp.jsp" id="createnewcustomer" class="btn btn-warning" type="button"> Create account for Customer</a>
	
		<br>
		<p>
	<a href="NewAdminCreate.jsp" id="createnewadmin" class="btn btn-danger" type="button"> Create new admin</a>
	
		<br>
		<p>
	<a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button"> Go to HomePage</a>
	
		<br>
		<p>
	<a href="AddNewModel.jsp" id="addnewmodel" class="btn btn-warning" type="button"> Add new car model</a>
	
		<br>
		<p>
	<a href="EditCarModel.jsp" id="editcarmodel" class="btn btn-primary" type="button"> Edit car model</a>
	
		<br>
		<p>
	<a href="DeleteCarModel.jsp" id="deletecarmodel" class="btn btn-danger" type="button"> Delete car model</a>
	
		<br>
		<p>
	<a href="AddLocation.jsp" id="addnewlocation" class="btn btn-success" type="button"> Add New Location</a>
	<p>
	<form action="/CarRental/logoutAction" method="post">
	<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
	</form>
</div>

</body>
</html>