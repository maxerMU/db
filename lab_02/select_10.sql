SELECT name,
CASE
WHEN date_part('year', now()) - foundation_date < 10 THEN 'new'
WHEN date_part('year', now()) - foundation_date < 25 THEN 'mid'
WHEN date_part('year', now()) - foundation_date < 50 THEN 'old'
ELSE 'very old'
END AS is_old
FROM bookmakers
