<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<title>Login</title>
<script>
function getExistingUserJSONObj(){

	alert("inside get function");
				var email= $("#email").val();
				var password = $("#pwd").val();
		
		getCustomer(email,password);
		alert("got Existing Customer");
	}

	function getCustomer(email,password){
		alert("inside ajax");
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
</head>
<body>
    <div class="container">
    <h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
      <h3><em><u>Login Page</u></em></h3>
      <form action="/CarRental/loginAction" method="post">
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="text" class="form-control" id="email" placeholder="Enter email">
        </div>
        <div class="form-group">
          <label for="pwd">Password:</label>
          <input type="password" class="form-control" id="pwd" placeholder="Enter password">
        </div>
        <button id="submitexistinguser" class="btn btn-primary">Submit</button>
      </form>
      <br>
        <p><b> Not a Member?</b>
        <a href="SignUp.jsp"  class="btn btn-link" role="button">Sign Up</a>
        </p>
        <!--  <img src="\images\login page scenary.jpg" class="img-responsive" alt="image"> -->
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>
