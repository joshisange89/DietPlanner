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
%>
<nav class="navbar navbar-default container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="logo1.png" width="50%"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="home.html">Home</a></li>
      <li><a href="SaveProfileServlet">Edit Profile</a></li>
      <li><a href="#">Extra Pounds</a></li>
	  <li><a href="#">Log Out</a></li>
    </ul>
</nav>

<div class="container"> 
	<div class="row">
		<div class="contaier col-md-4">
			<div class="leftside">
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
			</div>
		</div>
		<div class="contaier col-md-8">
			<div class="main">
				<form role="from" action="HomeServlet" method="post">
					<input type="hidden" id="calculateAction" name="calculateAction" value="dietplan" />
					<button class="button button:active" id="viewDietPlan"
						onclick="viewDietPlan()">View Diet Plan</button>
				</form>

				<h4><a href="Track.jsp">Track Your Diet</a></h4>
			</div>
		</div>
	</div>
</div>
</body>
</html>