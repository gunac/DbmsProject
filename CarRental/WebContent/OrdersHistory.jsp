<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<title>Orders History Page</title>

<script>

$(function() {
	
	var userid = document.cookie.split('=');
	var id= parseInt(userid[1]);
	var roleid = $("#idrole").val();
	
	alert(id);
	
	if (roleid == "2"){
	getorderforcustomer(id);
	} else{
		getallorders();
	}
	
});

function getorderforcustomer(id){
	
	$.ajax({
		url: "http://localhost:8080/CarRental/api/Orders/" + id,
		type:"get",
		dataType: "json",
		contentType: "application/json",
		success: function(response){
			modelResponseHandler(response);
		}
	})
}

function getallorders(){
	
	$.ajax({
		url: "http://localhost:8080/CarRental/api/Orders",
		type:"get",
		dataType: "json",
		contentType: "application/json",
		success: function(response){
			modelResponseHandler(response);
		}
	})
}

function modelResponseHandler(response){
	
    var tr = '';
     $.each(response, function (i, item) {
    	 var dday = new Date(item.dropoffDay);
    	 var pday = new Date(item.pickupDay);
         tr += '<tr><td>'+ item.orderId +'</td><td>'+ item.location +'</td><td>'+ item.totalPrice +'</td><td>'+ item.dailyRate +'</td><td>'+ dday +'</td><td>'+ pday +'</td><td>'+ item.rentalDays +'</td></tr>';
     });
     $('#orderhistory').append(tr);
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
int idrole = (Integer) session.getAttribute("roleid");
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
  	<h3><em><u>My Orders History Page</u></em></h3>
	<input type="hidden" name="idrole" id="idrole" value="<%= idrole %>">
	<table id="orderhistory" class="table">
	<tr><td><b>Order Id</b></td><td><b>Location</b></td><td><b>Total Price</b></td><td><b>Daily Rate</b></td><td><b>Drop Off Day</b></td><td><b>Pick Up Day</b></td><td><b>No.of Days Rented</b></td></tr>
	</table>

<br>
	<p>
	<a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button">HomePage</a>
		 <% 
		 if (idrole == 2) { %>
		<p>
			<a href="MyAccount.jsp" class="btn btn-warning" role="button">My
				Account</a>
		<p>
		<% } else { %>
		<p>
			<a href="AdminPage.jsp" class="btn btn-warning" role="button">My
				Account</a>
		<p>
		<% } %>
		<form action="/CarRental/logoutAction" method="post">
			<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
		</form>
		</div>

</body>
</html>