BEGIN;

with CTE(bookmaker_country, bookmakers_count) AS (
            SELECT country, COUNT(*) as Total
            FROM bookmakers
            GROUP BY country
)


SELECT *
FROM CTE
UNION           
SELECT count(bookmakers_count) as AvgBookmakersInCountry
FROM CTE;


COMMIT;
