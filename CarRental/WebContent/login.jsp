<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/login.css">

<script src="js/jquery.js"></script>
<title>Login Page</title>

</head>
<body>
    <img class="headerimg" src="images/CarRentalHeader.jpg"/>
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

<div class="container" id="container">
  <div class="login">
    <h1 align="center"> Login</h1>
    <form action="/CarRental/loginAction" method="post">
      <p><input type="text" name="email" value="" placeholder="Email"></p>
      <p><input type="password" name="pwd" value="" placeholder="Password"></p>
      <p class="submit"><input type="submit" name="commit" value="Login"></p>
	  <p align="center"> Not a Member? <a href="SignUp.jsp" role="button">Sign Up</a></p>
    </form>
  </div>
 
 
</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>