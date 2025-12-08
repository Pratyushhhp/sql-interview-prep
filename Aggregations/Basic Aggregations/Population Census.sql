select sum(city.population)
from city as city
join country country
on city.countrycode = country.code
where country.continent = 'asia'
