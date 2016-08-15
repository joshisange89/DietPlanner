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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	   
	<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<nav class="navbar navbar-default container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="logo1.png" width="50%"></a>
    </div>
</nav>

<h1> Hi, <%= session.getAttribute("userId")%> </h1>


<div class="container">
	<div class="row">
		<div class="col-md-7">
			<div class="badges">
				<p>Earned Badges: </p>
				<img src="http://www.freeiconspng.com/uploads/badge-icon-png-22.png" width="100">
				<img src="http://www.tmports.com/files/imgs/winners_badge.png" width="100">
				<img src="http://www.inf.ufrgs.br/~vcazevedo/images/winner_medal.png" width="150">
			</div>
			<div class="track_week">
				<p id="error"></p>
				<form name="track" action="DietTrackServlet" method="post">
					<input type="hidden" name="dayOfWeek">
					<input type="hidden" name="day">
				</form>
				<div class="prev">
					<img id="arrows" src="prev.png" width="30" onclick="displayPrevWeek()">
				</div>				
				<div class="week">
						<button id="checkmark1" onclick="markDone(this)"></button>
						<p id="dayOfWeek1"></p>
						<p id="day1"></p>		
				</div>
				<div class="week">
						<button id="checkmark2" onclick="markDone(this)"></button>
						<p id="dayOfWeek2"></p>
						<p id="day2"></p>
				</div>
				<div class="week">
					
						<button id="checkmark3" onclick="markDone(this)"></button>
						<p id="dayOfWeek3"></p>
						<p id="day3"></p>
					
				</div>
				<div class="week">
					
						<button id="checkmark4" onclick="markDone(this)"></button>
						<p id="dayOfWeek4"></p>
						<p id="day4"></p>
					
					</div>
				<div class="week">
						<button id="checkmark5" onclick="markDone(this)"></button>
						<p id="dayOfWeek5"></p>
						<p id="day5"></p>
					
				</div>			
				<div class="week">
						<button id="checkmark6" onclick="markDone(this)"></button>
						<p id="dayOfWeek6"></p>
						<p id="day6"></p>
					
				</div>
				<div class="week">
						<button id="checkmark7" onclick="markDone(this)"></button>
						<p id="dayOfWeek7"></p>
						<p id="day7"></p>
					
				</div>
				
				<div class="next">
					<img id="arrows" src="next.png" width="30" onclick="displayNextWeek()">
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div id="chart_div"></div>
		</div>		
	</div>
</div>


<script>

var days = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Saturday" ];
var months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var today = new Date();
displayWeek(today);

function displayWeek(today) {
	var prev_date = today;
	var next_date = today;

	var dow = today.getDay();
	var prev = dow;
	var next = dow;
	var i = 1;

	while ( prev > -1 ) {
		document.getElementById(("dayOfWeek").concat(prev+1)).innerHTML = days[prev];
		
		document.getElementById(("day").concat(prev+1)).innerHTML = 
		months[prev_date.getMonth()]+" "+prev_date.getDate()+", "+prev_date.getFullYear();

		prev = prev - 1;
		prev_date = new Date(today.getTime() - 86400000 * i);
		i++;
	}
	
	i = 1;
	while ( next < 7 ) {
		document.getElementById(("dayOfWeek").concat(next+1)).innerHTML = days[next];
		document.getElementById(("day").concat(next+1)).innerHTML = 
		months[next_date.getMonth()]+" "+next_date.getDate()+", "+next_date.getFullYear();

		next = Number(next + 1);
		next_date = new Date(today.getTime() + 86400000 * i);
		i++;
	}
}

function markDone(ele) {
	var selectedDate = document.getElementById("day"+ele.id.match(/\d/g)[0]).innerHTML;
	var selectedDateObj = new Date(Date.parse(document.getElementById("day"+ele.id.match(/\d/g)[0]).innerHTML));
	
	if ( selectedDateObj <= today ) {
		document.getElementById(ele.id).style.background = "url(\"check-mark.png\") no-repeat";
		document.getElementById(ele.id).style.backgroundSize = "cover";
		document.track.dayOfWeek.value = document.getElementById("dayOfWeek"+ele.id.match(/\d/g)[0]).innerHTML;
		document.track.day.value = selectedDate;
		document.track.submit();
	} else {
		document.getElementById("error").innerHTML = "Hey, how can you eat future day's diet today"
	}
}

function displayNextWeek() {
	var lastDay = new Date (document.getElementById("day7").innerHTML);
	displayWeek(new Date(lastDay.getTime() + 86400000));
}

function displayPrevWeek() {
	var firstDay = new Date (document.getElementById("day1").innerHTML);
	displayWeek(new Date(firstDay.getTime() - 86400000));
}

google.charts.load('current', {'packages':['gauge']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

	var data = google.visualization.arrayToDataTable([
	  ['Label', 'Value'],
	  ['Progress', 80],
	]);

	var options = {
		width: 300, height: 300,
		redFrom: 25, redTo: 50,
		yellowFrom: 50, yellowTo: 75,
		greenFrom: 75, greenTo: 100,
		minorTicks: 5
	};

	var chart = new google.visualization.Gauge(document.getElementById('chart_div'));
	chart.draw(data, options);

	setInterval(function() {
		  data.setValue(0, 1, 60);
		  chart.draw(data, options);
	}, 13000);
}
	  
</script>

</body>
</html>