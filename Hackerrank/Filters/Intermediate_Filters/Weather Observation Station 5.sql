(select city, length(city)
from station
order by length(city) desc, city ASC
limit 1)
UNION
(select city, length(city)
from station
order by length(city) asc, city ASC
limit 1)