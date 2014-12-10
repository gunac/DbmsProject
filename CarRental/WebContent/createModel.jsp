<%@ page import="ApplicationDao.CarModelDao"%>
<%@ page import="ApplicationDao.CarTypeDao"%>
<%@ page import="java.util.List"%>
<%@ page import="model.CarType"%>
<%@ page import="model.CarModel"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>Add Cars</title>

<script src="js/jquery.js"></script>
</head>
<body>
<div style="margin-left: 5%;margin-right: 5%; margin-top:2%; margin-bottom: 2%" class="Container">
	<script>
		$(function() {
			
			
			
			$("#addModel").click(insertHandler);
			$("#displayCarModel").click(displayHandler);
			$("#selectModel").click(selectHandler);
			$("#deleteModel").click(deleteHandler);
			$("#updateModel").click(updateHandler);
			
			
			alert("hello bum!");
		});
		
		function insertHandler(){
			var newmodel = {
					
					"count" : $("#modelCount").val(),
					"carTypeCode" : $("#carTypeCode").val(),
					"modelName" : $("#modelName").val(),
					"modelId" : $("#id").val()
				};
			
			insertNewModel(newmodel);
		}

		function insertNewModel(model) {
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
		
		function updateHandler(){
			var newmodel = {
					
					"count" : $("#modelCount").val(),
					"carTypeCode" : $("#carTypeCode").val(),
					"modelName" : $("#modelName").val(),
					"modelId" : $("#id").val()
				};
			
			updateModel($("#id").val(),newmodel);
		}

		
		function updateModel(id , model) {
			$.ajax({
				url : "http://localhost:8080/CarRental/api/CarModel/" + id,
				type : "post",
				data : JSON.stringify(model),
				dataType : "json",
				contentType : "application/json",
				success : function(response) {
					console.log(response);
				}

			})

		}
		
		
	</script>
	<%
		//---------------------Controller 
		CarModelDao carModelDao = new CarModelDao();
		String modelName = request.getParameter("modelName");
		//---------Get values to insert data
		String modelCount = request.getParameter("modelCount");
		String carType = request.getParameter("carType");
		String action = request.getParameter("action");
		String idStr = request.getParameter("id");

		System.out.println(modelCount);
		System.out.println(carType);
		System.out.println(action);
		System.out.println(idStr);
		CarModel carmodel = new CarModel();
		// CREATE A MODEL
		if ("create".equals(action) && !carType.equals("0")) {
			int count = Integer.parseInt(modelCount);
			carmodel = new CarModel(carType, modelName, count);
			carModelDao.insertCarModel(carmodel);
		}
		// DELETE A MODEL
		if ("delete".equals(action) && !idStr.equals("0")
				&& !idStr.equals("null")) {
			int id = Integer.parseInt(idStr);
			carModelDao.removeCarModel(id);
		}
		// SELECT A MODEL
		if ("select".equals(action) && !idStr.equals("0")
				&& !idStr.equals("null")) {
			int id = Integer.parseInt(idStr);
			carmodel = carModelDao.getModelById(id);
			request.setAttribute("carType", carmodel.getCarTypeCode());

		}
		// Update A Model
		if ("update".equals(action) && !idStr.equals("0")
				&& !idStr.equals("null") && !carType.equals("0")) {
			int id = Integer.parseInt(idStr);
			int count = Integer.parseInt(modelCount);
			carmodel = new CarModel(carType, modelName, count);
			carModelDao.updateCarModel(id, carmodel);
			request.setAttribute("carType", carmodel.getCarTypeCode());

		}

		List<CarModel> lstCarModels = carModelDao.getAllCarModel();
	%>
	<form action="createModel.jsp">
	<div class="table-responsive">
		<table class="table table-hover">
			<!--  CAR TYPE DROP DOWN -->
			<tr>
				<td><label> Select a Car Type </label></td>
				<td><select name="carType">
						<option value="0" selected>- select -</option>
						<%
							CarTypeDao carTypeDao = new CarTypeDao();
							List<CarType> lstCarType = carTypeDao.getAllCarTypes();
							for (CarType c : lstCarType) {
						%>
						<option value="<%=c.getCarTypeCode()%>"><%=c.getCarTypeName()%></option>
						<%
							}
						%>
				</select></td>
				<td><label id="error" style="visibility: hidden;">Please
						select Car Type</label></td>
			</tr>
			<!-- CAR MODELNAME, ID AND COUNT FIELDS -->
			<input type="hidden" id="id" name="id" value="<%=carmodel.getModelId()%>">
			<input type="hidden" id="carTypeCode" name="carTypeCode" value="<%=carmodel.getCarTypeCode()%>">
			<tr>
				<td><input type="text" class="form-control" id="modelName" name="modelName"
					value="<%=carmodel.getModelName()%>" placeholder="Enter Car Model"></td>
				<td><input type="text" class="form-control" id="modelCount" name="modelCount"
					value="<%=carmodel.getCount()%>" placeholder="Enter Car Count"></td>
				<td><button id="addModel" class="btn btn-success" name="action"
						value="create">Add</button>
					<button class="btn btn-primary" id="updateModel" name="action" value="update">Update</button></td>
			</tr>

			<%
				for (CarModel c : lstCarModels) {
			%>
			<tr>
				<td><%=c.getModelName()%></td>
				<td><%=c.getCount()%></td>
				<td><a class="btn btn-danger"
					href="createModel.jsp?action=delete&id=<%=c.getModelId()%>">Delete</a>
					<a class="btn btn-warning"
					href="createModel.jsp?action=select&id=<%=c.getModelId()%>">Select</a></td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
	</form>
	</div>
</body>
</html>