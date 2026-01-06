SELECT
    h.hacker_id,
    h.name,
    SUM(best.max_score) AS total_score
FROM Hackers AS h
JOIN (
    SELECT
        s.hacker_id,
        s.challenge_id,
        MAX(s.score) AS max_score
    FROM Submissions AS s
    GROUP BY s.hacker_id, s.challenge_id
) AS best
  ON best.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(best.max_score) > 0
order by total_score desc, h.hacker_id asc;