<%@ page import="ApplicationDao.CarTypeDao"%>
<%@ page import="ApplicationDao.CarModelDao"%>
<%@ page import="ApplicationDao.RentalDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.CarType"%>
<%@ page import="model.CarModel"%>
<%@ page import="model.Rental"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<title>List Of Car Rental</title>
<Script>

function createorder(){
	
	var userid = document.cookie.split('=');
	
	var customerId = parseInt(userid[1]);
	var rentalId = $("#rentalid").val();
	var modelId = $("#modelid").val();
	var pickupday = $("#rentalid").val();
	var dropoffday = $("#modelid").val();
	
	insertOrder(customerId, rentalId, modelId, pickupday, dropoffday);
}

function insertOrder(customerId, rentalId, modelId, pickupday, dropoffday){
	$.ajax({
		url : "http://localhost:8080/CarRental/api/Orders/" + customerId+ "/" + rentalId + "/"+ modelId + "/" + pickupday + "/" + dropoffday,
		type : "put",
		contentType: "application/json",
		success : function(response) {
			responseHandler(response);
		}
	})
}

function responseHandler(response){
	//alert(response);
	//document.getElementById('orderid').value = 2;
	
}

</Script>

<style>
#slide-images {
	height: 142px;
	margin-bottom: 5px;
	display: block;
}

#resultDetails {
	border: 1px solid #e1e1e1;
	display: block;
	font-size: 12px;
	height: 114px;
	margin: 0;
	padding: 7px 0 14px 18px;
}
</style>

</head>
<body>

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

<div class="Container">
<h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
  	<h3><em><u>List Of Car Rentals Available Page</u></em></h3>
	<%
		CarTypeDao carTypeDao = new CarTypeDao();
		List<CarType> lstCarType = carTypeDao.getAllCarTypes();
		RentalDao rentalDao = new RentalDao();
		List<Rental> lstrental = new ArrayList<Rental>();
		// get rental info based on location
 		lstrental = (List<Rental>) rentalDao.getRentalInfoByLocation(request.getParameter("location"));
 		String pickUpDay = request.getParameter("pickupdate");
 		String dropDay = request.getParameter("dropoffdate");
 		String loc = request.getParameter("location");
		 		
	%>	 
	
	<table class="table">
		<%
			for(Rental r: lstrental){ 
				
			// USed to set Name and Image
			CarType carTypeObj = new CarType();
			for(CarType c: lstCarType){
				if(c.getCarTypeCode().equals(r.getCarTypeCode()))
				{
					carTypeObj = c;
				}

			}			
			%>
			<form method="post" action="OrderCheckout.jsp">
		<tr>
			<div>
			<td><ul><%=carTypeObj.getCarTypeName()%></ul>
				<ul>
					<img id="test" src="images/<%=carTypeObj.getCarTypeName()%>.png">
				</ul></td>
				<td>
					<ul><b>Sub Total :</b><%=r.getSubTotal() %></ul>
					<ul><b>Daily Rate :</b> <%=r.getDailyRate() %></ul>
					<ul><b>Taxes & Fees :</b><%=r.getTaxesAndFees() %></ul>
					<ul><b>Total Price :<b><%=r.getTotalPrice()%></ul>
					
					</td>
			<td><ul><label> Select a Model </label>	</ul>
				<ul><select name="carType">
					<option value="0" selected>- select -</option>
						<%
							CarModelDao modelDao = new CarModelDao();
								List<CarModel> lstCarModel = modelDao.getAllCarModel();
								List<CarModel> lstselectedModels = new ArrayList<CarModel>();
								for (CarModel cm : lstCarModel) {
									if (cm.getCarTypeCode().equals(r.getCarTypeCode())) {
										lstselectedModels.add(cm);
									}
								}

									for (CarModel scm : lstselectedModels) {
							%>
						<option value="<%=scm.getModelId()%>"><%=scm.getModelName()%></option>
						<input type="hidden" id="modelid" name="modelid" value="<%=scm.getModelId()%>">
						<input type="hidden" id="rentalid" name="rentalid" value="<%=r.getRentId()%>">
						<input type="hidden" id="pickupday" name="pickupday" value="<%= pickUpDay%>">
						<input type="hidden" id="dropoffday" name="dropoffday" value="<%= dropDay %>">
						<input type="hidden" id="location" name="location" value="<%= loc %>">
						<%
								}
							%>
					</select>
				</ul></td>
			<td><ul><%=carTypeObj.getSeatingInfo()%></ul>
				<ul>
					<button id="continue" class="btn btn-success" value="placeorder" type="submit"> Place Order</button>
				</ul></td>
			</div>
		</tr>
	</form>
		<%}%>
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