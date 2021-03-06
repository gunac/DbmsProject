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
<link rel="stylesheet" href="/resources/demos/style.css">
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
	alert("Created New Admin");
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
<div class="container">
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
   </div>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>