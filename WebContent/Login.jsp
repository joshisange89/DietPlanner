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
<body>
<nav class="navbar navbar-default container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="logo1.png" width="50%"></a>
    </div>
</nav>

<img src="login.jpg" id="login_img">

<div class="container">
	<% if ( request.getAttribute("error") != null ) { %>		
		<p id="error" name="error"><%= request.getAttribute("error") %></p>
	<% } %>
	<div class="row">
		<div class="contaier col-md-6 signin">
		<form role="form" action="LoginServlet" method="post">
			<input type="text" class="form-control" id="username" name="username" placeholder="Email Id" required /><br/>
			<input type="password" class="form-control" id="password" name="password" placeholder="Password" required /><br/>
			<button class="btn btn-primary btn-block" id="bsignin" onclick="onSignIn()">Sign In</button>
		</form>
		</div>

		<div class="contaier col-md-6 signup">
		<form role="form" action="RegisterUserServlet" method="post">
			<input type="text" class="form-control" id="username" name="username" placeholder="Email Id" required /><br/>
			<input type="password" class="form-control" id="newPass" name="password" placeholder="New Password" required /><br/>
			<input type="password" class="form-control" id="ConPass" placeholder="Confirm Password" required /><br/>
			<button class="btn btn-primary btn-block" id="bsignup" onclick="onSignUp()">Sign Up</button>
		</form>
		</div>
	</div>
</div>

</body>
</html>