-- 1. Write an SQL query to calculate the weekly user engagement.

select user_id, week(occurred_at) as week_number, count(*) as engagement_count
from events
where event_type = 'engagement'
group by user_id, week(occurred_at);


-- 2. Write an SQL query to calculate the user growth for the product.

select date(created_at) as registration_date, count(distinct user_id) as new_users
from users
group by date(created_at)
order by date(created_at);


-- 3. Write an SQL query to calculate the weekly retention of users based on their sign-up cohort.

select cohort_week, retention_week, count(distinct user_id) as retained_users
from ( 
select u.user_id, week(u.created_at) as cohort_week, 
timestampdiff(week, u.created_at, e.occurred_at) as retention_week
from users u join events e
on u.user_id = e.user_id
where e.event_type = 'engagement' and week(e.occurred_at) >= week(u.created_at)
) as retention_data
group by cohort_week, retention_week
order by cohort_week, retention_week;


-- 4. Write an SQL query to calculate the weekly engagement per device.

select week(occurred_at) as week_number, device, count(*) as engagement_count
from events
where event_type = 'engagement'
group by week(occurred_at), device
order by engagement_count desc;


-- 5. Write an SQL query to calculate the email engagement metrics.

select action, count(distinct user_id) as engaged_user,
count(*) as total_engagements
from email_events
group by action;