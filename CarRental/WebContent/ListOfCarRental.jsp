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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>List Of Car Rental</title>


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

<ul>
<li><p><b>Location:</b>
   <%= request.getParameter("location")%>
</p></li>
<li><p><b>Pick Up Date:</b>
   <%= request.getParameter("pickupdate")%>
</p></li>
<li><p><b>Pick Up Date:</b>
   <%= request.getParameter("dropoffdate")%>
</p></li>
</ul>

	<%
		CarTypeDao carTypeDao = new CarTypeDao();
		List<CarType> lstCarType = carTypeDao.getAllCarTypes();
		RentalDao rentalDao = new RentalDao();
		List<Rental> lstrental = new ArrayList<Rental>();
		// get rental info based on location
 		lstrental = (List<Rental>) rentalDao.getRentalInfoByLocation("SJC");
 
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
		<tr>
			<div>
			<td><ul><%=carTypeObj.getCarTypeName()%></ul>
				<ul>
					<img id="test" src="images/<%=carTypeObj.getCarTypeName()%>.png">
				</ul></td>

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
						<%
								}
							%>
					</select>
				</ul></td>
			<td><ul><%=carTypeObj.getSeatingInfo()%></ul>
				<ul>
					<button id="continue" class="btn btn-success" name="action" onclick=""	value="continue">Continue</button>
				</ul></td>
			</div>
		</tr>



		<%}%>
	</table>
</body>
</html>