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
<title>Add New Model Page</title>
<script>

function updateHandler(){
	
	var currentDropdownVal = $("#carType").val();
	var modelName = $("#modelName").val();
	if(modelName=="")
	{
		alert("Please enter Model Name");
		return;
	}
	if(currentDropdownVal==0)
	{
		alert("Please choose the Car Type for the Model");
		return;
	}
	var newmodel = {
			
			"count" : $("#modelCount").val(),
			"carTypeCode" : $("#carType").val(),
			"modelName" : $("#modelName").val(),
			"modelId" : $("#selectedmodelId").val()
		};
	
	updateModel($("#selectedmodelId").val(),newmodel);
}


function updateModel(id , model) {
	$.ajax({
		url : "http://localhost:8080/CarRental/api/CarModel/" + id,
		type : "put",
		data : JSON.stringify(model),
		dataType : "json",
		contentType : "application/json",
		success : function(response) {
			console.log(response);
		}

	})

}

function SelectModelforId(id){
	
		$.ajax({
			url: "http://localhost:8080/CarRental/api/CarModel/" + id ,
			type:"get",
			dataType: "json",
			contentType: "application/json",
			success: function(response){
				modelselectResponseHandler(response)
			}
		})
}

function modelselectResponseHandler(response){
	
	var name = response.modelName
	var count = response.count;
	var type = response.carTypeCode;
	var id = response.modelId;
	 document.getElementById('modelName').value = name;
	document.getElementById('modelCount').value = count;
	document.getElementById('selectedmodelId').value = id;
	
	//Get selectedobject
	var objSelect = document.getElementById("carType");

	//Set selected
	setSelectedValue(objSelect, type);
}

function setSelectedValue(selectObj, valueToSet) {
    for (var i = 0; i < selectObj.options.length; i++) {
        if (selectObj.options[i].value == valueToSet) {
            selectObj.options[i].selected = true;
        } else {selectObj.options[i].selected = false};
    }
}

function deleteModelwithId(id){
	
	deleteModel(id);
}

function deleteModel(Id){
	$.ajax({
		url : "http://localhost:8080/CarRental/api/CarModel/" + Id,
		type : "delete",
			success: function(html){
                location.reload();
            }
	})
}

function createNewModelJSONObj(){
	var currentDropdownVal = $("#carType").val();
	var modelName = $("#modelName").val();
	if(modelName=="")
	{
		alert("Please enter Model Name");
		return;
	}
	if(currentDropdownVal==0)
	{
		alert("Please choose the Car Type for the Model");
		return;
	}
	
	var newmodel = {
			
			"count" : $("#modelCount").val(),
			"carTypeCode" :currentDropdownVal,
			"modelName" : modelName,
			"modelId" : 2
		};
	
	insertNewModel(newmodel);
}

function insertNewModel(model){
	$.ajax({
		url : "http://localhost:8080/CarRental/api/CarModel",
		type : "post",
		data : JSON.stringify(model),
		dataType : "json",
		contentType : "application/json",
		success : function(response) {
			console.log(response);
		}
	})
}

function buildHTMLTable(){
	
	$(function() {
		
		$.ajax({
			url: "http://localhost:8080/CarRental/api/CarModel",
			type:"get",
			dataType: "json",
			contentType: "application/json",
			success: function(response){
				modelResponseHandler(response);
			}
		})
	});

	function modelResponseHandler(response){		
	    var tr = '';
	     $.each(response, function (i, item) {
	         tr += '<tr><td>'+ item.modelName +'</td><td>'+ item.count +'</td><td> <button id="delete" class="btn btn-danger" onClick=deleteModelwithId('+ item.modelId +')> Delete </button></td> <td> <button id="update" class="btn btn-success" onClick=SelectModelforId('+ item.modelId +')> Select </button></td></tr>';
	     });
	     $('#recordtable').append(tr);
	}


$(function() {
	
	$.ajax({
		url: "http://localhost:8080/CarRental/api/CarType",
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
	 option.attr('value', this.CarTypeCode).text(this.CarTypeName); 
	 $('#carType').append(option); 
    })
}
}

</script>
</head>
<body onLoad="buildHTMLTable()">

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


<div class="container">
<h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
  	<h3><em><u>Add New Model Page</u></em></h3>
		<form role="AddNewModelform">
		 <div class="form-group">
          <label for="name">Model Name:</label>
          <input type="text" class="form-control" id="modelName" placeholder="Enter Model Name">
        </div>
         <div class="form-group">
          <label for="name">Model Count:</label>
          <input type="text" class="form-control" id="modelCount" placeholder="Enter Model Count">
        </div>
        <div class="form-group">
          <label for="name">Choose the Car Type of the Model</label>
		 	<select id="carType">
			<option value="0" selected>- select -</option>
			</select>
			</div>
			 <button id="addmodel" class="btn btn-primary" onClick="createNewModelJSONObj()">Add Model</button>&nbsp;
			 <input type="hidden" id = "selectedmodelId">
			 <button id="updatemodel" class="btn btn-warning" onClick="updateHandler()">Update Model</button>
	</form>
	<p>
	<br>
	<table id="recordtable" class="table">
	<tr><b> Models Available</b></tr>
	<tr><td><b>Model Name</b></td>
	<td><td><b>Model Count</b></td>
	<td></td><td></td>
	</table>
	
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