select e.name
from employee e
join employee m
on e.id = m.managerid
group by m.managerId
having count(m.managerId) >= 5;