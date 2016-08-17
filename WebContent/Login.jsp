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
</nav>

<img src="login.jpg" id="login_img">

<div class="container">
	<% if ( request.getAttribute("error") != null ) { %>		
		<p id="error" name="error"> <%= request.getAttribute("error") %></p>
	<% } %>
	
	<p id="error"></p>
	<br/><br/><br/>
	<div class="row">
		<div class="contaier col-md-6 signin">
			<form role="form" name="login" action="LoginServlet" method="post">
				<input type="email" class="form-control" id="username" name="username" placeholder="Email Id" required /><br/>
				<input type="password" class="form-control" id="password" name="password" placeholder="Password" required /><br/>				
			</form>
			<button class="btn btn-primary btn-block" id="bsignin" onclick="onSignIn()">Sign In</button>
		</div>

		<div class="contaier col-md-6 signup">
			<form role="form" name="register" action="RegisterUserServlet" method="post">
				<input type="email" class="form-control" id="username" name="username" placeholder="Email Id" required /><br/>
				<input type="password" class="form-control" id="newPass" name="password" placeholder="New Password" required /><br/>
				<input type="password" class="form-control" id="conPass" placeholder="Confirm Password" required /><br/>			
			</form>
			<button class="btn btn-primary btn-block" id="bsignup" onclick="onSignUp()">Sign Up</button>
		</div>
	</div>
</div>
<script>
function onSignIn() {
	var password = document.getElementById("password").value;
	var re1 = /[0-9]/;
	var re2 = /[a-z]/;
	var re3 = /[A-Z]/;
	
	if ( !re1.test(password) || !re1.test(password) || !re1.test(password) ) {
		document.getElementById("error").innerHTML = "Password should contain minimum 8 characters"
			+"should have aleast 1 number, 1 lower case letter and 1 upper case letter";
	} else {
		document.login.submit();
	}
	
}

function onSignUp() {
	if ( document.getElementById("newPass").value == document.getElementById("conPass").value ) {		
		document.register.submit();
	} else {
		document.getElementById("error").innerHTML = "Password is not matching";
	}
}

</script>
</body>
</html>