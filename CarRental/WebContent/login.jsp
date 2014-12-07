<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<title>Login Page</title>

</head>
<body>
    <div class="container">
    <h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
      <h3><em><u>Login Page</u></em></h3>
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
      <form action="/CarRental/loginAction" method="post">
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="text" class="form-control" name="email" placeholder="Enter email">
        </div>
        <div class="form-group">
          <label for="pwd">Password:</label>
          <input type="password" class="form-control" name="pwd" placeholder="Enter password">
        </div>
        <button class="btn btn-primary" type="submit">Login</button>
      </form>
      <br>
        <p><b> Not a Member?</b>
        <a href="SignUp.jsp"  class="btn btn-link" role="button">Sign Up</a>
        </p>
         <img src="images/Login page scenary.jpg" class="img-responsive" alt="image">
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>
