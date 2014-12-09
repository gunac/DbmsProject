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
<title>My Account Page</title>

<script>

$(function() {
	$("#dateofbirth").datepicker({ dateFormat: "yy-mm-dd" }).val()
});

$(function(){
	
	var userid = document.cookie.split('=');
	var id= parseInt(userid[1]);
	
	$.ajax({
		url: "http://localhost:8080/CarRental/api/Customer/" + id,
		type:"get", 
		dataType: "json",
		contentType: "application/json",
		success: function(response){
			customerprefillResponseHandler(response);
		}
	})
});


function customerprefillResponseHandler(response){
	
	var birthdate = new Date(response.dob);
	alert(birthdate);
	
 document.getElementById('name').value = response.name;
 document.getElementById('licenseno').value = response.licenseNo;
 //document.getElementById('dateofbirth').value = birthdate;
 $("#dateofbirth").datepicker('setDate', birthdate);
 document.getElementById('email').value = response.email;
 document.getElementById('pwd').value = response.password;

}

function updateUserdetails(){
	
	var userid = document.cookie.split('=');
	var id= parseInt(userid[1]);
	
	
	var newCustomer = {
			"customerId": id, 
			"name":$("#name").val(), 
			"dob":$("#dateofbirth").val(), 
			"email": $("#email").val(), 
			"password": $("#pwd").val(), 
			"licenseNo": $("#licenseno").val(), 
			"roleId": 2};
	
	updateCustomer(id, newCustomer);
}

function updateCustomer(id, customer){
	
	$.ajax({
		url: "http://localhost:8080/CarRental/api/Customer/"+ id,
		type:"put",
		data: JSON.stringify(customer),
		dataType: "json",
		contentType: "application/json",
		success: function(response){
			console.log(response);
		}
	})
}

</script>

</head>
<body>

<%
//allow access only if session exists
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
<h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
  	<h3><em><u>My Account Page</u></em></h3>
  	
  	<form role="SignUpPage-form">
        <p>Edit your personal information</p>
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" class="form-control" id="name" placeholder="Enter name">
        </div>
        <div class="form-group">
        <label for="dateofbirth">Date Of Birth</label>
          <input type="text" class="form-control" id="dateofbirth">
        </div>
        <div class="form-group">
          <label for="licenseno">Driver's License No:</label>
          <input type="text" class="form-control" id="licenseno" placeholder="Enter Driver's License No">
        </div>
        <div class="form-group">
          <input type="hidden" class="form-control" id="email">
        </div>
        <div class="form-group">
          <input type="hidden" class="form-control" id="pwd">
        </div>
        <button id="updateUserDetails" class="btn btn-warning" onClick="updateUserdetails()"> Update My details</button>
        </form>
		<br>
		<p>
		<p>
		<br>
		<a href="OrdersHistory.jsp" id="viewOrderHistory" class="btn btn-warning" type="button"> View My Order History</a>
		</p>
		<br>	
		<a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button"> Go to HomePage</a>
		<p>
	<form action="/CarRental/logoutAction" method="post">
	<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
	</form>
</div>

</body>
</html>