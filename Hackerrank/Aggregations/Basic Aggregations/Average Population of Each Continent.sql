select co.continent, floor(avg(c.population))
from country co
join city c
on co.code = c.countrycode
group by co.continent
