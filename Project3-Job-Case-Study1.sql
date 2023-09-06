-- 1. Write an SQL query to calculate the number of jobs reviewed per hour for each day in November 2020.

SELECT 
  DATE_FORMAT(ds, '%Y-%m-%d') AS review_date,
  HOUR(ds) AS review_hour,
  COUNT(*) AS jobs_reviewed_per_hour
FROM job_data
WHERE ds >= '2020-11-01' AND ds < '2020-12-01'
GROUP BY review_date, review_hour
ORDER BY review_date, review_hour;

-- 2. Write an SQL query to calculate the 7-day rolling average of throughput. 
-- Additionally, explain whether you prefer using the daily metric or the 7-day rolling average for throughput, 
-- and why.

SELECT ds,
COUNT(event) / 86400.0 AS throughput
FROM job_data
GROUP BY ds
ORDER BY ds;


-- 3. Write an SQL query to calculate the percentage share of each language over the last 30 days.

SELECT language, COUNT(event) AS language_count, 
(COUNT(event) * 100.0) / (SELECT COUNT(event)
FROM job_data
WHERE ds >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) AND ds <= CURDATE()
) AS percentage_share
FROM job_data
WHERE ds >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) AND ds <= CURDATE()
GROUP BY language;


-- 4. Write an SQL query to display duplicate rows from the job_data table.

SELECT *
FROM job_data
WHERE (actor_id, event, language, time_spent, org, ds) 
IN (
    SELECT actor_id, event, language, time_spent, org, ds
    FROM job_data
    GROUP BY actor_id, event, language, time_spent, org, ds
    HAVING COUNT(*) > 1
);
