select h.hacker_id, h.name
from submissions s
join challenges c on s.challenge_id = c.challenge_id
join difficulty d on c.difficulty_level = d.difficulty_level
join hackers h on s.hacker_id = h.hacker_id
where s.score = d.score
group by h.hacker_id, h.name
having count(distinct c.challenge_id) > 1
order by count(distinct c.challenge_id) desc, h.hacker_id asc;

