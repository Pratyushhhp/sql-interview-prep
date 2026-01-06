# rounding of lat_n upto 4 decimal places
select round(lat_n,4) from 

# used row_number so that we can have a rank or an index like structure in our table
# so this will give you a index value for every lat_n value and will be in ascending order
(SELECT row_number() 
over(order by lat_n asc) as rnk, lat_n from station) a

# we take the highest index value and divided it by 2 so that we get the middle number
# we round it to 0 decimal places so that incase we have a total value of 9, when we divide it we won't get a decimal value index to search for
where rnk = (
    select round(count(*)/2) from station
)