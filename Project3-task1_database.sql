use project3;

create table job_data (
ds date,
job_id int,
actor_id int,
event varchar(50),
language varchar(50),
time_spent int,
org varchar(50)
);

INSERT INTO  job_data
VALUES 
(str_to_date('11-30-2020', '%m-%d-%Y'), 21, 1001, 'skip', 'English', 15, 'A'),
(str_to_date('11-30-2020', '%m-%d-%Y'), 22, 1006, 'transfer', 'Arabic', 25, 'B'),
(str_to_date('11-29-2020', '%m-%d-%Y'), 23, 1003, 'decision', 'Persian', 20, 'C'),
(str_to_date('11-28-2020', '%m-%d-%Y'), 23, 1005, 'transfer', 'Persian', 22, 'D'),
(str_to_date('11-28-2020', '%m-%d-%Y'), 25, 1002, 'decision', 'Hindi', 11, 'B'),
(str_to_date('11-27-2020', '%m-%d-%Y'), 11, 1007, 'decision', 'French', 104, 'D'),
(str_to_date('11-26-2020', '%m-%d-%Y'), 23, 1004, 'skip', 'Persian', 56, 'A'),
(str_to_date('11-25-2020', '%m-%d-%Y'), 20, 1003, 'transfer', 'Italian', 45, 'C');

select * from job_data;
