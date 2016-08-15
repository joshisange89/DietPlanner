<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<title>Diet Planner</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Amarante'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
	<img src="login.jpg" id="login_img">
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
				<div class="section_left">
					<form role="form" action="HomeServlet" method="post">
				    <input type="hidden" id="calculateAction" name="calculateAction" value="bmi" />
						<button class="button button:active" id="viewBmi"
							onclick="viewBMI()">View My BMI</button>
						<%if (request.getAttribute("bmi") != null) {%>
					    <p name="bmi" align="center"><font size="4" color="#00007f"><%=request.getAttribute("bmi")%></font></p>
					    <%}%>
						<br />
						<br />
					</form>
					<form role="form" action="HomeServlet" method="post">
					<input type="hidden" id="calculateAction" name="calculateAction" value="ibw" />
					<button class="button button:active" id="viewIw"
						onclick="viewIW()">View Ideal Weight</button>
					<%if (request.getAttribute("ibw") != null) {%>
					<p name="ibw" align="center"><font size="4" color="#00007f"><%=request.getAttribute("ibw")%></p>
					<%}%>
					<br />
					<br />
					</form>
					<form role="from" action="HomeServlet" method="post">
					<input type="hidden" id="calculateAction" name="calculateAction" value="exercise" />
					<button class="button button:active" id="viewExer"
						onclick="viewExer()">View Exercise</button>
					<br />
					<br />
					</form>
					<form role="from" action="HomeServlet" method="post">
					<input type="hidden" id="calculateAction" name="calculateAction" value="dietplan" />
					<button class="button button:active" id="viewDietPlan"
						onclick="viewDietPlan()">View Diet Plan</button>
					</form>
				</div>
				<div class="section_right">
					   <p class="large_font"><u>My profile</u></p>
					   <div class="small_font" style='float:left; width:50%; margin-left:20px'>
					   <p>First-Name   : ${userProfile.getFirstname()}</p>
					   <p>Last-Name    : ${userProfile.getLastname()}</p>
					   <p>Age          : ${userProfile.getAge()}</p>
					   <p>Height       : ${userProfile.getHeight()}</p>
					   <p>Weight       : ${userProfile.getWeight()}</p>
					   </div>
					   <div class="small_font" style='float:left; width:40%; margin-left:30px'>
					   <p>Gender       : ${userProfile.getGender()}</p>
					   <p>Body-shape   : ${userProfile.getBodyshape()}</p>
					   <p>Food         : ${userProfile.getFood()}</p>
					   <p>Goal         : ${userProfile.getGoal()}</p>
					   <p>Time-frame   : ${userProfile.getTimeFrame()}</p>
					   </div>
		</div>
	</div>
</body>
</html>