SELECT name
FROM bookmakers
WHERE foundation_date > ALL (SELECT foundation_date
                             FROM bookmakers
                             WHERE country = 'Brazil');
