<%@page import="com.dietplanner.valueobjects.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<title>Diet Planner</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href='https://fonts.googleapis.com/css?family=Amarante' rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<%
	session.setAttribute("userId", session.getAttribute("userId"));

	ProfileVO userProfile = new ProfileVO();
	userProfile = (ProfileVO) session.getAttribute("userProfile");
	
	session.setAttribute("startDate", userProfile.getStartDate());
	session.setAttribute("endDate", userProfile.getEndDate());
	session.setAttribute("timeFrame", userProfile.getTimeFrame());
	
	DietVO dietPlan = new DietVO();
	dietPlan = (DietVO) session.getAttribute("dietPlan");
%>

<nav class="navbar navbar-default container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="logo1.png" width="50%"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="HomeServlet">Home</a></li>
      <li><a href="SaveProfileServlet">Edit Profile</a></li>
      <li><a href="addons.html">Extra Pounds</a></li>
	  <li><a href="LogOutServlet">Log Out</a></li>
    </ul>
</nav>

<div class="container"> 
	<div class="row">
		<div class="contaier col-md-4">
			<div class="leftside">
				<input type="hidden" id="calculateAction" name="calculateAction" value="bmi" />
				<button class="btn btn-primary" id="viewBmi" onclick="viewBMI()">View My BMI</button>
				<p id="bmi" name="bmi" ></p>
				<p id="bminote" name="bminote" ></p>			
					
				<input type="hidden" id="calculateAction" name="calculateAction" value="ibw" />
				<button class="btn btn-primary" id="viewIw" onclick="viewIW()">View Ideal Weight</button>
				<p id="ibw" name="ibw"></p>				
			
				<input type="hidden" id="calculateAction" name="calculateAction" value="exercise" />
				<button class="btn btn-primary" id="viewExer" onclick="viewExer()">View Exercise</button>
				<img id="img1">
				<img id="img2">
				<img id="img3">			
			</div>
		</div>
		<div class="contaier col-md-8">
			<div class="main">	
				<h3>Breakfast</h3>		
					<p>${dietPlan.getBreakfast()}</p>
				<h3>Lunch</h3>
					<p>${dietPlan.getLunch()}</p>
				<h3>Snack</h3>
					<p>${dietPlan.getSnack()}</p>
				<h3>Dinner</h3>
					<p>${dietPlan.getDinner()}</p>
				<h4 align="right"><a href="DietTrackServlet">Track Your Diet</a></h4>
			</div>
		</div>
	</div>
</div>

<script>

var gender = "'${userProfile.getGender()}'";
console.log(gender);
var height = ${userProfile.getHeight()};
console.log(height);
var weight = ${userProfile.getWeight()};
console.log(weight);

function viewBMI() {
	var bmi = document.getElementById("bmi");
	var bmi_val = (weight*0.45) / Math.pow(height*0.025, 2);
	bmi.innerHTML = "Your BMI is: " + bmi_val.toFixed(1);
	document.getElementById("bminote").innerHTML = "A healthy BMI ranges between 19 and 25";
}

function viewIW(){
	var ibw = document.getElementById("ibw");
	var ibw_value;
	if (gender == "male") {
		ibw_value = Number(110) + (5 * (height - 60)); 		
	} else {
		ibw_value = Number(100) + (5 * (height - 60)); 
	}
	ibw.innerHTML = "Your ideal weight is: " + ibw_value + " lbs"
}

function viewExer(){
	var body = "'${userProfile.getBodyshape()}'";
	console.log(body);
	var img1 = document.getElementById("img1");
	var img2 = document.getElementById("img2");
	var img3 = document.getElementById("img3");
	
	if (body.localeCompare("pear")){
		img1.src="pear_1.png";
		img2.src="pear_2.png";
		img3.src="pear_3.png";	
	}
	else if (body.localeCompare("apple")){
		img1.src="apple_1.png";
		img2.src="apple_2.png";
		img3.src="apple_3.png";	
	}
	else if (body.localeCompare("hourglass")){
		img1.src="hg_1.png";
		img2.src="hg_2.png";
		img3.src="hg_3.png";	
	}
	else if ( body.localeCompare("straight")){
		console.log("I am here");
		img1.src="straight_1.png";
		img2.src="straight_2.png";
		img3.src="straight_3.png";
	}
}

</script>

<footer>
 	<small>&copy; Copyright by <a href="#">Diet Planner</a> | Design by Vague Team</a></small>
</footer>

</body>
</html>