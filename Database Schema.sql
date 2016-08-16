create schema dietplanner;
use dietplanner;

create table users (
	user_id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
	email_id varchar(100) NOT NULL UNIQUE,
	password varchar(100) NOT NULL UNIQUE
);

create table user_profile (
	user_id bigint NOT NULL PRIMARY KEY,
	firstname varchar(10) NOT NULL,
	lastname varchar(10) NOT NULL,
	height int NOT NULL,
	weight int NOT NULL,
	age int NOT NULL,
	gender varchar(6) NOT NULL,
	bodyshape varchar(20) NOT NULL,
	food varchar(20) NOT NULL,
	goal varchar(15) NOT NULL,
	time_frame varchar(10) NOT NULL,
	start_date datetime NOT NULL,
	end_date datetime NOT NULL,
	diet_id bigint NOT NULL
);

create table diet_plan (
	diet_id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
	breakfast varchar(100) NOT NULL,
	lunch varchar(100) NOT NULL,
	snack varchar(100) NOT NULL,
	dinner varchar(100) NOT NULL,
	food varchar(20) NOT NULL,
	goal varchar(20) NOT NULL,
	time_frame varchar(10) NOT NULL
);

create table diet_track (
	user_id bigint NOT NULL,
	week_day varchar(20) NOT NULL,
	daily_date datetime NOT NULL,
	flag boolean NOT NULL
);

insert into diet_plan (breakfast, lunch, snack, dinner, food, goal, time_frame) 
values ("2-3 eggs + 2 toast + 1 bowl of full milk with cereal Or a bowl oats/poridge",
		"1 serving of chicken/ fish or egg or non-veg Pasta with either olive oil)",
		"non veg sandwich can add cheese / mayo",
		"2 toast with Roast / grilled Chicken or Baked fish with potatoes",
		"nonveg",
		"weightGain",
		"1month");

insert into diet_plan (breakfast, lunch, snack, dinner, food, goal, time_frame)
values ("Omlette,Toasted bread",
		"Grilled chicken and Strawberries",
		"1 glass of Banana shake",
		"1 bowl Chicken soup or Baked fish with potatoes",
		"nonveg",
		"weightGain",
		"2month");

insert into diet_plan (breakfast, lunch, snack, dinner, food, goal, time_frame) 
values ("German Apple Pancake + Strawberries and Skim milk",
		"Leek/Asparagus/Herb Soup + Quinoa and Black Beans",
		"veg sandwich can add cheese / mayo",
		"2 toast with Roast and Milkshake",
		"veg",
		"weightGain",
		"1month");
		
insert into diet_plan (breakfast, lunch, snack, dinner, food, goal, time_frame) 
values ("Vegetable Oats and Banana Milkshake",
		"Rice, Vegetables",
		"1 bowl Vegetable soup",
		"Same as lunch",
		"veg",
		"weightGain",
		"2month");
		
insert into diet_plan (breakfast, lunch, snack, dinner, food, goal, time_frame)
values ("Coffee Or Tea + Toast with Ham",
		"Beef steak + Chicken soup",
		"Natural yogurt fat free Or 1 whole fruit",
		"Grilled fish prawn Or grilled Chicken Or Baked fish",
		"nonveg",
		"weightLose",
		"1month");

insert into diet_plan (breakfast, lunch, snack, dinner, food, goal, time_frame) 
values ("2 Boiled Eggs whole milk",
		"Toast with white cheese Tuna Salad",
		"Walnuts Or 1 whole fruit",
		"Green Sepia Tomato salad Or Baked fish",
		"nonveg",
		"weightLose",
		"2month");

insert into diet_plan (breakfast, lunch, snack, dinner, food, goal, time_frame) 
values ("Natural yogurt fat free Seeds and fruit cereal",
		"Cooked dry chickpeas Whole wheat pasta",
		"Walnuts Or 2 pears",
		"Steamed broccoli Baked sweet potato Or Light margarin",
		"veg",
		"weightLose",
		"1month");
		
insert into diet_plan (breakfast, lunch, snack, dinner, food, goal, time_frame) 
values ("Whole milk Toast with white cheese",
		"Veg Salad baby carrots",
		"Walnuts Or low fat cottage cheese",
		"Grilled Sepia Tomato salad Or Lean Protein",
		"veg",
		"weightLose",
		"2month");