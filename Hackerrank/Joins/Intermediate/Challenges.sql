select h.hacker_id, h.name, count(c.challenge_id) as cnt
from hackers h 
join challenges c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having cnt = (
    select count(c2.challenge_id) as cmax
    from challenges c2
    group by c2.hacker_id
    order by cmax desc 
    limit 1
)
or cnt IN (
    select c_unique
    from (
        select count(c3.challenge_id) as c_unique
        from challenges c3
        group by c3.hacker_id
    ) t
    group by c_unique
    having count(*) = 1
)
order by cnt desc, h.hacker_id asc;