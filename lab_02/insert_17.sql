INSERT INTO bets
SELECT (SELECT MAX(bookmakers.pk)
        FROM bookmakers
        WHERE bookmakers.country='Brazil'), 10, customers.pk, 0, 0, 100, 0
       FROM customers
       WHERE customers.country = 'Brazil'
        
