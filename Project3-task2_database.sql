# Importing data from excel to MySQL
# Excel files must be stored in path C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/

create database Project3;
use project3;

# Table1- users dataset
create table users (
user_id int,
created_at varchar(100),
company_id int,
language varchar(50),
activated_at varchar(100),
state varchar(50)
);

# Check path of MySQL workbench
show variables like 'secure_file_priv';

# Load excel file using path
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Table-1 users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- convert str to datetime format for created_at column
alter table users add column temp_created_at datetime;
update users set temp_created_at = str_to_date(created_at, '%d-%m-%Y %H:%i');
alter table users drop column created_at;
alter table users change column temp_created_at created_at datetime;

-- convert str to datetime format for activated_at column
alter table users add column temp_activated_at datetime;
update users set temp_activated_at = str_to_date(activated_at, '%d-%m-%Y %H:%i');
alter table users drop column activated_at;
alter table users change column temp_activated_at activated_at datetime;

select * from users;

# Table2- events dataset
create table events (
user_id int,
occurred_at varchar(100),
event_type varchar(50),
event_name varchar(100),
location varchar(50),
device varchar(50),
user_type int
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Table-2 events.csv"
INTO TABLE events
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

desc events;

-- convert str to datetime format for occurred_at column
alter table events add column temp_occurred_at datetime;
update events set temp_occurred_at = str_to_date(occurred_at, '%d-%m-%Y %H:%i');
alter table events drop column occurred_at;
alter table events change column temp_occurred_at occurred_at datetime;

select * from events;

# Table3- email_events dataset
create table email_events (
user_id int,
occurred_at varchar(100),
action varchar(100),
user_type int
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Table-3 email_events.csv"
INTO TABLE email_events
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- convert str to datetime format for occurred_at column
alter table email_events add column temp_occurred_at datetime;
update email_events set temp_occurred_at = str_to_date(occurred_at, '%d-%m-%Y %H:%i');
alter table email_events drop column occurred_at;
alter table email_events change column temp_occurred_at occurred_at datetime;

select * from email_events;