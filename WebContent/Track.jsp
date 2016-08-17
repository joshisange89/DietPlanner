<%@page import="com.dietplanner.valueobjects.*,java.util.*"%>

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
    <ul class="nav navbar-nav navbar-right">
      <li><a href="HomeServlet">Home</a></li>
      <li><a href="SaveProfileServlet">Edit Profile</a></li>
      <li><a href="addons.html">Extra Pounds</a></li>
	  <li><a href="LogOutServlet">Log Out</a></li>
    </ul>
</nav>

<div class="container">
	<div class="row">
		<div class="col-md-7">
			<div class="badges">
				<p id="ebadge_note1"></p>
				<p id="ebadge_note2"></p>
				<p id="ebadge_note3"></p>
				<img id="badge1_img width="100">
				<img id="badge2_img width="100">
				<img id="badge3_img width="150">
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
		<div class="col-md-3 chart">
			<div id="chart_div"></div>
			<p>Forget 70% diet, 30% training <br/> It's 100% diet, 100% passion <br/>Nothing great was achieved with partial efforts</p>
		</div>	
	</div>
</div>

<%
	ProfileVO userProfile = new ProfileVO();
	userProfile = (ProfileVO) session.getAttribute("userProfile");
	
	ArrayList<DietTrackVO> dietTracks = new ArrayList<DietTrackVO>();
	dietTracks = (ArrayList<DietTrackVO>) session.getAttribute("dietTracks");
	 
%>

<script>
// Display Week Dates
var days = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Saturday" ];
var months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

var today = new Date();

var start = "'${ userProfile.getStartDate() }'";
var start_date = new Date(start);

var end = "'${ userProfile.getEndDate() } '";
var end_date = new Date(end);

var date_compare;

displayWeek(start_date);

function displayWeek(start_date) {
	var prev_date = start_date;
	var next_date = start_date;

	var dow = start_date.getDay();
	var prev = dow;
	var next = dow;
	var i = 1;

	while ( prev > -1 ) {
		document.getElementById(("dayOfWeek").concat(prev+1)).innerHTML = days[prev];
		
		document.getElementById(("day").concat(prev+1)).innerHTML = 
		months[prev_date.getMonth()]+" "+prev_date.getDate()+", "+prev_date.getFullYear();
		
		prev = prev - 1;
		prev_date = new Date(start_date.getTime() - 86400000 * i);
		i++;
		<% 	Iterator<DietTrackVO> dietTrackItr = dietTracks.iterator();
			while ( dietTrackItr.hasNext() ) { %>
				console.log("'${ dietTrackItr.next().getEachDate() } '");
				date_compare = new Date("'${ dietTrackItr.next().getEachDate() } '");
				console.log("date to compare: " + date_compare);
				if ( prev_date == date_compare ) {
					console.log("Matched: " + date_compare);
					document.getElementById(("checkmark").concat(prev+1)).style.background = "url(\"check-mark.png\") no-repeat";
				}
		<% 	} %>
	}
	
	i = 1;
	while ( next < 7 ) {
		document.getElementById(("dayOfWeek").concat(next+1)).innerHTML = days[next];
		document.getElementById(("day").concat(next+1)).innerHTML = 
		months[next_date.getMonth()]+" "+next_date.getDate()+", "+next_date.getFullYear();

		next = Number(next + 1);
		next_date = new Date(start_date.getTime() + 86400000 * i);
		i++;
				
		<% 	dietTrackItr = dietTracks.iterator();
		while ( dietTrackItr.hasNext() ) { %>
			console.log("'${ dietTrackItr.next().getEachDate() } '");
			date_compare = new Date("'${ dietTrackItr.next().getEachDate() } '");
			console.log("date to compare: " + date_compare);
			if ( next_date == date_compare ) {
				console.log("Matched: " + date_compare);
				document.getElementById(("checkmark").concat(next+1)).style.background = "url(\"check-mark.png\") no-repeat";
			}
	<% 	} %>

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

// Display Mark Done
function markDone(ele) {
	var selectedDate = document.getElementById("day"+ele.id.match(/\d/g)[0]).innerHTML;
	var selectedDateObj = new Date(Date.parse(document.getElementById("day"+ele.id.match(/\d/g)[0]).innerHTML));
	
	if ( selectedDateObj >= start_date && selectedDateObj <= today ) {
		document.getElementById(ele.id).style.background = "url(\"check-mark.png\") no-repeat";
		document.getElementById(ele.id).style.backgroundSize = "cover";
		document.track.dayOfWeek.value = document.getElementById("dayOfWeek"+ele.id.match(/\d/g)[0]).innerHTML;
		document.track.day.value = selectedDate;
		document.track.submit();
	} else if ( selectedDateObj > today ) {
		document.getElementById("error").innerHTML = "Hey, how can you eat future day's diet today";
	} else if ( selectedDateObj < end_date  ) {
		document.getElementById("error").innerHTML = "Your plan was not started on this date";
	} else if ( selectedDateObj > end_date  ) {
		document.getElementById("error").innerHTML = "Your plan has ended";
	}
}

//Display Badges
var track = 0;
if ( session != null && session.getAttribute("tracDays") != null ) { 
	track = session.getAttribute("tracDays");
}

var trackDays = track;
var timeFrame = "'${ userProfile.getTimeFrame() }'";
var progress = 0 ;

var badge1 = "http://www.freeiconspng.com/uploads/badge-icon-png-22.png";
var badge2 = "http://www.tmports.com/files/imgs/winners_badge.png"
var badge3 = "http://www.inf.ufrgs.br/~vcazevedo/images/winner_medal.png"

if ( timeFrame.localeCompare("1month") ) {
	if ( trackDays < 10 ) {
		document.getElementById("ebadge_note1").innerHTML = "Nothing Tastes As Good As BEING HEALTHY FEELS.. Common Earn Badges";
		document.getElementById("ebadge_note2").innerHTML = "You will earn badge on achieving each 1/3 of milestone";
	} else if ( trackDays >= 10 && trackDays < 21 ) {
		document.getElementById("badge1_img").src = badge1;
		document.getElementById("ebadge_note1").innerHTML = "Nothing Tastes As Good As BEING HEALTHY FEELS.. Common Earn Badges";
		document.getElementById("ebadge_note2").innerHTML = "Good Job, You have Earned a Badge";
	} else if ( trackDays >= 20 && trackDays < 30 ) {
		document.getElementById("badge2_img").src = badge2;
		document.getElementById("ebadge_note1").innerHTML = "Nothing Tastes As Good As BEING HEALTHY FEELS.. Common Earn Badges";
		document.getElementById("ebadge_note2").innerHTML = "Great Job, You have Earned another Badge";
	} else if ( trackDays >= 28 ) {
		document.getElementById("badge3_img").src = badge3;
		document.getElementById("ebadge_note2").innerHTML = "Super Job, Milestone Accomplished. Congratulations!!!";
	}
	progress = (trackDays / 30) * 100; 
}

if ( timeFrame.localeCompare("2month") ) {
	if ( trackDays < 20 ) {
		document.getElementById("ebadge_note1").innerHTML = "Nothing Tastes As Good As BEING HEALTHY FEELS.. Common Earn Badges";
		document.getElementById("ebadge_note2").innerHTML = "You will earn badge on achieving each 1/3 of milestone";		
	}
	else if ( trackDays >= 20 && trackDays < 41 ) {
		document.getElementById("badge1_img").src = badge1;
		document.getElementById("ebadge_note1").innerHTML = "Nothing Tastes As Good As BEING HEALTHY FEELS.. Common Earn Badges";
		document.getElementById("ebadge_note2").innerHTML = "Good Job, You have Earned a Badge";
	} else if ( trackDays >= 40 && trackDays < 60 ) {
		document.getElementById("badge2_img").src = badge2;
		document.getElementById("ebadge_note1").innerHTML = "Nothing Tastes As Good As BEING HEALTHY FEELS.. Common Earn Badges";
		document.getElementById("ebadge_note2").innerHTML = "Great Job, You have Earned another Badge";
	} else if ( trackDays >= 58 ) {
		document.getElementById("badge3_img").src = badge3;
		document.getElementById("ebadge_note2").innerHTML = "Super Job, Milestone Accomplished. Congratulations!!!";
	}
	progress = (trackDays / 60) * 100;
}

//Display Progress Chart
google.charts.load('current', {'packages':['gauge']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	
	var data = google.visualization.arrayToDataTable([
	  ['Label', 'Value'],
	  ['Progress', progress],
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
}
	  
</script>

<footer>
 	<small>&copy; Copyright by <a href="#">Diet Planner</a> | Design by Vague Team</a></small>
</footer>

</body>
</html>