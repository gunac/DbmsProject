<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="ApplicationDao.RentalDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<title>Admin's Page</title>

<script>

function updatedatafromapi(){
	
	$.ajax({
		url : "http://localhost:8080/CarRental/api/Rental",
		type : "put"
	})
}

</script>

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
	<a href="CreateNewCustomerByAdmin.jsp" id="createnewcustomer" class="btn btn-warning" type="button"> Create account for Customer</a>
	
		<br>
		<p>
	<a href="NewAdminCreate.jsp" id="createnewadmin" class="btn btn-danger" type="button"> Create new Admin user</a>
	
	<br>
	<p>
		<a href="OrdersHistory.jsp" id="viewOrderHistory" class="btn btn-warning" type="button"> View All Orders</a>
	
		<br>
		<p>
	<a href="AddNewModel.jsp" id="addnewmodel" class="btn btn-primary" type="button"> Edit car model</a>
	
		<br>
		<p>
	<a href="AddNewLocation.jsp" id="addnewlocation" class="btn btn-success" type="button"> Add New Location</a>
	
	<form action="AdminPage.jsp">
		<p>
	<button name="action" value="update" class="btn btn-warning"> Refresh Data from API</button>
	</form>
	
	<%
  	String action = request.getParameter("action");
  	
  	if("update".equals(action)) {
  		RentalDao dao = new RentalDao();
  		dao.insertRentalInfoForAllLocation();
	}
  	%>
	
	<br>
		<p>
	<a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button"> Go to HomePage</a>
	
	<p>
	<form action="/CarRental/logoutAction" method="post">
	<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
	</form>
</div>

</body>
</html>