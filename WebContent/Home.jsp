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
<nav class="navbar navbar-default container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="logo1.png" width="50%"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="home.html">Home</a></li>
      <li><a href="create_profile.html">Edit Profile</a></li>
      <li><a href="#">Extra Pounds</a></li>
	  <li><a href="#">Log Out</a></li>
    </ul>
</nav>

<div class="container"> 
	<div class="row">
		<div class="contaier col-md-4">
			<div class="leftside">
			<button class="btn btn-primary btn-md" id="viewBmi" onclick="viewBMI()">View My BMI</button><br/><br/>
			<button class="btn btn-primary btn-md" id="viewIw" onclick="viewIW()">View Ideal Weight for Me</button><br/><br/>
			<button class="btn btn-primary btn-md" id="viewExer" onclick="viewExer()">View Exercise</button><br/><br/>
			</div>
		</div>
		<div class="contaier col-md-8">
			<div class="main">
			<h2>Your Diet Plan</h2>
			<h3>Breakfast:</h3>
			<h3>Lunch:</h3>
			<h3>Snacks:</h3>
			<h3>Dinner:</h3>
			</div>
		</div>
	</div>
</div>
</body>
</html>