#select statements to display name, grade and marks
#case statement is to put a condition that whenever the grade will be more than 8 we will display name or else null

select 
    case 
        when g.grade >= 8 then s.name
        else null
    end as name,
    g.grade,
    s.marks
from students s

# there is no specific column to match the two tables 
# so marks will always lie between it's min and max value so we can take a condition of that to join the two tables

join grades g 
on s.marks between g.min_mark and g.max_mark
order by g.grade desc,

# another case condition for the ordering of the result on the basis of grades more than 8 or less than 8
case
    when g.grade >= 8 then s.name
    else s.marks
end asc