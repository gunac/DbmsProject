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
<script>
$(function() {
	$("#pickupdate").datepicker({ 
		minDate: 0, 
		maxDate: "+1M",
		dateFormat: "mm-dd-yy" }).val()
    $("#dropoffdate").datepicker({ 
    	minDate: 0, 
    	maxDate: "+1M",
    	dateFormat: "mm-dd-yy" }).val()
});

function buildHTMLTable(){

	$(function() {
		
		$.ajax({
			url: "http://localhost:8080/CarRental/api/Location",
			type:"get",
			dataType: "json",
			contentType: "application/json",
			success: function(response){
				responseHandler(response);
			}
		})
	});

	function responseHandler(response){
		
		 $(response).each(function(){ 
		 var option = $('<option />'); 
		 option.attr('value', this.name).text(this.name); 
		 $('#Location').append(option); 
	    })
	    
	}
	}
</script>
<title>HomePage - Best Car Rentals</title>

</head>


<style>

body {
   background-image: url("images/p1background.jpg");
   background-size: 100% 100%;
   background-repeat: repeat;
}
</style>

<body  onLoad="buildHTMLTable()">
<%
//allow access only if session exists
String customerId= null;
if(session.getAttribute("customerId") == null){
	response.sendRedirect("login.jsp");
}else customerId = session.getAttribute("customerId").toString();
int userId = 0;
String userEmail = null;
String sessionID = null;
int idrole = (Integer) session.getAttribute("roleid");
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
<td width="100%">
<td width="20%"> <% 
		 if (idrole == 2) { %>
			<a href="MyAccount.jsp" class="btn btn-warning" role="button">My
				Account</a>
		<% } else { %>
			<a href="AdminPage.jsp" class="btn btn-warning" role="button">My
				Account</a>
		<% } %></td>
<td width="20%"><form action="/CarRental/logoutAction" method="post">
	<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
	</form></td>
</tr>
</table>
</div>

	<div class="container">
		<h1 class="text-center">
			<u>BEST CAR RENTALS</u>
		</h1>
		<h3>
			<em><u>Home Page</u></em>
		</h3>

		<h4>
			<b>Hi <%=username %>,
			</b>
		</h4>
		<form method=post action="ListOfCarRental.jsp">
			<input type="hidden" name="sortType" value="true"/>
			<p>Choose the location and dates</p>
			
			<div class="form-group col-lg-2">
				<label for="Location">Location</label>
				 <select id="Location" name="location" class="form-control">				
					<option value="0" selected>- select -</option>
				</select>
			</div>
			<div class="form-group col-lg-2">
				<label for="Pickupdate">Pick Up Date</label> <input type="text"
					class="form-control" id="pickupdate" name="pickupdate">
			</div>
			<div class="form-group col-lg-2">
				<label for="Dropoffdate">Drop Off Date</label> <input type="text"
					class="form-control" id="dropoffdate" name="dropoffdate">
			</div>
			<div class="form-group">
				<br>
				<p>
					<input type="submit" class="btn btn-success" value="Search">
			</div>
		</form>
		
	</div>

</body>
</html>