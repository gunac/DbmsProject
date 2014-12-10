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

function refreshListJS()
{
	//alert("In RS");
	var sortType = "<%=request.getParameter("sortType")%>";
	var newSortType = "true";
	
	if(sortType=="true")
		{
			newSortType="false";
			//document.getElementById("sort").value = "Sort Low-To-High";
		}
	//alert("In RS"+sortType+":"+newSortType);
	document.getElementById("sort").setAttribute("sortType", newSortType);
	var updatedLoc = "http://localhost:8080/CarRental/ListOfCarRental.jsp?location=<%=request.getParameter("location")%>&dropoffdate=<%=request.getParameter("dropoffdate")%>&pickupdate=<%=request.getParameter("pickupdate")%>&sortType="+newSortType;
	
	
	//alert(updatedLoc);
	//alert("<%=request.getParameter("location")%>");
	window.location = updatedLoc;	
}

function updateValues()
{
	var sortType = "<%=request.getParameter("sortType")%>";
	//alert(sortType);
	if(sortType=="true")
	{
		document.getElementById("sort").value = "Sort High-To-Low";
	}
	else
	{
		document.getElementById("sort").value = "Sort Low-To-High";
	}
}

function setId(i)
{
	document.getElementById("idField").value = i;
}

function onSubmitCheck()
{
	var currentId = document.getElementById("idField").value;
	var dropdownCurrentVal = document.getElementById("modelDropdown"+currentId).value;
	if(dropdownCurrentVal==0)
	{
		alert("Please select a Model");
		return false;
	}
	return true;
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
<body onload="updateValues()">
<form method="post" action="OrderCheckout.jsp" onsubmit="return onSubmitCheck()">
<input type="hidden" id="idField" name="idField" value = "-1"/>
<input type="hidden" id="location" name="location" value = "<%= request.getParameter("location")%>"/>
<input type="hidden" id="pickUpDay" name="pickUpDay" value = "<%= request.getParameter("pickupdate")%>"/>
<input type="hidden" id="dropDay" name="dropDay" value = "<%= request.getParameter("dropoffdate")%>"/>

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
		String location = request.getParameter("location");
		List<Rental> lstrental;
		// get rental info based on location
		String sortType = request.getParameter("sortType");
		System.out.println(sortType);
		if(sortType.equals("true"))
 			lstrental = (List<Rental>) rentalDao.getRentalInfoByLocation(request.getParameter("location"), true);
		else
			lstrental = (List<Rental>) rentalDao.getRentalInfoByLocation(request.getParameter("location"), false);
 		String pickUpDay = request.getParameter("pickupdate");
 		String dropDay = request.getParameter("dropoffdate");
 		String loc = request.getParameter("location");
		 		
	%>	 
	<table class="table">
	<tr>
		<td></td>
		<td align="center"><input type ="button" id="sort" name="sort" value ="Sort High-To-Low"  
		onclick="refreshListJS()"/></td>
		<td></td>
		<td></td>
	</tr>
		<%
		for(int i = 0; i<lstrental.size(); i++){				
			// USed to set Name and Image
			Rental r = lstrental.get(i);
			CarType carTypeObj = new CarType();
			for(CarType c: lstCarType){
				if(c.getCarTypeCode().equals(r.getCarTypeCode()))
				{
					carTypeObj = c;
				}

			}			
			%>
		
		
		<tr>
			<input type="hidden" name="rentalId<%=i %>" value="<%=r.getRentId() %>"/>
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
				<ul>
				<select id="modelDropdown<%= i %>" name="modelDropdown<%= i %>">
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

									for (CarModel scm : lstselectedModels) 
									{%>
										<option value="<%=scm.getModelId()%>"><%=scm.getModelName()%></option>
									<%}%>
					</select>
				</ul></td>
			<td>
			<ul><%=carTypeObj.getSeatingInfo()%></ul>
				<ul>
					<button id="continue" class="btn btn-success" value="placeorder" type="submit" onclick="setId(<%=i%>)"> Place Order</button>
				</ul>
			</td>
		</tr>
		<%}%>
	</table>
	</div>
	</form>
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
</body>
</html>