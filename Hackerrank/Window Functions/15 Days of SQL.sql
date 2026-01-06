
SELECT
  s1.submission_date,
  (
    SELECT COUNT(DISTINCT s2.hacker_id)
    FROM submissions s2
    WHERE s2.submission_date = s1.submission_date
      AND (
        SELECT COUNT(DISTINCT s3.submission_date)
        FROM submissions s3
        WHERE s3.hacker_id = s2.hacker_id
          AND s3.submission_date < s1.submission_date
      ) = DATEDIFF(s1.submission_date, '2016-03-01')
  ) AS unique_count,
  (
    SELECT s2.hacker_id
    FROM submissions s2
    WHERE s2.submission_date = s1.submission_date
    GROUP BY s2.hacker_id
    ORDER BY COUNT(s2.submission_id) DESC, s2.hacker_id
    LIMIT 1
  ) AS hacker_id,
  (
    SELECT h.name
    FROM hackers h
    WHERE h.hacker_id = (
      SELECT s2.hacker_id
      FROM submissions s2
      WHERE s2.submission_date = s1.submission_date
      GROUP BY s2.hacker_id
      ORDER BY COUNT(s2.submission_id) DESC, s2.hacker_id
      LIMIT 1
    )
  ) AS name
FROM (
  SELECT DISTINCT submission_date
  FROM submissions
) AS s1
ORDER BY s1.submission_date;
