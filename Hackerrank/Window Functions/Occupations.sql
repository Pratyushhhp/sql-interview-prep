
SET @rDoctor=0, @rProfessor=0, @rSinger=0, @rActor=0;

SELECT
  MIN(Doctor)   AS Doctor,
  MIN(Professor) AS Professor,
  MIN(Singer)   AS Singer,
  MIN(Actor)    AS Actor
FROM (
  SELECT
    CASE WHEN Occupation='Doctor'   THEN (@rDoctor:=@rDoctor+1)
         WHEN Occupation='Professor' THEN (@rProfessor:=@rProfessor+1)
         WHEN Occupation='Singer'    THEN (@rSinger:=@rSinger+1)
         WHEN Occupation='Actor'     THEN (@rActor:=@rActor+1)
    END AS rn,
    CASE WHEN Occupation='Doctor'   THEN Name END AS Doctor,
    CASE WHEN Occupation='Professor' THEN Name END AS Professor,
    CASE WHEN Occupation='Singer'    THEN Name END AS Singer,
    CASE WHEN Occupation='Actor'     THEN Name END AS Actor
  FROM occupations
  ORDER BY Name
) t
GROUP BY rn
ORDER BY rn;
