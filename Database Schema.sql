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
	time_frame varchar(10) NOT NULL
);

create table diet_plan (
	diet_id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
	breakfast int NOT NULL,
	lunch int NOT NULL,
	snack int NOT NULL,
	dinner varchar(6) NOT NULL,
	food varchar(20) NOT NULL,
	goal varchar(20) NOT NULL,
	time_frame varchar(10) NOT NULL,
	start_date datetime NOT NULL DEFAULT CURDATE(),
	end_date datetime NOT NULL,
);

create table diet_track {
	daily_date datetime NOT NULL,
	flag boolean NOT NULL
}