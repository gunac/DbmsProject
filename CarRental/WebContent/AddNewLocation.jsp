<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="ApplicationDao.RentalDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<title>Add New Location</title>
<script>

function createNewLocationJSONObj(){
	var newloc =  $("#newlocation").val();
	insertNewLocation(newloc);
}

function insertNewLocation(newloc){
	$.ajax({
		url : "http://localhost:8080/CarRental/api/Location",
		type : "post",
		data : JSON.stringify(newloc),
		dataType : "json",
		contentType : "application/json",
		success : function(response) {
			location.reload();
		}
	})
}


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
	
	var tr = '';
    $.each(response, function (i, item) {
        tr += '<tr><td>'+ item.name +'</td></tr>';
    });
    $('#recordtable').append(tr);
	
}
</script>
</head>
<body>
<%
//allow access only if session exists
if(session.getAttribute("customerId") == null){
	response.sendRedirect("login.jsp");
}
String userEmail = null;
String sessionID = null;
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
<h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
  	<h3><em><u>Add New Location Page</u></em></h3>
  	
  	 <div class="form-group">
          <label for="name">New Location :</label>
          <input type="text" class="form-control" id="newlocation" placeholder="Enter New Location">
        </div>
        <p>
        <button id="addmodel" class="btn btn-primary" onClick="createNewLocationJSONObj()">Add Location</button>
  	
  	<p>
	<br>
	<div class="table-responsive">
  	<table id="recordtable" class="table table-hover">
	<tr><b> Locations Available</b></tr>
	</table>
	</div>
	
	<form action="AdminPage.jsp">
		<p>
	<button name="action" value="update" class="btn btn-warning"> Refresh Data from API</button>
	</form>
	
	<%
  	String action = request.getParameter("action");
  	
  	if("update".equals(action)) {
  		RentalDao dao = new RentalDao();
  		dao.insertRentalInfoForAllLocation();
	}
  	%>
  	
<br>
	<p>
	<a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button">HomePage</a>
	<p>
	<a href="AdminPage.jsp"  class="btn btn-warning" role="button">My Account</a>
	<p>
	<form action="/CarRental/logoutAction" method="post">
	<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
	</form>
	
   </div>

</body>
</html>