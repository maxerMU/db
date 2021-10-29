with CTE(bookmaker_country, bookmakers_count) AS (
    SELECT country, COUNT(*) as Total
    FROM bookmakers
    GROUP BY country
)
SELECT AVG(bookmakers_count) as AvgBookmakersInCountry
FROM CTE


