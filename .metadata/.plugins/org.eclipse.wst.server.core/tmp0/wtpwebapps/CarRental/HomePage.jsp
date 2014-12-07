<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
$(function() {
	$("#pickupdate").datepicker({ 
		minDate: 0, 
		dateFormat: "mm/dd/yy" }).val()
    $("#dropoffdate").datepicker({ 
    	maxDate: "+1M",
    	dateFormat: "mm/dd/yy" }).val()
});
</script>
<title>HomePage - Best Car Rentals</title>
</head>


<body>
<div class="container">
<h1 class="text-center"><u>BEST CAR RENTALS</u></h1>
  	<h3><em><u>Home Page</u></em></h3>
		<form role="HomePage-form">
        <p>Choose the location and dates</p>
        <div class="form-group col-lg-4">
        <label for="Location">Location</label>
          <input type="text" class="form-control" id="location" placeholder="Enter zipcode">
        </div>
        <div class="form-group col-lg-2">
        <label for="Pickupdate">Pick Up Date</label>
          <input type="text" class="form-control" id="pickupdate">
        </div>
        <div class="form-group col-lg-2">
        <label for="Dropoffdate">Drop Off Date</label>
          <input type="text" class="form-control" id="dropoffdate">
        </div>
        <div class="form-group">
        <br>
        <p>
        <input type="submit" class="btn btn-primary" value="Search">
        </div>
   </form>
   </div>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>