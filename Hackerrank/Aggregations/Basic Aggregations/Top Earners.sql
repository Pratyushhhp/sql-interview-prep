select salary * months as total_earnings, count(*)
from employee
group by total_earnings
order by total_earnings DESC
limit 1
