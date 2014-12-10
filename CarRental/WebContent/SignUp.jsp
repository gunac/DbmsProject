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


function createNewUserJSONObj(){

$(function() {
	
	var newCustomer = {
			"customerId": 2, 
			"name":$("#name").val(), 
			"dob":$("#dateofbirth").val(), 
			"email": $("#email").val(), 
			"password": $("#pwd").val(), 
			"licenseNo": $("#licenseno").val(), 
			"roleId": 2};
	
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
<title>Create a New Customer Account</title>
</head>

<body>
<div style="margin-left: 5%;margin-right: 5%; margin-top:2%; margin-bottom: 2%" class="Container">
<h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
  	<h3><em><u>Create a New Customer Account</u></em></h3>
  	 <%
    if(null!=request.getAttribute("errorMessage"))
    {%>
    	<p style="color:red">
    	<%
        out.println(request.getAttribute("errorMessage"));
    	%>
    	</p>
    	<%
    }
%>
  	
		<form action="/CarRental/SignUpAction" method="post">
        <p>Enter your personal information</p>
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" class="form-control" id="name" name="name" placeholder="Enter name">
        </div>
        <div class="form-group">
        <label for="Pickupdate">Date Of Birth</label>
          <input type="text" class="form-control" id="dateofbirth" name="dateofbirth">
        </div>
        <div class="form-group">
          <label for="licenseno">Driver's License No:</label>
          <input type="text" class="form-control" id="licenseno" name="licenseno" placeholder="Enter Driver's License No">
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
        </div>
        <div class="form-group">
          <label for="pwd">Password:</label>
          <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
        </div>
        <button id="submitnewuser" class="btn btn-primary">Create Account</button>
   </form>
   		<br>
   		<p>
			<a href="login.jsp" class="btn btn-warning" role="button">Go to Login Page</a>
		<p>
   
   </div>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>