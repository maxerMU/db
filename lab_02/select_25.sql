select t.country
FROM (select row_number() OVER (PARTITION BY country
                          ORDER BY country) rown, country
      FROM bookmakers) t
WHERE t.rown=1;
