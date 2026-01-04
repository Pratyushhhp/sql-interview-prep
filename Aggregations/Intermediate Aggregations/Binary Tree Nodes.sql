select b.n, 
    case
        when p is null then "Root"
        when (
            select count(*)
            from bst
            where b.n = p)=0
        then "Leaf"
        else "Inner"
        END
from bst b
order by b.n