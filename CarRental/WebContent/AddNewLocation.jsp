<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="ApplicationDao.RentalDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Add New Location</title>
<script>

function deleteLocation(name){
	
	$.ajax({
		url : "http://localhost:8080/CarRental/api/Location/" + name,
		type : "delete",
			success: function(html){
                location.reload();
            }
	})
}

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
        tr += '<tr><td>'+ item.name +'</td><td><button id="delete" class="btn btn-danger" onClick="deleteLocation(\''+ item.name +'\')"> Delete </button></td></tr>';
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
<p>

	 
	

<div style="margin-left: 5%;margin-right: 5%; margin-top:2%; margin-bottom: 2%" class="Container">
<table>
<tr width="100%">
<td width="100%"> <a href="HomePage.jsp" id="homepage" class="btn btn-success" type="button">HomePage</a></td>
<td width="20%"><a href="AdminPage.jsp"  class="btn btn-warning" role="button">My Account</a></td>
<td width="20%"><form action="/CarRental/logoutAction" method="post">
	<button class="btn btn-danger" type="submit" value="Logout">Logout</button>
	</form></td>
</tr>
</table>


<h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
  	<h3><em><u>Add/Delete Location Page</u></em></h3>
  	
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
		
   </div>

</body>
</html>