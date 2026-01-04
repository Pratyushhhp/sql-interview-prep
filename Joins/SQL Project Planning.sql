/*
Enter your query here.
*/

SELECT 
    s.start_date, 
    min(e.end_date)
from (
    SELECT start_date from projects
    where start_date not in (SELECT end_date from projects)
) s,
(SELECT end_date
from projects
where end_date not in (SELECT start_date from projects)) e
where s.start_date < e.end_date
GROUP by s.start_date
order by (min(e.end_date) - s.start_date),
s.start_date;
