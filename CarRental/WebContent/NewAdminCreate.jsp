<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
$(function() {
	$("#dateofbirth").datepicker({ 
		changeMonth: true,
	    changeYear: true,
		dateFormat: "yy-mm-dd" }).val()
});


function createNewAdminJSONObj(){

$(function() {
	
	var newCustomer = {
			"customerId": 2, 
			"name":$("#name").val(), 
			"dob":null, 
			"email": $("#email").val(), 
			"password": $("#pwd").val(), 
			"licenseNo": null, 
			"roleId": 1};
	
	createCustomer(newCustomer);
});
}

function createCustomer(customer){
	
	$.ajax({
		url: "http://localhost:8080/CarRental/api/Customer",
		type:"post",
		data: JSON.stringify(customer),
		dataType: "json",
		contentType: "application/json",
		success: function(response){
			console.log(response);
		}
	})
}

</script>
<title>Create New Admin - Page</title>
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

<div style="margin-left: 5%;margin-right: 5%; margin-top:2%; margin-bottom: 2%" class="Container">
<table>
<tr width="100%">
<td width="100%"> <a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button">HomePage</a></td>
<td width="20%"><a href="AdminPage.jsp"  class="btn btn-warning" role="button">My Account</a></td>
<td width="20%"><form action="/CarRental/logoutAction" method="post">
	<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
	</form></td>
</tr>
</table>
<h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
  	<h3><em><u>Create New Admin Page</u></em></h3>
		<form role="SignUpPage-form">
        <p>Enter new Admin information</p>
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" class="form-control" id="name" placeholder="Enter name">
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="text" class="form-control" id="email" placeholder="Enter email">
        </div>
        <div class="form-group">
          <label for="pwd">Password:</label>
          <input type="password" class="form-control" id="pwd" placeholder="Enter password">
        </div>
        <button id="submitnewadmin" class="btn btn-primary" onClick="createNewAdminJSONObj()">Submit</button>
   </form>
   
   <br>
	
	</div>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>