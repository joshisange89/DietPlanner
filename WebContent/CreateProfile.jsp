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

<body id="create_profile">

<nav class="navbar navbar-default container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="logo1.png" width="50%"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#">Home</a></li>
      <li><a href="#">Edit Profile</a></li>
      <li><a href="#">Extra Pounds</a></li>
	  <li><a href="#">Log Out</a></li>
    </ul>
</nav>

<div class="container"> 
	<div class="row">
		<div class="container col-md-2">
		</div>
		
		<div class="container col-md-8 main">
			<form class="form-horizontal" role="form" action="SaveProfileServlet" method="post">

				<div class="form-group">
					<label for="firstname" class="control-label col-md-3" >First Name: </label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name">
					</div>
				</div>

				<div class="form-group">
					<label for="lastname" class="control-label col-md-3" >Last Name: </label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="lastname" name="lastname" placeholder="Height">
					</div>
				</div>
			
				<div class="form-group">
					<label for="height" class="control-label col-md-3" >Height: </label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="height" name="height" placeholder="Height">
					</div>
				</div>
				
				<div class="form-group">	
					<label for="weight" class="control-label col-md-3" >Weight: </label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="weight" name="weight" placeholder="Weight" >
					</div>
				</div>
				
				<div class="form-group">
					<label for="age" class="control-label col-md-3" >Age:</label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="age" name="age" placeholder="age" >
					</div>
				</div>
				
				<div class="form-group">
					<label for="gender" class="control-label col-md-3" >Gender: </label>
					<div class="col-md-9">
						<label class="radio-inline">
							<input type="radio" id="gender" name="gender" checked>Male
						</label>
						<label class="radio-inline">
							<input type="radio" id="gender" name="gender" >Female
						</label>
					</div>
					
				</div>
				
				<div class="form-group">
					<label for="body" class="control-label col-md-3" >Body Shape: </label>
					<div class="col-md-9">
						<div class="row">
							<div class="col-md-8">
								<select size="6" class="form-control" id="body" name="body" required>
									<option value="inverted">Inverted Triangle</option>
									<option value="rhomboid">Rhomboid</option>
									<option value="rectangle">Rectangle</option>
									<option value="triangle">Triangle</option>
									<option value="oval">Oval</option>
								</select>
							</div>
							<!--
							<div class="col-md-8">
								<img src="http://peterandsharda.com/wp-includes/Text/women-body-shapes-pictures-i4.jpg" height="400px" width="600px">
							</div> -->
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="body" class="control-label col-md-3" >Body Shape: </label>
					<div class="col-md-9">
						<div class="row">
							<div class="col-md-8">
								<select size="6" class="form-control" body="name" required>
									<option value="hourglass">Hourglass</option>
									<option value="inverted">Inverted Triangle</option>
									<option value="rectangle">Rectangle</option>
									<option value="triangle">Triangle</option>
									<option value="apple">Diamond</option>
									<option value="oval">Oval</option> 
								</select>
							</div>
							<!--
							<div class="col-md-8">
								<img src="http://4.bp.blogspot.com/-lHMZU3z5tC8/UOdZskm1cEI/AAAAAAAACzE/vURLoLmHLhM/s1600/body+types-men.jpg" height="400px" width="600px">
							</div> -->
						</div>
					</div>
				</div>
			
				<div class="form-group">
					<label for="food" class="control-label col-md-3" >Food: </label>
					<div class="col-md-9">
						<label class="radio-inline">
							<input type="radio" id="food" name="food" value="veg" checked>Vegetarian
						</label>
						<label class="radio-inline">
							<input type="radio" id="food" name="food" value="nonveg" >Non-Vegetarian
						</label>
					</div>
				</div>
				
				<div class="form-group">
					<label for="goal" class="control-label col-md-3" >Goal:</label>
					<div class="col-md-9">
						<label class="radio-inline">
							<input type="radio" id="goal" name="goal" value="weightGain" checked>Gain Weight
						</label>
						<label class="radio-inline">
							<input type="radio" id="goal" name="goal" value="weightLose">Lose Weight
						</label>
					</div>
				</div>

				<div class="form-group">
					<label for="timeframe" class="control-label col-md-3" >Time Frame:</label>
					<div class="col-md-9">
						<select>
							<option value="select" id="timeframe" selected>Select</option>
							<option value="month">1 Month</option>
							<option value="month2">2 Month</option>
						</select>
					</div>
				</div>
				
				<button class="btn btn-primary btn-block" id="bsave" ng-click="saveProfile()">Save Profile</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>