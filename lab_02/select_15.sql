SELECT country, AVG(foundation_date) as AvgFoundationDate
FROM bookmakers
GROUP BY country
HAVING AVG(foundation_date) > (SELECT AVG(foundation_date)
                               FROM bookmakers)
