select distinct f1.x, f1.y
from functions f1
join functions f2 on f1.x = f2.y and f1.y = f2.x
where f1.x < f1.y or 
f1.x in (
    select x from functions
    where x = y
    group by x, y
    having count(*) > 1 
)
order by f1.x;
