
SELECT c.*
    SUM(ss.total_submissions),
    SUM(ss.total_accepted_submissions),
    SUM(vs.total_views),
    SUM(vs.total_unique_views)
FROM Contests c
JOIN Colleges col ON col.contest_id = c.contest_id
JOIN Challenges ch ON ch.college_id = col.college_id
LEFT JOIN (
  SELECT challenge_id,
    SUM(total_views) AS total_views,
    SUM(total_unique_views) AS total_unique_views
  FROM View_Stats
  GROUP BY challenge_id
) vs ON vs.challenge_id = ch.challenge_id
LEFT JOIN (
  SELECT challenge_id,
    SUM(total_submissions) AS total_submissions,
    SUM(total_accepted_submissions) AS total_accepted_submissions
  FROM Submission_Stats
  GROUP BY challenge_id
) ss ON ss.challenge_id = ch.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name;